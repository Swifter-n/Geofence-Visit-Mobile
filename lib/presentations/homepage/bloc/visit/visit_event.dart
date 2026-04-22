part of 'visit_bloc.dart';

@freezed
class VisitEvent with _$VisitEvent {
  const factory VisitEvent.submitCheckIn(CheckInPayload payload) =
      _SubmitCheckIn;
  const factory VisitEvent.submitCheckOut(CheckOutPayload payload) =
      _SubmitCheckOut;
  const factory VisitEvent.syncOfflineData() = _SyncOfflineData;
}
