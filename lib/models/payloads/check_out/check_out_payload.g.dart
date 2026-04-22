// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_out_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckOutPayloadImpl _$$CheckOutPayloadImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckOutPayloadImpl(
      vehicleId: json['vehicle_id'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      outletSiteId: json['outlet_site_id'] as String,
      vehicleAlias: json['vehicle_alias'] as String?,
      exitTemp: (json['exit_temp'] as num?)?.toDouble(),
      gpsTime: json['gps_time'] as String?,
    );

Map<String, dynamic> _$$CheckOutPayloadImplToJson(
        _$CheckOutPayloadImpl instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'outlet_site_id': instance.outletSiteId,
      'vehicle_alias': instance.vehicleAlias,
      'exit_temp': instance.exitTemp,
      'gps_time': instance.gpsTime,
    };
