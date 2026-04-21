// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_in_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckInPayloadImpl _$$CheckInPayloadImplFromJson(Map<String, dynamic> json) =>
    _$CheckInPayloadImpl(
      vehicleId: json['vehicle_id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      outletSiteId: json['outlet_site_id'] as String,
      vehicleAlias: json['vehicle_alias'] as String?,
      ruteId: json['rute_id'] as String?,
      outletName: json['outlet_name'] as String?,
      deliveryType: json['delivery_type'] as String?,
      entryTemp: (json['entry_temp'] as num?)?.toDouble(),
      exitTemp: (json['exit_temp'] as num?)?.toDouble(),
      gpsTime: json['gps_time'] as String?,
    );

Map<String, dynamic> _$$CheckInPayloadImplToJson(
  _$CheckInPayloadImpl instance,
) => <String, dynamic>{
  'vehicle_id': instance.vehicleId,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'outlet_site_id': instance.outletSiteId,
  'vehicle_alias': instance.vehicleAlias,
  'rute_id': instance.ruteId,
  'outlet_name': instance.outletName,
  'delivery_type': instance.deliveryType,
  'entry_temp': instance.entryTemp,
  'exit_temp': instance.exitTemp,
  'gps_time': instance.gpsTime,
};
