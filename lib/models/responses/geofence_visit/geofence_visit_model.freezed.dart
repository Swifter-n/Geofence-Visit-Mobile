// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geofence_visit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GeofenceVisitModel _$GeofenceVisitModelFromJson(Map<String, dynamic> json) {
  return _GeofenceVisitModel.fromJson(json);
}

/// @nodoc
mixin _$GeofenceVisitModel {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_id')
  String get vehicleId => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_alias')
  String get vehicleAlias => throw _privateConstructorUsedError;
  @JsonKey(name: 'rute_id')
  String get ruteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'gps_time')
  String? get gpsTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'outlet_site_id')
  String get outletSiteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'outlet_name')
  String get outletName => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_type')
  String? get deliveryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_valid_schedule')
  bool get isValidSchedule => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_time')
  String get entryTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'exit_time')
  String? get exitTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_temp')
  double get entryTemp => throw _privateConstructorUsedError;
  @JsonKey(name: 'exit_temp')
  double get exitTemp => throw _privateConstructorUsedError;
  @JsonKey(name: 'entry_dist_m')
  double get entryDistM => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_dist_m')
  double get minDistM => throw _privateConstructorUsedError;
  @JsonKey(name: 'duration_min')
  int get durationMin => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_mobile')
  bool get isMobile => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this GeofenceVisitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GeofenceVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GeofenceVisitModelCopyWith<GeofenceVisitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeofenceVisitModelCopyWith<$Res> {
  factory $GeofenceVisitModelCopyWith(
    GeofenceVisitModel value,
    $Res Function(GeofenceVisitModel) then,
  ) = _$GeofenceVisitModelCopyWithImpl<$Res, GeofenceVisitModel>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'vehicle_id') String vehicleId,
    @JsonKey(name: 'vehicle_alias') String vehicleAlias,
    @JsonKey(name: 'rute_id') String ruteId,
    @JsonKey(name: 'gps_time') String? gpsTime,
    @JsonKey(name: 'outlet_site_id') String outletSiteId,
    @JsonKey(name: 'outlet_name') String outletName,
    @JsonKey(name: 'delivery_type') String? deliveryType,
    @JsonKey(name: 'is_valid_schedule') bool isValidSchedule,
    @JsonKey(name: 'entry_time') String entryTime,
    @JsonKey(name: 'exit_time') String? exitTime,
    @JsonKey(name: 'entry_temp') double entryTemp,
    @JsonKey(name: 'exit_temp') double exitTemp,
    @JsonKey(name: 'entry_dist_m') double entryDistM,
    @JsonKey(name: 'min_dist_m') double minDistM,
    @JsonKey(name: 'duration_min') int durationMin,
    String status,
    @JsonKey(name: 'is_mobile') bool isMobile,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class _$GeofenceVisitModelCopyWithImpl<$Res, $Val extends GeofenceVisitModel>
    implements $GeofenceVisitModelCopyWith<$Res> {
  _$GeofenceVisitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeofenceVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleId = null,
    Object? vehicleAlias = null,
    Object? ruteId = null,
    Object? gpsTime = freezed,
    Object? outletSiteId = null,
    Object? outletName = null,
    Object? deliveryType = freezed,
    Object? isValidSchedule = null,
    Object? entryTime = null,
    Object? exitTime = freezed,
    Object? entryTemp = null,
    Object? exitTemp = null,
    Object? entryDistM = null,
    Object? minDistM = null,
    Object? durationMin = null,
    Object? status = null,
    Object? isMobile = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            vehicleId: null == vehicleId
                ? _value.vehicleId
                : vehicleId // ignore: cast_nullable_to_non_nullable
                      as String,
            vehicleAlias: null == vehicleAlias
                ? _value.vehicleAlias
                : vehicleAlias // ignore: cast_nullable_to_non_nullable
                      as String,
            ruteId: null == ruteId
                ? _value.ruteId
                : ruteId // ignore: cast_nullable_to_non_nullable
                      as String,
            gpsTime: freezed == gpsTime
                ? _value.gpsTime
                : gpsTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            outletSiteId: null == outletSiteId
                ? _value.outletSiteId
                : outletSiteId // ignore: cast_nullable_to_non_nullable
                      as String,
            outletName: null == outletName
                ? _value.outletName
                : outletName // ignore: cast_nullable_to_non_nullable
                      as String,
            deliveryType: freezed == deliveryType
                ? _value.deliveryType
                : deliveryType // ignore: cast_nullable_to_non_nullable
                      as String?,
            isValidSchedule: null == isValidSchedule
                ? _value.isValidSchedule
                : isValidSchedule // ignore: cast_nullable_to_non_nullable
                      as bool,
            entryTime: null == entryTime
                ? _value.entryTime
                : entryTime // ignore: cast_nullable_to_non_nullable
                      as String,
            exitTime: freezed == exitTime
                ? _value.exitTime
                : exitTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            entryTemp: null == entryTemp
                ? _value.entryTemp
                : entryTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            exitTemp: null == exitTemp
                ? _value.exitTemp
                : exitTemp // ignore: cast_nullable_to_non_nullable
                      as double,
            entryDistM: null == entryDistM
                ? _value.entryDistM
                : entryDistM // ignore: cast_nullable_to_non_nullable
                      as double,
            minDistM: null == minDistM
                ? _value.minDistM
                : minDistM // ignore: cast_nullable_to_non_nullable
                      as double,
            durationMin: null == durationMin
                ? _value.durationMin
                : durationMin // ignore: cast_nullable_to_non_nullable
                      as int,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            isMobile: null == isMobile
                ? _value.isMobile
                : isMobile // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GeofenceVisitModelImplCopyWith<$Res>
    implements $GeofenceVisitModelCopyWith<$Res> {
  factory _$$GeofenceVisitModelImplCopyWith(
    _$GeofenceVisitModelImpl value,
    $Res Function(_$GeofenceVisitModelImpl) then,
  ) = __$$GeofenceVisitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'vehicle_id') String vehicleId,
    @JsonKey(name: 'vehicle_alias') String vehicleAlias,
    @JsonKey(name: 'rute_id') String ruteId,
    @JsonKey(name: 'gps_time') String? gpsTime,
    @JsonKey(name: 'outlet_site_id') String outletSiteId,
    @JsonKey(name: 'outlet_name') String outletName,
    @JsonKey(name: 'delivery_type') String? deliveryType,
    @JsonKey(name: 'is_valid_schedule') bool isValidSchedule,
    @JsonKey(name: 'entry_time') String entryTime,
    @JsonKey(name: 'exit_time') String? exitTime,
    @JsonKey(name: 'entry_temp') double entryTemp,
    @JsonKey(name: 'exit_temp') double exitTemp,
    @JsonKey(name: 'entry_dist_m') double entryDistM,
    @JsonKey(name: 'min_dist_m') double minDistM,
    @JsonKey(name: 'duration_min') int durationMin,
    String status,
    @JsonKey(name: 'is_mobile') bool isMobile,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  });
}

