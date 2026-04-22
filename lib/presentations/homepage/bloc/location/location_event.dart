part of 'location_bloc.dart';

@freezed
class LocationEvent with _$LocationEvent {
  const factory LocationEvent.started() = _Started;
  
  /// Event utama untuk men-trigger pencarian kordinat GPS saat ini
  const factory LocationEvent.getCurrentLocation() = _GetCurrentLocation;
}