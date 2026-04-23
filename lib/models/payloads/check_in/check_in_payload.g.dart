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
      entryTime: json['entry_time'] as String?,
      exitTime: json['exit_time'] as String?,
      gpsTime: json['gps_time'] as String?,
    );

Map<String, dynamic> _$$CheckInPayloadImplToJson(
        _$CheckInPayloadImpl instance) =>
    <String, dynamic>{
      'vehicle_id': instance.vehicleId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'outlet_site_id': instance.outletSiteId,
      'vehicle_alias': instance.vehicleAlias,
      'rute_id': instance.ruteId,
      'outlet_name': instance.outletName,
      'delivery_type': instance.deliveryType,
      'entry_time': instance.entryTime,
      'exit_time': instance.exitTime,
      'gps_time': instance.gpsTime,
    };