/// @nodoc
class __$$GeofenceVisitModelImplCopyWithImpl<$Res>
    extends _$GeofenceVisitModelCopyWithImpl<$Res, _$GeofenceVisitModelImpl>
    implements _$$GeofenceVisitModelImplCopyWith<$Res> {
  __$$GeofenceVisitModelImplCopyWithImpl(
    _$GeofenceVisitModelImpl _value,
    $Res Function(_$GeofenceVisitModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GeofenceVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? vehicleId = null,
    Object? vehicleAlias = null,
    Object? ruteId = null,
    Object? gpsTime = freezed,
    Object? outletSiteId = null,
    Object? outletName = null,
    Object? deliveryType = freezed,
    Object? isValidSchedule = null,
    Object? entryTime = null,
    Object? exitTime = freezed,
    Object? entryTemp = null,
    Object? exitTemp = null,
    Object? entryDistM = null,
    Object? minDistM = null,
    Object? durationMin = null,
    Object? status = null,
    Object? isMobile = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$GeofenceVisitModelImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        vehicleId: null == vehicleId
            ? _value.vehicleId
            : vehicleId // ignore: cast_nullable_to_non_nullable
                  as String,
        vehicleAlias: null == vehicleAlias
            ? _value.vehicleAlias
            : vehicleAlias // ignore: cast_nullable_to_non_nullable
                  as String,
        ruteId: null == ruteId
            ? _value.ruteId
            : ruteId // ignore: cast_nullable_to_non_nullable
                  as String,
        gpsTime: freezed == gpsTime
            ? _value.gpsTime
            : gpsTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        outletSiteId: null == outletSiteId
            ? _value.outletSiteId
            : outletSiteId // ignore: cast_nullable_to_non_nullable
                  as String,
        outletName: null == outletName
            ? _value.outletName
            : outletName // ignore: cast_nullable_to_non_nullable
                  as String,
        deliveryType: freezed == deliveryType
            ? _value.deliveryType
            : deliveryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        isValidSchedule: null == isValidSchedule
            ? _value.isValidSchedule
            : isValidSchedule // ignore: cast_nullable_to_non_nullable
                  as bool,
        entryTime: null == entryTime
            ? _value.entryTime
            : entryTime // ignore: cast_nullable_to_non_nullable
                  as String,
        exitTime: freezed == exitTime
            ? _value.exitTime
            : exitTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        entryTemp: null == entryTemp
            ? _value.entryTemp
            : entryTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        exitTemp: null == exitTemp
            ? _value.exitTemp
            : exitTemp // ignore: cast_nullable_to_non_nullable
                  as double,
        entryDistM: null == entryDistM
            ? _value.entryDistM
            : entryDistM // ignore: cast_nullable_to_non_nullable
                  as double,
        minDistM: null == minDistM
            ? _value.minDistM
            : minDistM // ignore: cast_nullable_to_non_nullable
                  as double,
        durationMin: null == durationMin
            ? _value.durationMin
            : durationMin // ignore: cast_nullable_to_non_nullable
                  as int,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        isMobile: null == isMobile
            ? _value.isMobile
            : isMobile // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GeofenceVisitModelImpl implements _GeofenceVisitModel {
  const _$GeofenceVisitModelImpl({
    required this.id,
    @JsonKey(name: 'vehicle_id') required this.vehicleId,
    @JsonKey(name: 'vehicle_alias') required this.vehicleAlias,
    @JsonKey(name: 'rute_id') required this.ruteId,
    @JsonKey(name: 'gps_time') required this.gpsTime,
    @JsonKey(name: 'outlet_site_id') required this.outletSiteId,
    @JsonKey(name: 'outlet_name') required this.outletName,
    @JsonKey(name: 'delivery_type') required this.deliveryType,
    @JsonKey(name: 'is_valid_schedule') required this.isValidSchedule,
    @JsonKey(name: 'entry_time') required this.entryTime,
    @JsonKey(name: 'exit_time') required this.exitTime,
    @JsonKey(name: 'entry_temp') required this.entryTemp,
    @JsonKey(name: 'exit_temp') required this.exitTemp,
    @JsonKey(name: 'entry_dist_m') required this.entryDistM,
    @JsonKey(name: 'min_dist_m') required this.minDistM,
    @JsonKey(name: 'duration_min') required this.durationMin,
    required this.status,
    @JsonKey(name: 'is_mobile') required this.isMobile,
    @JsonKey(name: 'created_at') required this.createdAt,
    @JsonKey(name: 'updated_at') required this.updatedAt,
  });

  factory _$GeofenceVisitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GeofenceVisitModelImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'vehicle_id')
  final String vehicleId;
  @override
  @JsonKey(name: 'vehicle_alias')
  final String vehicleAlias;
  @override
  @JsonKey(name: 'rute_id')
  final String ruteId;
  @override
  @JsonKey(name: 'gps_time')
  final String? gpsTime;
  @override
  @JsonKey(name: 'outlet_site_id')
  final String outletSiteId;
  @override
  @JsonKey(name: 'outlet_name')
  final String outletName;
  @override
  @JsonKey(name: 'delivery_type')
  final String? deliveryType;
  @override
  @JsonKey(name: 'is_valid_schedule')
  final bool isValidSchedule;
  @override
  @JsonKey(name: 'entry_time')
  final String entryTime;
  @override
  @JsonKey(name: 'exit_time')
  final String? exitTime;
  @override
  @JsonKey(name: 'entry_temp')
  final double entryTemp;
  @override
  @JsonKey(name: 'exit_temp')
  final double exitTemp;
  @override
  @JsonKey(name: 'entry_dist_m')
  final double entryDistM;
  @override
  @JsonKey(name: 'min_dist_m')
  final double minDistM;
  @override
  @JsonKey(name: 'duration_min')
  final int durationMin;
  @override
  final String status;
  @override
  @JsonKey(name: 'is_mobile')
  final bool isMobile;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'GeofenceVisitModel(id: $id, vehicleId: $vehicleId, vehicleAlias: $vehicleAlias, ruteId: $ruteId, gpsTime: $gpsTime, outletSiteId: $outletSiteId, outletName: $outletName, deliveryType: $deliveryType, isValidSchedule: $isValidSchedule, entryTime: $entryTime, exitTime: $exitTime, entryTemp: $entryTemp, exitTemp: $exitTemp, entryDistM: $entryDistM, minDistM: $minDistM, durationMin: $durationMin, status: $status, isMobile: $isMobile, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeofenceVisitModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.vehicleId, vehicleId) ||
                other.vehicleId == vehicleId) &&
            (identical(other.vehicleAlias, vehicleAlias) ||
                other.vehicleAlias == vehicleAlias) &&
            (identical(other.ruteId, ruteId) || other.ruteId == ruteId) &&
            (identical(other.gpsTime, gpsTime) || other.gpsTime == gpsTime) &&
            (identical(other.outletSiteId, outletSiteId) ||
                other.outletSiteId == outletSiteId) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.deliveryType, deliveryType) ||
                other.deliveryType == deliveryType) &&
            (identical(other.isValidSchedule, isValidSchedule) ||
                other.isValidSchedule == isValidSchedule) &&
            (identical(other.entryTime, entryTime) ||
                other.entryTime == entryTime) &&
            (identical(other.exitTime, exitTime) ||
                other.exitTime == exitTime) &&
            (identical(other.entryTemp, entryTemp) ||
                other.entryTemp == entryTemp) &&
            (identical(other.exitTemp, exitTemp) ||
                other.exitTemp == exitTemp) &&
            (identical(other.entryDistM, entryDistM) ||
                other.entryDistM == entryDistM) &&
            (identical(other.minDistM, minDistM) ||
                other.minDistM == minDistM) &&
            (identical(other.durationMin, durationMin) ||
                other.durationMin == durationMin) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isMobile, isMobile) ||
                other.isMobile == isMobile) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    vehicleId,
    vehicleAlias,
    ruteId,
    gpsTime,
    outletSiteId,
    outletName,
    deliveryType,
    isValidSchedule,
    entryTime,
    exitTime,
    entryTemp,
    exitTemp,
    entryDistM,
    minDistM,
    durationMin,
    status,
    isMobile,
    createdAt,
    updatedAt,
  ]);

  /// Create a copy of GeofenceVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GeofenceVisitModelImplCopyWith<_$GeofenceVisitModelImpl> get copyWith =>
      __$$GeofenceVisitModelImplCopyWithImpl<_$GeofenceVisitModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$GeofenceVisitModelImplToJson(this);
  }
}

