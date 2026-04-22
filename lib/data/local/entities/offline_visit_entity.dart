import 'package:isar/isar.dart';

part 'offline_visit_entity.g.dart';

@collection
class OfflineVisitEntity {
  Id id = Isar.autoIncrement;

  late String type;
  late String payloadJson;
  late DateTime timestamp;
  short syncStatus = 0; // 0: pending, 1: synced
  String? localPhotoPath;
}
