import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/repositories/auth_repository.dart';
import '../../../../models/payloads/login/login_payload.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc({required this.repository}) : super(const AuthState.initial()) {
    on<_CheckAuthStatus>(_onCheckAuthStatus);
    on<_Login>(_onLogin);
    on<_Logout>(_onLogout);
  }

  Future<void> _onCheckAuthStatus(_CheckAuthStatus event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final isAuthenticated = await repository.isAuthenticated();
      if (isAuthenticated) {
        emit(const AuthState.authenticated());
      } else {
        emit(const AuthState.unauthenticated());
      }
    } catch (_) {
      emit(const AuthState.unauthenticated());
    }
  }

  Future<void> _onLogin(_Login event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    try {
      final success = await repository.login(event.payload);
      if (success) {
        emit(const AuthState.authenticated());
      } else {
        emit(const AuthState.error('Sistem tidak merespon token dengan valid.'));
      }
    } catch (e) {
      emit(AuthState.error(e.toString().replaceAll('Exception: ', '')));
    }
  }

  Future<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    await repository.logout();
    emit(const AuthState.unauthenticated());
  }
}