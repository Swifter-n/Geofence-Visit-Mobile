import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_out_payload.freezed.dart';
part 'check_out_payload.g.dart';

@freezed
class CheckOutPayload with _$CheckOutPayload {
  const factory CheckOutPayload({
    @JsonKey(name: 'vehicle_id') required String vehicleId,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'outlet_site_id') required String outletSiteId,
    @JsonKey(name: 'vehicle_alias') String? vehicleAlias,
    @JsonKey(name: 'rute_id') String? ruteId,
    @JsonKey(name: 'exit_time') String? exitTime,
    @JsonKey(name: 'gps_time') String? gpsTime,
  }) = _CheckOutPayload;

  factory CheckOutPayload.fromJson(Map<String, dynamic> json) =>
      _$CheckOutPayloadFromJson(json);
}
