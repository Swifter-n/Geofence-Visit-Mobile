part of 'master_data_bloc.dart';

@freezed
class MasterDataState with _$MasterDataState {
  const factory MasterDataState.initial() = _Initial;
  const factory MasterDataState.loading() = _Loading;
  const factory MasterDataState.success(List<MasterRouteModel> routes) =
      _Success;
  const factory MasterDataState.error(String message) = _Error;
}
