import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geofence_visit_mobile/data/repositories/visit_repository.dart';
import 'package:geofence_visit_mobile/models/payloads/check_in/check_in_payload.dart';
import 'package:geofence_visit_mobile/models/payloads/check_out/check_out_payload.dart';

part 'visit_event.dart';
part 'visit_state.dart';
part 'visit_bloc.freezed.dart';

class VisitBloc extends Bloc<VisitEvent, VisitState> {
  final VisitRepository repository;

  VisitBloc({required this.repository}) : super(const VisitState.initial()) {
    on<_SubmitCheckIn>(_onSubmitCheckIn);
    on<_SubmitCheckOut>(_onSubmitCheckOut);
    on<_SyncOfflineData>(_onSyncOfflineData);
  }

  Future<void> _onSubmitCheckIn(
    _SubmitCheckIn event,
    Emitter<VisitState> emit,
  ) async {
    emit(const VisitState.loading());
    try {
      final isOffline = await repository.submitCheckIn(event.payload);
      emit(
        VisitState.success(
          message: isOffline
              ? 'Koneksi terputus. Check-In disimpan secara offline.'
              : 'Check-In berhasil!',
          isOffline: isOffline,
        ),
      );
    } catch (e) {
      // Error hanya dilempar jika server bermasalah (misal 500 Internal Server Error)
      emit(VisitState.error(e.toString()));
    }
  }

  Future<void> _onSubmitCheckOut(
    _SubmitCheckOut event,
    Emitter<VisitState> emit,
  ) async {
    emit(const VisitState.loading());
    try {
      final isOffline = await repository.submitCheckOut(event.payload);
      emit(
        VisitState.success(
          message: isOffline
              ? 'Koneksi terputus. Check-Out disimpan secara offline.'
              : 'Check-Out berhasil!',
          isOffline: isOffline,
        ),
      );
    } catch (e) {
      emit(VisitState.error(e.toString()));
    }
  }

  Future<void> _onSyncOfflineData(
    _SyncOfflineData event,
    Emitter<VisitState> emit,
  ) async {
    // Berjalan di background tanpa emit loading agar tidak mengganggu UI user
    await repository.syncOfflineVisits();
  }
}
