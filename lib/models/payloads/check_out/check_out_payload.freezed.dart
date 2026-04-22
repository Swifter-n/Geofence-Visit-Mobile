// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'check_out_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckOutPayload _$CheckOutPayloadFromJson(Map<String, dynamic> json) {
  return _CheckOutPayload.fromJson(json);
}

/// @nodoc
mixin _$CheckOutPayload {
  @JsonKey(name: 'vehicle_id')
  String get vehicleId => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'outlet_site_id')
  String get outletSiteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_alias')
  String? get vehicleAlias => throw _privateConstructorUsedError;
  @JsonKey(name: 'exit_temp')
  double? get exitTemp => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_time')
  String? get gpsTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckOutPayloadCopyWith<CheckOutPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOutPayloadCopyWith<$Res> {
  factory $CheckOutPayloadCopyWith(
          CheckOutPayload value, $Res Function(CheckOutPayload) then) =
      _$CheckOutPayloadCopyWithImpl<$Res, CheckOutPayload>;
  @useResult
  $Res call(
      {@JsonKey(name: 'vehicle_id') String vehicleId,
      double latitude,
      double longitude,
      @JsonKey(name: 'outlet_site_id') String outletSiteId,
      @JsonKey(name: 'vehicle_alias') String? vehicleAlias,
      @JsonKey(name: 'exit_temp') double? exitTemp,
      @JsonKey(name: 'gps_time') String? gpsTime});
}

/// @nodoc
class _$CheckOutPayloadCopyWithImpl<$Res, $Val extends CheckOutPayload>
    implements $CheckOutPayloadCopyWith<$Res> {
  _$CheckOutPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? outletSiteId = null,
    Object? vehicleAlias = freezed,
    Object? exitTemp = freezed,
    Object? gpsTime = freezed,
  }) {
    return _then(_value.copyWith(
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
      exitTemp: freezed == exitTemp
          ? _value.exitTemp
          : exitTemp // ignore: cast_nullable_to_non_nullable
              as double?,
      gpsTime: freezed == gpsTime
          ? _value.gpsTime
          : gpsTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CheckOutPayloadImplCopyWith<$Res>
    implements $CheckOutPayloadCopyWith<$Res> {
  factory _$$CheckOutPayloadImplCopyWith(_$CheckOutPayloadImpl value,
          $Res Function(_$CheckOutPayloadImpl) then) =
      __$$CheckOutPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'vehicle_id') String vehicleId,
      double latitude,
      double longitude,
      @JsonKey(name: 'outlet_site_id') String outletSiteId,
      @JsonKey(name: 'vehicle_alias') String? vehicleAlias,
      @JsonKey(name: 'exit_temp') double? exitTemp,
      @JsonKey(name: 'gps_time') String? gpsTime});
}

/// @nodoc
class __$$CheckOutPayloadImplCopyWithImpl<$Res>
    extends _$CheckOutPayloadCopyWithImpl<$Res, _$CheckOutPayloadImpl>
    implements _$$CheckOutPayloadImplCopyWith<$Res> {
  __$$CheckOutPayloadImplCopyWithImpl(
      _$CheckOutPayloadImpl _value, $Res Function(_$CheckOutPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleId = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? outletSiteId = null,
    Object? vehicleAlias = freezed,
    Object? exitTemp = freezed,
    Object? gpsTime = freezed,
  }) {
    return _then(_$CheckOutPayloadImpl(
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
      exitTemp: freezed == exitTemp
          ? _value.exitTemp
          : exitTemp // ignore: cast_nullable_to_non_nullable
              as double?,
      gpsTime: freezed == gpsTime
          ? _value.gpsTime
          : gpsTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckOutPayloadImpl implements _CheckOutPayload {
  const _$CheckOutPayloadImpl(
      {@JsonKey(name: 'vehicle_id') required this.vehicleId,
      required this.latitude,
      required this.longitude,
      @JsonKey(name: 'outlet_site_id') required this.outletSiteId,
      @JsonKey(name: 'vehicle_alias') this.vehicleAlias,
      @JsonKey(name: 'exit_temp') this.exitTemp,
      @JsonKey(name: 'gps_time') this.gpsTime});

  factory _$CheckOutPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckOutPayloadImplFromJson(json);

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
  @JsonKey(name: 'exit_temp')
  final double? exitTemp;
  @override
  @JsonKey(name: 'gps_time')
  final String? gpsTime;

  @override
  String toString() {
    return 'CheckOutPayload(vehicleId: $vehicleId, latitude: $latitude, longitude: $longitude, outletSiteId: $outletSiteId, vehicleAlias: $vehicleAlias, exitTemp: $exitTemp, gpsTime: $gpsTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckOutPayloadImpl &&
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
            (identical(other.exitTemp, exitTemp) ||
                other.exitTemp == exitTemp) &&
            (identical(other.gpsTime, gpsTime) || other.gpsTime == gpsTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, vehicleId, latitude, longitude,
      outletSiteId, vehicleAlias, exitTemp, gpsTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckOutPayloadImplCopyWith<_$CheckOutPayloadImpl> get copyWith =>
      __$$CheckOutPayloadImplCopyWithImpl<_$CheckOutPayloadImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckOutPayloadImplToJson(
      this,
    );
  }
}

abstract class _CheckOutPayload implements CheckOutPayload {
  const factory _CheckOutPayload(
          {@JsonKey(name: 'vehicle_id') required final String vehicleId,
          required final double latitude,
          required final double longitude,
          @JsonKey(name: 'outlet_site_id') required final String outletSiteId,
          @JsonKey(name: 'vehicle_alias') final String? vehicleAlias,
          @JsonKey(name: 'exit_temp') final double? exitTemp,
          @JsonKey(name: 'gps_time') final String? gpsTime}) =
      _$CheckOutPayloadImpl;

  factory _CheckOutPayload.fromJson(Map<String, dynamic> json) =
      _$CheckOutPayloadImpl.fromJson;

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
  @JsonKey(name: 'exit_temp')
  double? get exitTemp;
  @override
  @JsonKey(name: 'gps_time')
  String? get gpsTime;
  @override
  @JsonKey(ignore: true)
  _$$CheckOutPayloadImplCopyWith<_$CheckOutPayloadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
