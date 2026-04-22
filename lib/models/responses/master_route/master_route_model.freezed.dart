// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'master_route_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MasterRouteModel _$MasterRouteModelFromJson(Map<String, dynamic> json) {
  return _MasterRouteModel.fromJson(json);
}

/// @nodoc
mixin _$MasterRouteModel {
  @JsonKey(name: 'outlet_site_id')
  String get outletSiteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'outlet_name')
  String get outletName => throw _privateConstructorUsedError;
  @JsonKey(name: 'rute_id')
  String? get ruteId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MasterRouteModelCopyWith<MasterRouteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MasterRouteModelCopyWith<$Res> {
  factory $MasterRouteModelCopyWith(
          MasterRouteModel value, $Res Function(MasterRouteModel) then) =
      _$MasterRouteModelCopyWithImpl<$Res, MasterRouteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'outlet_site_id') String outletSiteId,
      @JsonKey(name: 'outlet_name') String outletName,
      @JsonKey(name: 'rute_id') String? ruteId});
}

/// @nodoc
class _$MasterRouteModelCopyWithImpl<$Res, $Val extends MasterRouteModel>
    implements $MasterRouteModelCopyWith<$Res> {
  _$MasterRouteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletSiteId = null,
    Object? outletName = null,
    Object? ruteId = freezed,
  }) {
    return _then(_value.copyWith(
      outletSiteId: null == outletSiteId
          ? _value.outletSiteId
          : outletSiteId // ignore: cast_nullable_to_non_nullable
              as String,
      outletName: null == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String,
      ruteId: freezed == ruteId
          ? _value.ruteId
          : ruteId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MasterRouteModelImplCopyWith<$Res>
    implements $MasterRouteModelCopyWith<$Res> {
  factory _$$MasterRouteModelImplCopyWith(_$MasterRouteModelImpl value,
          $Res Function(_$MasterRouteModelImpl) then) =
      __$$MasterRouteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'outlet_site_id') String outletSiteId,
      @JsonKey(name: 'outlet_name') String outletName,
      @JsonKey(name: 'rute_id') String? ruteId});
}

/// @nodoc
class __$$MasterRouteModelImplCopyWithImpl<$Res>
    extends _$MasterRouteModelCopyWithImpl<$Res, _$MasterRouteModelImpl>
    implements _$$MasterRouteModelImplCopyWith<$Res> {
  __$$MasterRouteModelImplCopyWithImpl(_$MasterRouteModelImpl _value,
      $Res Function(_$MasterRouteModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? outletSiteId = null,
    Object? outletName = null,
    Object? ruteId = freezed,
  }) {
    return _then(_$MasterRouteModelImpl(
      outletSiteId: null == outletSiteId
          ? _value.outletSiteId
          : outletSiteId // ignore: cast_nullable_to_non_nullable
              as String,
      outletName: null == outletName
          ? _value.outletName
          : outletName // ignore: cast_nullable_to_non_nullable
              as String,
      ruteId: freezed == ruteId
          ? _value.ruteId
          : ruteId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MasterRouteModelImpl implements _MasterRouteModel {
  const _$MasterRouteModelImpl(
      {@JsonKey(name: 'outlet_site_id') required this.outletSiteId,
      @JsonKey(name: 'outlet_name') required this.outletName,
      @JsonKey(name: 'rute_id') this.ruteId});

  factory _$MasterRouteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MasterRouteModelImplFromJson(json);

  @override
  @JsonKey(name: 'outlet_site_id')
  final String outletSiteId;
  @override
  @JsonKey(name: 'outlet_name')
  final String outletName;
  @override
  @JsonKey(name: 'rute_id')
  final String? ruteId;

  @override
  String toString() {
    return 'MasterRouteModel(outletSiteId: $outletSiteId, outletName: $outletName, ruteId: $ruteId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MasterRouteModelImpl &&
            (identical(other.outletSiteId, outletSiteId) ||
                other.outletSiteId == outletSiteId) &&
            (identical(other.outletName, outletName) ||
                other.outletName == outletName) &&
            (identical(other.ruteId, ruteId) || other.ruteId == ruteId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, outletSiteId, outletName, ruteId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MasterRouteModelImplCopyWith<_$MasterRouteModelImpl> get copyWith =>
      __$$MasterRouteModelImplCopyWithImpl<_$MasterRouteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MasterRouteModelImplToJson(
      this,
    );
  }
}

abstract class _MasterRouteModel implements MasterRouteModel {
  const factory _MasterRouteModel(
      {@JsonKey(name: 'outlet_site_id') required final String outletSiteId,
      @JsonKey(name: 'outlet_name') required final String outletName,
      @JsonKey(name: 'rute_id') final String? ruteId}) = _$MasterRouteModelImpl;

  factory _MasterRouteModel.fromJson(Map<String, dynamic> json) =
      _$MasterRouteModelImpl.fromJson;

  @override
  @JsonKey(name: 'outlet_site_id')
  String get outletSiteId;
  @override
  @JsonKey(name: 'outlet_name')
  String get outletName;
  @override
  @JsonKey(name: 'rute_id')
  String? get ruteId;
  @override
  @JsonKey(ignore: true)
  _$$MasterRouteModelImplCopyWith<_$MasterRouteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
