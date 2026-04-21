// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_in_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CheckInPayload _$CheckInPayloadFromJson(Map<String, dynamic> json) {
  return _CheckInPayload.fromJson(json);
}

/// @nodoc
mixin _$CheckInPayload {
  @JsonKey(name: 'vehicle_id')
  String get vehicleId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'outlet_site_id')
  String get outletSiteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_alias')
  String? get vehicleAlias => throw _privateConstructorUsedError;
  @JsonKey(name: 'rute_id')
  String? get ruteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'outlet_name')
  String? get outletName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_type')
  String? get deliveryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_temp')
  double? get entryTemp => throw _privateConstructorUsedError;
  @JsonKey(name: 'exit_temp')
  double? get exitTemp => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_time')
  String? get gpsTime => throw _privateConstructorUsedError;

  /// Serializes this CheckInPayload to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CheckInPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckInPayloadCopyWith<CheckInPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckInPayloadCopyWith<$Res> {
  factory $CheckInPayloadCopyWith(
    CheckInPayload value,
    $Res Function(CheckInPayload) then,
  ) = _$CheckInPayloadCopyWithImpl<$Res, CheckInPayload>;
  @useResult
  $Res call({
    @JsonKey(name: 'vehicle_id') String vehicleId,
    double latitude,
    double longitude,
    @JsonKey(name: 'outlet_site_id') String outletSiteId,
    @JsonKey(name: 'vehicle_alias') String? vehicleAlias,
    @JsonKey(name: 'rute_id') String? ruteId,
    @JsonKey(name: 'outlet_name') String? outletName,
    @JsonKey(name: 'delivery_type') String? deliveryType,
    @JsonKey(name: 'entry_temp') double? entryTemp,
    @JsonKey(name: 'exit_temp') double? exitTemp,
    @JsonKey(name: 'gps_time') String? gpsTime,
  });
}

/// @nodoc
class _$CheckInPayloadCopyWithImpl<$Res, $Val extends CheckInPayload>
    implements $CheckInPayloadCopyWith<$Res> {
  _$CheckInPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckInPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? outletSiteId = null,
    Object? vehicleAlias = freezed,
    Object? ruteId = freezed,
    Object? outletName = freezed,
    Object? deliveryType = freezed,
    Object? entryTemp = freezed,
    Object? exitTemp = freezed,
    Object? gpsTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            vehicleId: null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                      as String,
            latitude: null == latitude
                ? _value.latitude
                : latitude // ignore: cast_nullable_to_non_nullable
                      as double,
            longitude: null == longitude
                ? _value.longitude
                : longitude // ignore: cast_nullable_to_non_nullable
                      as double,
            outletSiteId: null == outletSiteId
                ? _value.outletSiteId
                : outletSiteId // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleAlias: freezed == vehicleAlias
                ? _value.vehicleAlias
                : vehicleAlias // ignore: cast_nullable_to_non_nullable
                      as String?,
            ruteId: freezed == ruteId
                ? _value.ruteId
                : ruteId // ignore: cast_nullable_to_non_nullable
                      as String?,
            outletName: freezed == outletName
                ? _value.outletName
                : outletName // ignore: cast_nullable_to_non_nullable
                      as String?,
            deliveryType: freezed == deliveryType
                ? _value.deliveryType
                : deliveryType // ignore: cast_nullable_to_non_nullable
                      as String?,
            entryTemp: freezed == entryTemp
                ? _value.entryTemp
                : entryTemp // ignore: cast_nullable_to_non_nullable
                      as double?,
            exitTemp: freezed == exitTemp
                ? _value.exitTemp
                : exitTemp // ignore: cast_nullable_to_non_nullable
                      as double?,
            gpsTime: freezed == gpsTime
                ? _value.gpsTime
                : gpsTime // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckInPayloadImplCopyWith<$Res>
    implements $CheckInPayloadCopyWith<$Res> {
  factory _$$CheckInPayloadImplCopyWith(
    _$CheckInPayloadImpl value,
    $Res Function(_$CheckInPayloadImpl) then,
  ) = __$$CheckInPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'vehicle_id') String vehicleId,
    double latitude,
    double longitude,
    @JsonKey(name: 'outlet_site_id') String outletSiteId,
    @JsonKey(name: 'vehicle_alias') String? vehicleAlias,
    @JsonKey(name: 'rute_id') String? ruteId,
    @JsonKey(name: 'outlet_name') String? outletName,
    @JsonKey(name: 'delivery_type') String? deliveryType,
    @JsonKey(name: 'entry_temp') double? entryTemp,
    @JsonKey(name: 'exit_temp') double? exitTemp,
    @JsonKey(name: 'gps_time') String? gpsTime,
  });
}

