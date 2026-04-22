// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'visit_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VisitEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckInPayload payload) submitCheckIn,
    required TResult Function(CheckOutPayload payload) submitCheckOut,
    required TResult Function() syncOfflineData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckInPayload payload)? submitCheckIn,
    TResult? Function(CheckOutPayload payload)? submitCheckOut,
    TResult? Function()? syncOfflineData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckInPayload payload)? submitCheckIn,
    TResult Function(CheckOutPayload payload)? submitCheckOut,
    TResult Function()? syncOfflineData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubmitCheckIn value) submitCheckIn,
    required TResult Function(_SubmitCheckOut value) submitCheckOut,
    required TResult Function(_SyncOfflineData value) syncOfflineData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmitCheckIn value)? submitCheckIn,
    TResult? Function(_SubmitCheckOut value)? submitCheckOut,
    TResult? Function(_SyncOfflineData value)? syncOfflineData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmitCheckIn value)? submitCheckIn,
    TResult Function(_SubmitCheckOut value)? submitCheckOut,
    TResult Function(_SyncOfflineData value)? syncOfflineData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitEventCopyWith<$Res> {
  factory $VisitEventCopyWith(
          VisitEvent value, $Res Function(VisitEvent) then) =
      _$VisitEventCopyWithImpl<$Res, VisitEvent>;
}

/// @nodoc
class _$VisitEventCopyWithImpl<$Res, $Val extends VisitEvent>
    implements $VisitEventCopyWith<$Res> {
  _$VisitEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SubmitCheckInImplCopyWith<$Res> {
  factory _$$SubmitCheckInImplCopyWith(
          _$SubmitCheckInImpl value, $Res Function(_$SubmitCheckInImpl) then) =
      __$$SubmitCheckInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckInPayload payload});

  $CheckInPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$SubmitCheckInImplCopyWithImpl<$Res>
    extends _$VisitEventCopyWithImpl<$Res, _$SubmitCheckInImpl>
    implements _$$SubmitCheckInImplCopyWith<$Res> {
  __$$SubmitCheckInImplCopyWithImpl(
      _$SubmitCheckInImpl _value, $Res Function(_$SubmitCheckInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$SubmitCheckInImpl(
      null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as CheckInPayload,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckInPayloadCopyWith<$Res> get payload {
    return $CheckInPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc

class _$SubmitCheckInImpl implements _SubmitCheckIn {
  const _$SubmitCheckInImpl(this.payload);

  @override
  final CheckInPayload payload;

  @override
  String toString() {
    return 'VisitEvent.submitCheckIn(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitCheckInImpl &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitCheckInImplCopyWith<_$SubmitCheckInImpl> get copyWith =>
      __$$SubmitCheckInImplCopyWithImpl<_$SubmitCheckInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckInPayload payload) submitCheckIn,
    required TResult Function(CheckOutPayload payload) submitCheckOut,
    required TResult Function() syncOfflineData,
  }) {
    return submitCheckIn(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckInPayload payload)? submitCheckIn,
    TResult? Function(CheckOutPayload payload)? submitCheckOut,
    TResult? Function()? syncOfflineData,
  }) {
    return submitCheckIn?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckInPayload payload)? submitCheckIn,
    TResult Function(CheckOutPayload payload)? submitCheckOut,
    TResult Function()? syncOfflineData,
    required TResult orElse(),
  }) {
    if (submitCheckIn != null) {
      return submitCheckIn(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubmitCheckIn value) submitCheckIn,
    required TResult Function(_SubmitCheckOut value) submitCheckOut,
    required TResult Function(_SyncOfflineData value) syncOfflineData,
  }) {
    return submitCheckIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmitCheckIn value)? submitCheckIn,
    TResult? Function(_SubmitCheckOut value)? submitCheckOut,
    TResult? Function(_SyncOfflineData value)? syncOfflineData,
  }) {
    return submitCheckIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmitCheckIn value)? submitCheckIn,
    TResult Function(_SubmitCheckOut value)? submitCheckOut,
    TResult Function(_SyncOfflineData value)? syncOfflineData,
    required TResult orElse(),
  }) {
    if (submitCheckIn != null) {
      return submitCheckIn(this);
    }
    return orElse();
  }
}

