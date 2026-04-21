import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_in_payload.freezed.dart';
part 'check_in_payload.g.dart';

@freezed
class CheckInPayload with _$CheckInPayload {
  const factory CheckInPayload({
    @JsonKey(name: 'vehicle_id') required String vehicleId,
    required double latitude,
    required double longitude,
    @JsonKey(name: 'outlet_site_id') required String outletSiteId,
    @JsonKey(name: 'vehicle_alias') String? vehicleAlias,
    @JsonKey(name: 'rute_id') String? ruteId,
    @JsonKey(name: 'outlet_name') String? outletName,
    @JsonKey(name: 'delivery_type') String? deliveryType,
    @JsonKey(name: 'entry_temp') double? entryTemp,
    @JsonKey(name: 'exit_temp') double? exitTemp,
    @JsonKey(name: 'gps_time') String? gpsTime,
    // photos dikirim sebagai multipart, tidak di sini
  }) = _CheckInPayload;

  factory CheckInPayload.fromJson(Map<String, dynamic> json) =>
      _$CheckInPayloadFromJson(json);
}