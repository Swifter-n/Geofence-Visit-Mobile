part of 'master_data_bloc.dart';

@freezed
class MasterDataEvent with _$MasterDataEvent {
  const factory MasterDataEvent.fetchData() = _FetchData;
}
