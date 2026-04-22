import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geofence_visit_mobile/data/local/local_db_service.dart';
import 'package:geofence_visit_mobile/data/network/api_client.dart';
import 'package:geofence_visit_mobile/data/repositories/auth_repository.dart';
import 'package:geofence_visit_mobile/data/repositories/visit_repository.dart';
import 'package:geofence_visit_mobile/presentations/auth/bloc/auth/auth_bloc.dart';
import 'package:geofence_visit_mobile/presentations/auth/pages/splash_screen.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/location/location_bloc.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/visit/visit_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1. Inisialisasi Service (Local DB & API)
  final localDb = LocalDbService();
  final apiClient = ApiClient();
  final connectivity = Connectivity();

  // 2. Inisialisasi Repository
  final authRepository = AuthRepository(apiClient: apiClient);
  final visitRepository = VisitRepository(
    apiClient: apiClient,
    localDb: localDb,
    connectivity: connectivity,
  );

  runApp(
    MyApp(authRepository: authRepository, visitRepository: visitRepository),
  );
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final VisitRepository visitRepository;

  const MyApp({
    super.key,
    required this.authRepository,
    required this.visitRepository,
  });

  @override
  Widget build(BuildContext context) {
    // 3. Daftarkan semua BLoC agar bisa diakses di seluruh aplikasi
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(repository: authRepository)
            // Langsung tembak event check status saat app pertama dibuka
            ..add(const AuthEvent.checkAuthStatus()),
        ),
        BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
        BlocProvider<VisitBloc>(
          create: (context) => VisitBloc(repository: visitRepository),
        ),
      ],
      child: MaterialApp(
        title: 'Geofence Visit Mobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: const SplashScreen(),
      ),
    );
  }
}