/// @nodoc
class __$$CheckInPayloadImplCopyWithImpl<$Res>
    extends _$CheckInPayloadCopyWithImpl<$Res, _$CheckInPayloadImpl>
    implements _$$CheckInPayloadImplCopyWith<$Res> {
  __$$CheckInPayloadImplCopyWithImpl(
    _$CheckInPayloadImpl _value,
    $Res Function(_$CheckInPayloadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckInPayload
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? outletSiteId = null,
    Object? vehicleAlias = freezed,
    Object? ruteId = freezed,
    Object? outletName = freezed,
    Object? deliveryType = freezed,
    Object? entryTemp = freezed,
    Object? exitTemp = freezed,
    Object? gpsTime = freezed,
  }) {
    return _then(
      _$CheckInPayloadImpl(
        vehicleId: null == vehicleId
            ? _value.vehicleId
            : vehicleId // ignore: cast_nullable_to_non_nullable
                  as String,
        latitude: null == latitude
            ? _value.latitude
            : latitude // ignore: cast_nullable_to_non_nullable
                  as double,
        longitude: null == longitude
            ? _value.longitude
            : longitude // ignore: cast_nullable_to_non_nullable
                  as double,
        outletSiteId: null == outletSiteId
            ? _value.outletSiteId
            : outletSiteId // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleAlias: freezed == vehicleAlias
            ? _value.vehicleAlias
            : vehicleAlias // ignore: cast_nullable_to_non_nullable
                  as String?,
        ruteId: freezed == ruteId
            ? _value.ruteId
            : ruteId // ignore: cast_nullable_to_non_nullable
                  as String?,
        outletName: freezed == outletName
            ? _value.outletName
            : outletName // ignore: cast_nullable_to_non_nullable
                  as String?,
        deliveryType: freezed == deliveryType
            ? _value.deliveryType
            : deliveryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        entryTemp: freezed == entryTemp
            ? _value.entryTemp
            : entryTemp // ignore: cast_nullable_to_non_nullable
                  as double?,
        exitTemp: freezed == exitTemp
            ? _value.exitTemp
            : exitTemp // ignore: cast_nullable_to_non_nullable
                  as double?,
        gpsTime: freezed == gpsTime
            ? _value.gpsTime
            : gpsTime // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckInPayloadImpl implements _CheckInPayload {
  const _$CheckInPayloadImpl({
    @JsonKey(name: 'vehicle_id') required this.vehicleId,
    required this.latitude,
    required this.longitude,
    @JsonKey(name: 'outlet_site_id') required this.outletSiteId,
    @JsonKey(name: 'vehicle_alias') this.vehicleAlias,
    @JsonKey(name: 'rute_id') this.ruteId,
    @JsonKey(name: 'outlet_name') this.outletName,
    @JsonKey(name: 'delivery_type') this.deliveryType,
    @JsonKey(name: 'entry_temp') this.entryTemp,
    @JsonKey(name: 'exit_temp') this.exitTemp,
    @JsonKey(name: 'gps_time') this.gpsTime,
  });

  factory _$CheckInPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckInPayloadImplFromJson(json);

  @override
  @JsonKey(name: 'vehicle_id')
  final String vehicleId;
  @override
  final double latitude;
  @override
  final double longitude;
  @override
  @JsonKey(name: 'outlet_site_id')
  final String outletSiteId;
  @override
  @JsonKey(name: 'vehicle_alias')
  final String? vehicleAlias;
  @override
  @JsonKey(name: 'rute_id')
  final String? ruteId;
  @override
  @JsonKey(name: 'outlet_name')
  final String? outletName;
  @override
  @JsonKey(name: 'delivery_type')
  final String? deliveryType;
  @override
  @JsonKey(name: 'entry_temp')
  final double? entryTemp;
  @override
  @JsonKey(name: 'exit_temp')
  final double? exitTemp;
  @override
  @JsonKey(name: 'gps_time')
  final String? gpsTime;

  @override
  String toString() {
    return 'CheckInPayload(vehicleId: $vehicleId, latitude: $latitude, longitude: $longitude, outletSiteId: $outletSiteId, vehicleAlias: $vehicleAlias, ruteId: $ruteId, outletName: $outletName, deliveryType: $deliveryType, entryTemp: $entryTemp, exitTemp: $exitTemp, gpsTime: $gpsTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckInPayloadImpl &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.outletSiteId, outletSiteId) ||
                other.outletSiteId == outletSiteId) &&
            (identical(other.vehicleAlias, vehicleAlias) ||
                other.vehicleAlias == vehicleAlias) &&
            (identical(other.ruteId, ruteId) || other.ruteId == ruteId) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.deliveryType, deliveryType) ||
                other.deliveryType == deliveryType) &&
            (identical(other.entryTemp, entryTemp) ||
                other.entryTemp == entryTemp) &&
            (identical(other.exitTemp, exitTemp) ||
                other.exitTemp == exitTemp) &&
            (identical(other.gpsTime, gpsTime) || other.gpsTime == gpsTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    vehicleId,
    latitude,
    longitude,
    outletSiteId,
    vehicleAlias,
    ruteId,
    outletName,
    deliveryType,
    entryTemp,
    exitTemp,
    gpsTime,
  );

  /// Create a copy of CheckInPayload
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckInPayloadImplCopyWith<_$CheckInPayloadImpl> get copyWith =>
      __$$CheckInPayloadImplCopyWithImpl<_$CheckInPayloadImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckInPayloadImplToJson(this);
  }
}

