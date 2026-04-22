import 'dart:convert';
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

  /// Return [bool]: true jika masuk mode offline, false jika sukses online
  Future<bool> submitCheckIn(CheckInPayload payload) async {
    final isOnline = await _isConnected();

    if (isOnline) {
      try {
        final response = await apiClient.post(
          'mobile/geofence/check-in',
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
          'mobile/geofence/check-out',
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

  /// Fungsi untuk sinkronisasi antrean Isar ke Server
  Future<void> syncOfflineVisits() async {
    final isOnline = await _isConnected();
    if (!isOnline) return; // Jika belum online, batalkan sync

    final pendingVisits = await localDb.getPendingVisits();
    if (pendingVisits.isEmpty) return; // Tidak ada antrean

    for (final visit in pendingVisits) {
      try {
        final payload = jsonDecode(visit.payloadJson);
        final endpoint = visit.type == 'check_in'
            ? 'mobile/geofence/check-in'
            : 'mobile/geofence/check-out';

        final response = await apiClient.post(endpoint, payload);

        if (response.statusCode >= 200 && response.statusCode < 300) {
          // Jika berhasil masuk server, update status menjadi synced (1)
          final isar = await localDb.db;
          await isar.writeTxn(() async {
            visit.syncStatus = 1;
            await isar.offlineVisitEntitys.put(visit);
          });
        }
      } catch (e) {
        // Jika satu gagal (misal server tiba-tiba mati lagi), lanjut ke antrean berikutnya atau biarkan statusnya tetap 0 (pending)
        continue;
      }
    }
  }

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
