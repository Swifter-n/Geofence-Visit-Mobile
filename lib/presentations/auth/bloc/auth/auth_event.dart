part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;
  const factory AuthEvent.login(LoginPayload payload) = _Login;
  const factory AuthEvent.logout() = _Logout;
}