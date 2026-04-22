part of 'location_bloc.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = _Initial;
  const factory LocationState.loading() = _Loading;
  
  const factory LocationState.success({
    required Position position,
    required bool isMocked,   // true jika pakai Fake GPS
    required double accuracy, // dalam satuan meter
  }) = _Success;
  
  const factory LocationState.error(String message) = _Error;
}