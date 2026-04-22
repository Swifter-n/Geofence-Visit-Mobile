// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geofence_visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeofenceVisitModelImpl _$$GeofenceVisitModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GeofenceVisitModelImpl(
      id: (json['id'] as num).toInt(),
      vehicleId: json['vehicle_id'] as String,
      vehicleAlias: json['vehicle_alias'] as String,
      ruteId: json['rute_id'] as String,
      gpsTime: json['gps_time'] as String?,
      outletSiteId: json['outlet_site_id'] as String,
      outletName: json['outlet_name'] as String,
      deliveryType: json['delivery_type'] as String?,
      isValidSchedule: json['is_valid_schedule'] as bool,
      entryTime: json['entry_time'] as String,
      exitTime: json['exit_time'] as String?,
      entryTemp: (json['entry_temp'] as num).toDouble(),
      exitTemp: (json['exit_temp'] as num).toDouble(),
      entryDistM: (json['entry_dist_m'] as num).toDouble(),
      minDistM: (json['min_dist_m'] as num).toDouble(),
      durationMin: (json['duration_min'] as num).toInt(),
      status: json['status'] as String,
      isMobile: json['is_mobile'] as bool,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$GeofenceVisitModelImplToJson(
        _$GeofenceVisitModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicle_id': instance.vehicleId,
      'vehicle_alias': instance.vehicleAlias,
      'rute_id': instance.ruteId,
      'gps_time': instance.gpsTime,
      'outlet_site_id': instance.outletSiteId,
      'outlet_name': instance.outletName,
      'delivery_type': instance.deliveryType,
      'is_valid_schedule': instance.isValidSchedule,
      'entry_time': instance.entryTime,
      'exit_time': instance.exitTime,
      'entry_temp': instance.entryTemp,
      'exit_temp': instance.exitTemp,
      'entry_dist_m': instance.entryDistM,
      'min_dist_m': instance.minDistM,
      'duration_min': instance.durationMin,
      'status': instance.status,
      'is_mobile': instance.isMobile,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