abstract class _GeofenceVisitModel implements GeofenceVisitModel {
  const factory _GeofenceVisitModel({
    required final int id,
    @JsonKey(name: 'vehicle_id') required final String vehicleId,
    @JsonKey(name: 'vehicle_alias') required final String vehicleAlias,
    @JsonKey(name: 'rute_id') required final String ruteId,
    @JsonKey(name: 'gps_time') required final String? gpsTime,
    @JsonKey(name: 'outlet_site_id') required final String outletSiteId,
    @JsonKey(name: 'outlet_name') required final String outletName,
    @JsonKey(name: 'delivery_type') required final String? deliveryType,
    @JsonKey(name: 'is_valid_schedule') required final bool isValidSchedule,
    @JsonKey(name: 'entry_time') required final String entryTime,
    @JsonKey(name: 'exit_time') required final String? exitTime,
    @JsonKey(name: 'entry_temp') required final double entryTemp,
    @JsonKey(name: 'exit_temp') required final double exitTemp,
    @JsonKey(name: 'entry_dist_m') required final double entryDistM,
    @JsonKey(name: 'min_dist_m') required final double minDistM,
    @JsonKey(name: 'duration_min') required final int durationMin,
    required final String status,
    @JsonKey(name: 'is_mobile') required final bool isMobile,
    @JsonKey(name: 'created_at') required final String? createdAt,
    @JsonKey(name: 'updated_at') required final String? updatedAt,
  }) = _$GeofenceVisitModelImpl;