abstract class _SubmitCheckIn implements VisitEvent {
  const factory _SubmitCheckIn(final CheckInPayload payload) =
      _$SubmitCheckInImpl;

  CheckInPayload get payload;
  @JsonKey(ignore: true)
  _$$SubmitCheckInImplCopyWith<_$SubmitCheckInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitCheckOutImplCopyWith<$Res> {
  factory _$$SubmitCheckOutImplCopyWith(_$SubmitCheckOutImpl value,
          $Res Function(_$SubmitCheckOutImpl) then) =
      __$$SubmitCheckOutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CheckOutPayload payload});

  $CheckOutPayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$$SubmitCheckOutImplCopyWithImpl<$Res>
    extends _$VisitEventCopyWithImpl<$Res, _$SubmitCheckOutImpl>
    implements _$$SubmitCheckOutImplCopyWith<$Res> {
  __$$SubmitCheckOutImplCopyWithImpl(
      _$SubmitCheckOutImpl _value, $Res Function(_$SubmitCheckOutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payload = null,
  }) {
    return _then(_$SubmitCheckOutImpl(
      null == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as CheckOutPayload,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $CheckOutPayloadCopyWith<$Res> get payload {
    return $CheckOutPayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc

class _$SubmitCheckOutImpl implements _SubmitCheckOut {
  const _$SubmitCheckOutImpl(this.payload);

  @override
  final CheckOutPayload payload;

  @override
  String toString() {
    return 'VisitEvent.submitCheckOut(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitCheckOutImpl &&
            (identical(other.payload, payload) || other.payload == payload));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payload);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitCheckOutImplCopyWith<_$SubmitCheckOutImpl> get copyWith =>
      __$$SubmitCheckOutImplCopyWithImpl<_$SubmitCheckOutImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckInPayload payload) submitCheckIn,
    required TResult Function(CheckOutPayload payload) submitCheckOut,
    required TResult Function() syncOfflineData,
  }) {
    return submitCheckOut(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckInPayload payload)? submitCheckIn,
    TResult? Function(CheckOutPayload payload)? submitCheckOut,
    TResult? Function()? syncOfflineData,
  }) {
    return submitCheckOut?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckInPayload payload)? submitCheckIn,
    TResult Function(CheckOutPayload payload)? submitCheckOut,
    TResult Function()? syncOfflineData,
    required TResult orElse(),
  }) {
    if (submitCheckOut != null) {
      return submitCheckOut(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubmitCheckIn value) submitCheckIn,
    required TResult Function(_SubmitCheckOut value) submitCheckOut,
    required TResult Function(_SyncOfflineData value) syncOfflineData,
  }) {
    return submitCheckOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmitCheckIn value)? submitCheckIn,
    TResult? Function(_SubmitCheckOut value)? submitCheckOut,
    TResult? Function(_SyncOfflineData value)? syncOfflineData,
  }) {
    return submitCheckOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmitCheckIn value)? submitCheckIn,
    TResult Function(_SubmitCheckOut value)? submitCheckOut,
    TResult Function(_SyncOfflineData value)? syncOfflineData,
    required TResult orElse(),
  }) {
    if (submitCheckOut != null) {
      return submitCheckOut(this);
    }
    return orElse();
  }
}

abstract class _SubmitCheckOut implements VisitEvent {
  const factory _SubmitCheckOut(final CheckOutPayload payload) =
      _$SubmitCheckOutImpl;