abstract class _CheckInPayload implements CheckInPayload {
  const factory _CheckInPayload({
    @JsonKey(name: 'vehicle_id') required final String vehicleId,
    required final double latitude,
    required final double longitude,
    @JsonKey(name: 'outlet_site_id') required final String outletSiteId,
    @JsonKey(name: 'vehicle_alias') final String? vehicleAlias,
    @JsonKey(name: 'rute_id') final String? ruteId,
    @JsonKey(name: 'outlet_name') final String? outletName,
    @JsonKey(name: 'delivery_type') final String? deliveryType,
    @JsonKey(name: 'entry_temp') final double? entryTemp,
    @JsonKey(name: 'exit_temp') final double? exitTemp,
    @JsonKey(name: 'gps_time') final String? gpsTime,
  }) = _$CheckInPayloadImpl;

  factory _CheckInPayload.fromJson(Map<String, dynamic> json) =
      _$CheckInPayloadImpl.fromJson;

  @override
  @JsonKey(name: 'vehicle_id')
  String get vehicleId;
  @override
  double get latitude;
  @override
  double get longitude;
  @override
  @JsonKey(name: 'outlet_site_id')
  String get outletSiteId;
  @override
  @JsonKey(name: 'vehicle_alias')
  String? get vehicleAlias;
  @override
  @JsonKey(name: 'rute_id')
  String? get ruteId;
  @override
  @JsonKey(name: 'outlet_name')
  String? get outletName;
  @override
  @JsonKey(name: 'delivery_type')
  String? get deliveryType;
  @override
  @JsonKey(name: 'entry_temp')
  double? get entryTemp;
  @override
  @JsonKey(name: 'exit_temp')
  double? get exitTemp;
  @override
  @JsonKey(name: 'gps_time')
  String? get gpsTime;

  /// Create a copy of CheckInPayload
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckInPayloadImplCopyWith<_$CheckInPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