  factory _GeofenceVisitModel.fromJson(Map<String, dynamic> json) =
      _$GeofenceVisitModelImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'vehicle_id')
  String get vehicleId;
  @override
  @JsonKey(name: 'vehicle_alias')
  String get vehicleAlias;
  @override
  @JsonKey(name: 'rute_id')
  String get ruteId;
  @override
  @JsonKey(name: 'gps_time')
  String? get gpsTime;
  @override
  @JsonKey(name: 'outlet_site_id')
  String get outletSiteId;
  @override
  @JsonKey(name: 'outlet_name')
  String get outletName;
  @override
  @JsonKey(name: 'delivery_type')
  String? get deliveryType;
  @override
  @JsonKey(name: 'is_valid_schedule')
  bool get isValidSchedule;
  @override
  @JsonKey(name: 'entry_time')
  String get entryTime;
  @override
  @JsonKey(name: 'exit_time')
  String? get exitTime;
  @override
  @JsonKey(name: 'entry_temp')
  double get entryTemp;
  @override
  @JsonKey(name: 'exit_temp')
  double get exitTemp;
  @override
  @JsonKey(name: 'entry_dist_m')
  double get entryDistM;
  @override
  @JsonKey(name: 'min_dist_m')
  double get minDistM;
  @override
  @JsonKey(name: 'duration_min')
  int get durationMin;
  @override
  String get status;
  @override
  @JsonKey(name: 'is_mobile')
  bool get isMobile;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of GeofenceVisitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GeofenceVisitModelImplCopyWith<_$GeofenceVisitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
