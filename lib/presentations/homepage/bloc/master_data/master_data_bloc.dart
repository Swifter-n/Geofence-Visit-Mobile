import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geofence_visit_mobile/data/repositories/master_data_repository.dart';
import 'package:geofence_visit_mobile/models/responses/master_route/master_route_model.dart';

part 'master_data_event.dart';
part 'master_data_state.dart';
part 'master_data_bloc.freezed.dart';

class MasterDataBloc extends Bloc<MasterDataEvent, MasterDataState> {
  final MasterDataRepository repository;

  MasterDataBloc({required this.repository})
    : super(const MasterDataState.initial()) {
    on<_FetchData>(_onFetchData);
  }

  Future<void> _onFetchData(
    _FetchData event,
    Emitter<MasterDataState> emit,
  ) async {
    emit(const MasterDataState.loading());
    try {
      final routes = await repository.fetchRoutes();
      emit(MasterDataState.success(routes));
    } catch (e) {
      emit(MasterDataState.error(e.toString().replaceAll('Exception: ', '')));
    }
  }
}
