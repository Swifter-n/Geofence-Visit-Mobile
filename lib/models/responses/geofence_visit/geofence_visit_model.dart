import 'package:freezed_annotation/freezed_annotation.dart';

part 'geofence_visit_model.freezed.dart';
part 'geofence_visit_model.g.dart';

@freezed
class GeofenceVisitModel with _$GeofenceVisitModel {
  const factory GeofenceVisitModel({
    required int id,
    @JsonKey(name: 'vehicle_id') required String vehicleId,
    @JsonKey(name: 'vehicle_alias') required String vehicleAlias,
    @JsonKey(name: 'rute_id') required String ruteId,
    @JsonKey(name: 'gps_time') required String? gpsTime,
    @JsonKey(name: 'outlet_site_id') required String outletSiteId,
    @JsonKey(name: 'outlet_name') required String outletName,
    @JsonKey(name: 'delivery_type') required String? deliveryType,
    @JsonKey(name: 'is_valid_schedule') required bool isValidSchedule,
    @JsonKey(name: 'entry_time') required String entryTime,
    @JsonKey(name: 'exit_time') required String? exitTime,
    @JsonKey(name: 'entry_temp') required double entryTemp,
    @JsonKey(name: 'exit_temp') required double exitTemp,
    @JsonKey(name: 'entry_dist_m') required double entryDistM,
    @JsonKey(name: 'min_dist_m') required double minDistM,
    @JsonKey(name: 'duration_min') required int durationMin,
    required String status,
    @JsonKey(name: 'is_mobile') required bool isMobile,
    @JsonKey(name: 'created_at') required String? createdAt,
    @JsonKey(name: 'updated_at') required String? updatedAt,
  }) = _GeofenceVisitModel;

  factory GeofenceVisitModel.fromJson(Map<String, dynamic> json) =>
      _$GeofenceVisitModelFromJson(json);
}