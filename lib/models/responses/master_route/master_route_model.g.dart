// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_route_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MasterRouteModelImpl _$$MasterRouteModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MasterRouteModelImpl(
      outletSiteId: json['outlet_site_id'] as String,
      outletName: json['outlet_name'] as String,
      ruteId: json['rute_id'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      radius: (json['radius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$MasterRouteModelImplToJson(
        _$MasterRouteModelImpl instance) =>
    <String, dynamic>{
      'outlet_site_id': instance.outletSiteId,
      'outlet_name': instance.outletName,
      'rute_id': instance.ruteId,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'radius': instance.radius,
    };
