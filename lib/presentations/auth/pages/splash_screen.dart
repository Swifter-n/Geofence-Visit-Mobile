import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geofence_visit_mobile/presentations/auth/bloc/auth/auth_bloc.dart';
import 'package:geofence_visit_mobile/presentations/auth/pages/login_screen.dart';
import 'package:geofence_visit_mobile/presentations/homepage/pages/homepage_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        // Menggunakan maybeWhen (dari Freezed) agar lebih rapi
        state.maybeWhen(
          authenticated: () {
            // Jika token ada, arahkan ke Homepage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const HomepageScreen()),
            );
          },
          unauthenticated: () {
            // Jika tidak ada token / sesi habis, arahkan ke Login
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          },
          orElse: () {}, // Abaikan state initial/loading
        );
      },
      child: const Scaffold(
        body: Center(
          // TODO: Nanti bisa kamu ganti dengan Logo Aplikasi dari asset
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
