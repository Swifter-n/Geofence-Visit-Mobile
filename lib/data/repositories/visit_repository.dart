import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geofence_visit_mobile/data/local/entities/offline_visit_entity.dart';
import 'package:geofence_visit_mobile/data/local/local_db_service.dart';
import 'package:geofence_visit_mobile/data/network/api_client.dart';
import 'package:geofence_visit_mobile/models/payloads/check_in/check_in_payload.dart';
import 'package:geofence_visit_mobile/models/payloads/check_out/check_out_payload.dart';

class VisitRepository {
  final ApiClient apiClient;
  final LocalDbService localDb;
  final Connectivity connectivity;

  VisitRepository({
    required this.apiClient,
    required this.localDb,
    required this.connectivity,
  });

  Future<bool> _isConnected() async {
    final List<ConnectivityResult> connectivityResult = await connectivity
        .checkConnectivity();
    return !connectivityResult.contains(ConnectivityResult.none);
  }

  /// Return [bool]: true jika masuk mode offline, fkalse jika sukses online
  Future<bool> submitCheckIn(
    CheckInPayload payload,
    List<String> photoPaths,
  ) async {
    final isOnline = await _isConnected();

    if (isOnline) {
      try {
        final response = await apiClient.post(
          '/mobile/check-in',
          payload.toJson(),
        );
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return false; // Sukses online
        } else {
          throw Exception('Server error: ${response.statusCode}');
        }
      } catch (e) {
        await _saveToLocal(type: 'check_in', payload: payload.toJson());
        return true; // Gagal online (timeout/error), masuk offline
      }
    } else {
      await _saveToLocal(type: 'check_in', payload: payload.toJson());
      return true; // Murni offline
    }
  }

  /// Return [bool]: true jika masuk mode offline, false jika sukses online
  Future<bool> submitCheckOut(CheckOutPayload payload) async {
    final isOnline = await _isConnected();

    if (isOnline) {
      try {
        final response = await apiClient.post(
          '/mobile/check-out',
          payload.toJson(),
        );
        if (response.statusCode >= 200 && response.statusCode < 300) {
          return false;
        } else {
          throw Exception('Server error: ${response.statusCode}');
        }
      } catch (e) {
        await _saveToLocal(type: 'check_out', payload: payload.toJson());
        return true;
      }
    } else {
      await _saveToLocal(type: 'check_out', payload: payload.toJson());
      return true;
    }
  }

  Future<int> syncOfflineVisits() async {
    final isOnline = await _isConnected();
    if (!isOnline) {
      throw Exception('Gagal sinkronisasi: Tidak ada koneksi internet.');
    }

    // Ambil data yang masih nyangkut
    final unsyncedData = await localDb.getUnsyncedVisits();
    if (unsyncedData.isEmpty) return 0;

    int successCount = 0;

    for (var item in unsyncedData) {
      try {
        final Map<String, dynamic> payloadMap = jsonDecode(item.payloadJson);
        List<String> photoPaths = [];

        if (item.localPhotoPath != null) {
          final List decodedPhotos = jsonDecode(item.localPhotoPath!);
          photoPaths = decodedPhotos.cast<String>();
        }

        http.Response response;
        String endpoint = item.type == 'check_in'
            ? 'mobile/check-in'
            : 'mobile/check-out';

        // Tembak API (Pilih format JSON biasa atau Multipart jika ada foto)
        if (photoPaths.isNotEmpty) {
          final Map<String, String> stringPayload = payloadMap.map(
            (key, value) => MapEntry(key.toString(), value.toString()),
          );
          response = await apiClient.postMultipart(
            endpoint,
            stringPayload,
            photoPaths,
          );
        } else {
          response = await apiClient.post(endpoint, payloadMap);
        }

        if (response.statusCode >= 200 && response.statusCode < 300) {
          // Jika sukses dikirim, update status di lokal menjadi 1 (Sudah Sinkron)
          item.syncStatus = 1;
          await localDb.saveOfflineVisit(item);
          successCount++;
        }
      } catch (e) {
        // Jika 1 data gagal (misal server down), abaikan dan lanjut coba data berikutnya
        continue;
      }
    }

    return successCount;
  }

  /// Fungsi untuk sinkronisasi antrean Isar ke Server
  // Future<void> syncOfflineVisits() async {
  //   final isOnline = await _isConnected();
  //   if (!isOnline) return; // Jika belum online, batalkan sync

  //   final pendingVisits = await localDb.getPendingVisits();
  //   if (pendingVisits.isEmpty) return; // Tidak ada antrean

  //   for (final visit in pendingVisits) {
  //     try {
  //       final payload = jsonDecode(visit.payloadJson);
  //       final endpoint = visit.type == 'check_in'
  //           ? 'mobile/geofence/check-in'
  //           : 'mobile/geofence/check-out';

  //       final response = await apiClient.post(endpoint, payload);

  //       if (response.statusCode >= 200 && response.statusCode < 300) {
  //         // Jika berhasil masuk server, update status menjadi synced (1)
  //         final isar = await localDb.db;
  //         await isar.writeTxn(() async {
  //           visit.syncStatus = 1;
  //           await isar.offlineVisitEntitys.put(visit);
  //         });
  //       }
  //     } catch (e) {
  //       // Jika satu gagal (misal server tiba-tiba mati lagi), lanjut ke antrean berikutnya atau biarkan statusnya tetap 0 (pending)
  //       continue;
  //     }
  //   }
  // }

  Future<void> _saveToLocal({
    required String type,
    required Map<String, dynamic> payload,
  }) async {
    final entity = OfflineVisitEntity()
      ..type = type
      ..payloadJson = jsonEncode(payload)
      ..timestamp = DateTime.now()
      ..syncStatus = 0;

    await localDb.saveOfflineVisit(entity);
  }
}