  CheckOutPayload get payload;
  @JsonKey(ignore: true)
  _$$SubmitCheckOutImplCopyWith<_$SubmitCheckOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncOfflineDataImplCopyWith<$Res> {
  factory _$$SyncOfflineDataImplCopyWith(_$SyncOfflineDataImpl value,
          $Res Function(_$SyncOfflineDataImpl) then) =
      __$$SyncOfflineDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SyncOfflineDataImplCopyWithImpl<$Res>
    extends _$VisitEventCopyWithImpl<$Res, _$SyncOfflineDataImpl>
    implements _$$SyncOfflineDataImplCopyWith<$Res> {
  __$$SyncOfflineDataImplCopyWithImpl(
      _$SyncOfflineDataImpl _value, $Res Function(_$SyncOfflineDataImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SyncOfflineDataImpl implements _SyncOfflineData {
  const _$SyncOfflineDataImpl();

  @override
  String toString() {
    return 'VisitEvent.syncOfflineData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SyncOfflineDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CheckInPayload payload) submitCheckIn,
    required TResult Function(CheckOutPayload payload) submitCheckOut,
    required TResult Function() syncOfflineData,
  }) {
    return syncOfflineData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CheckInPayload payload)? submitCheckIn,
    TResult? Function(CheckOutPayload payload)? submitCheckOut,
    TResult? Function()? syncOfflineData,
  }) {
    return syncOfflineData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CheckInPayload payload)? submitCheckIn,
    TResult Function(CheckOutPayload payload)? submitCheckOut,
    TResult Function()? syncOfflineData,
    required TResult orElse(),
  }) {
    if (syncOfflineData != null) {
      return syncOfflineData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SubmitCheckIn value) submitCheckIn,
    required TResult Function(_SubmitCheckOut value) submitCheckOut,
    required TResult Function(_SyncOfflineData value) syncOfflineData,
  }) {
    return syncOfflineData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SubmitCheckIn value)? submitCheckIn,
    TResult? Function(_SubmitCheckOut value)? submitCheckOut,
    TResult? Function(_SyncOfflineData value)? syncOfflineData,
  }) {
    return syncOfflineData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SubmitCheckIn value)? submitCheckIn,
    TResult Function(_SubmitCheckOut value)? submitCheckOut,
    TResult Function(_SyncOfflineData value)? syncOfflineData,
    required TResult orElse(),
  }) {
    if (syncOfflineData != null) {
      return syncOfflineData(this);
    }
    return orElse();
  }
}

abstract class _SyncOfflineData implements VisitEvent {
  const factory _SyncOfflineData() = _$SyncOfflineDataImpl;
}

/// @nodoc
mixin _$VisitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message, bool isOffline) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, bool isOffline)? success,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, bool isOffline)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VisitStateCopyWith<$Res> {
  factory $VisitStateCopyWith(
          VisitState value, $Res Function(VisitState) then) =
      _$VisitStateCopyWithImpl<$Res, VisitState>;
}

/// @nodoc
class _$VisitStateCopyWithImpl<$Res, $Val extends VisitState>
    implements $VisitStateCopyWith<$Res> {
  _$VisitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$VisitStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'VisitState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message, bool isOffline) success,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, bool isOffline)? success,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, bool isOffline)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VisitState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$VisitStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'VisitState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message, bool isOffline) success,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, bool isOffline)? success,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, bool isOffline)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements VisitState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message, bool isOffline});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$VisitStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isOffline = null,
  }) {
    return _then(_$SuccessImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isOffline: null == isOffline
          ? _value.isOffline
          : isOffline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({required this.message, this.isOffline = false});

  @override
  final String message;
  @override
  @JsonKey()
  final bool isOffline;

  @override
  String toString() {
    return 'VisitState.success(message: $message, isOffline: $isOffline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isOffline, isOffline) ||
                other.isOffline == isOffline));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isOffline);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message, bool isOffline) success,
    required TResult Function(String message) error,
  }) {
    return success(message, isOffline);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, bool isOffline)? success,
    TResult? Function(String message)? error,
  }) {
    return success?.call(message, isOffline);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, bool isOffline)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message, isOffline);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements VisitState {
  const factory _Success(
      {required final String message, final bool isOffline}) = _$SuccessImpl;

  String get message;
  bool get isOffline;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$VisitStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VisitState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message, bool isOffline) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message, bool isOffline)? success,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message, bool isOffline)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VisitState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
