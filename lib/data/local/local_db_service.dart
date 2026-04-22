import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'entities/offline_visit_entity.dart';

class LocalDbService {
  late Future<Isar> db;

  LocalDbService() {
    db = initDb();
  }

  Future<Isar> initDb() async {
    // Cek apakah instance Isar sudah terbuka agar tidak double connection
    if (Isar.instanceNames.isEmpty) {
      String? path;
      
      // Jika berjalan di platform selain Web (Android/iOS), kita butuh path folder
      if (!kIsWeb) {
        final dir = await getApplicationDocumentsDirectory();
        path = dir.path;
      }

      return await Isar.open(
        [OfflineVisitEntitySchema], // Skema yang akan di-generate
        directory: path ?? '',      // Web akan menggunakan string kosong
        inspector: !kReleaseMode,   // Mengaktifkan Isar Inspector saat mode debug
      );
    }
    return Future.value(Isar.getInstance());
  }

  /// Fungsi untuk menyimpan antrean offline baru
  Future<void> saveOfflineVisit(OfflineVisitEntity visit) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.offlineVisitEntitys.put(visit);
    });
  }

  /// Fungsi untuk mengambil semua data yang masih 'pending' (status = 0)
  Future<List<OfflineVisitEntity>> getPendingVisits() async {
    final isar = await db;
    return await isar.offlineVisitEntitys
        .filter()
        .syncStatusEqualTo(0) // Hanya ambil yang pending
        .sortByTimestamp()
        .findAll();
  }
}