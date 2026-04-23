import 'package:camera/camera.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geofence_visit_mobile/data/local/local_db_service.dart';
import 'package:geofence_visit_mobile/data/network/api_client.dart';
import 'package:geofence_visit_mobile/data/repositories/auth_repository.dart';
import 'package:geofence_visit_mobile/data/repositories/master_data_repository.dart';
import 'package:geofence_visit_mobile/data/repositories/visit_repository.dart';
import 'package:geofence_visit_mobile/presentations/auth/bloc/auth/auth_bloc.dart';
import 'package:geofence_visit_mobile/presentations/auth/pages/login_screen.dart';
import 'package:geofence_visit_mobile/presentations/auth/pages/splash_screen.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/location/location_bloc.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/master_data/master_data_bloc.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/visit/visit_bloc.dart';

late List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

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
  final masterDataRepository = MasterDataRepository(apiClient: apiClient);

  runApp(
    MyApp(
      authRepository: authRepository,
      visitRepository: visitRepository,
      masterDataRepository: masterDataRepository,
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final VisitRepository visitRepository;
  final MasterDataRepository masterDataRepository;

  const MyApp({
    super.key,
    required this.authRepository,
    required this.visitRepository,
    required this.masterDataRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) =>
              AuthBloc(repository: authRepository)
                ..add(const AuthEvent.checkAuthStatus()),
        ),
        BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
        BlocProvider<VisitBloc>(
          create: (context) => VisitBloc(repository: visitRepository),
        ),
        BlocProvider<MasterDataBloc>(
          create: (context) =>
              MasterDataBloc(repository: masterDataRepository)
                ..add(const MasterDataEvent.fetchData()),
        ),
      ],
      child: MaterialApp(
        title: 'Geofence Visit Mobile',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),

        navigatorKey: navigatorKey,

        builder: (context, child) {
          return BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              state.maybeWhen(
                unauthenticated: () {
                  navigatorKey.currentState?.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (route) => false,
                  );
                },
                orElse: () {},
              );
            },
            child: child!,
          );
        },

        home: const SplashScreen(),
      ),
    );
  }
}
