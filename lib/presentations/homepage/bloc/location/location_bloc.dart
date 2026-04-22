import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';
part 'location_bloc.freezed.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationState.initial()) {
    on<_Started>(_onStarted);
    on<_GetCurrentLocation>(_onGetCurrentLocation);
  }

  void _onStarted(_Started event, Emitter<LocationState> emit) {
    // Initial event jika butuh setup awal
  }

  Future<void> _onGetCurrentLocation(
    _GetCurrentLocation event,
    Emitter<LocationState> emit,
  ) async {
    emit(const LocationState.loading());

    try {
      bool serviceEnabled;
      LocationPermission permission;

      // 1. Cek apakah GPS (Hardware) aktif
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        emit(const LocationState.error('GPS tidak aktif. Mohon nyalakan GPS Anda.'));
        return;
      }

      // 2. Cek & Request Permission (Software)
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          emit(const LocationState.error('Akses lokasi ditolak.'));
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        emit(const LocationState.error(
            'Akses lokasi ditolak permanen. Silakan izinkan melalui pengaturan HP.'));
        return;
      }

      // 3. Ambil titik koordinat saat ini (High Accuracy agar cocok untuk Geofence)
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // 4. Deteksi Fake GPS (Anti-Tuyul) & Return ke State
      emit(LocationState.success(
        position: position,
        isMocked: position.isMocked, 
        accuracy: position.accuracy, 
      ));
      
    } catch (e) {
      emit(LocationState.error('Gagal mendapatkan lokasi: ${e.toString()}'));
    }
  }
}
