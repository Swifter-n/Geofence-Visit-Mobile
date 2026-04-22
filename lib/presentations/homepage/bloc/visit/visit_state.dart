part of 'visit_bloc.dart';

@freezed
class VisitState with _$VisitState {
  const factory VisitState.initial() = _Initial;
  const factory VisitState.loading() = _Loading;
  const factory VisitState.success({
    required String message, 
    @Default(false) bool isOffline,
  }) = _Success;
  const factory VisitState.error(String message) = _Error;
}