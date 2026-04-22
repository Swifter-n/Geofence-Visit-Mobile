import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geofence_visit_mobile/models/payloads/check_in/check_in_payload.dart';
import 'package:geofence_visit_mobile/models/payloads/check_out/check_out_payload.dart';
import 'package:geofence_visit_mobile/models/responses/master_route/master_route_model.dart';
import 'package:geofence_visit_mobile/presentations/auth/bloc/auth/auth_bloc.dart';
import 'package:geofence_visit_mobile/presentations/auth/pages/login_screen.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/location/location_bloc.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/master_data/master_data_bloc.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/visit/visit_bloc.dart';
import 'package:geolocator/geolocator.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  // Variabel penampung pilihan outlet user dari Dropdown
  MasterRouteModel? selectedOutlet;

  // TODO: Nanti ambil dari profile/login response. Sementara kita set default.
  String userVehicleId = "VHC-001";

  @override
  void initState() {
    super.initState();
    // Tarik koordinat GPS saat ini
    context.read<LocationBloc>().add(const LocationEvent.getCurrentLocation());
    // Tarik data master outlet/rute dari API backend
    context.read<MasterDataBloc>().add(const MasterDataEvent.fetchData());
  }

  void _doCheckIn(Position position) {
    if (selectedOutlet == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan pilih titik visit (outlet) terlebih dahulu'),
        ),
      );
      return;
    }

    final payload = CheckInPayload(
      latitude: position.latitude,
      longitude: position.longitude,
      vehicleId: userVehicleId,
      outletSiteId: selectedOutlet!.outletSiteId,
      ruteId: selectedOutlet!.ruteId,
      gpsTime: DateTime.now().toIso8601String(),
    );

    context.read<VisitBloc>().add(VisitEvent.submitCheckIn(payload));
  }

  void _doCheckOut(Position position) {
    if (selectedOutlet == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan pilih titik visit (outlet) terlebih dahulu'),
        ),
      );
      return;
    }

    final payload = CheckOutPayload(
      latitude: position.latitude,
      longitude: position.longitude,
      vehicleId: userVehicleId,
      outletSiteId: selectedOutlet!.outletSiteId,
      gpsTime: DateTime.now().toIso8601String(),
    );

    context.read<VisitBloc>().add(VisitEvent.submitCheckOut(payload));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.maybeWhen(
              unauthenticated: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                  (route) => false,
                );
              },
              orElse: () {},
            );
          },
        ),
        BlocListener<VisitBloc, VisitState>(
          listener: (context, state) {
            state.maybeWhen(
              success: (message, isOffline) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(message),
                    backgroundColor: isOffline ? Colors.orange : Colors.green,
                  ),
                );
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
              },
              orElse: () {},
            );
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Geofence Visit',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                context.read<LocationBloc>().add(
                  const LocationEvent.getCurrentLocation(),
                );
                context.read<MasterDataBloc>().add(
                  const MasterDataEvent.fetchData(),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () =>
                  context.read<AuthBloc>().add(const AuthEvent.logout()),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<LocationBloc>().add(
              const LocationEvent.getCurrentLocation(),
            );
            context.read<MasterDataBloc>().add(
              const MasterDataEvent.fetchData(),
            );
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeaderSection(),
                const SizedBox(height: 24),
                _buildRouteSelection(), // Dropdown Master Data
                const SizedBox(height: 16),
                _buildLocationCard(), // Kartu Status GPS
                const SizedBox(height: 24),
                _buildActionButtons(), // Tombol In/Out
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Halo, Driver',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Text(
          'Pilih titik visit dan pastikan GPS Anda akurat.',
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  /// Bagian Dropdown Pilihan Outlet dari MasterDataBloc
  Widget _buildRouteSelection() {
    return BlocBuilder<MasterDataBloc, MasterDataState>(
      builder: (context, state) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pilih Titik Visit / Outlet',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                state.maybeWhen(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (message) => Text(
                    'Gagal memuat data: $message',
                    style: const TextStyle(color: Colors.red),
                  ),
                  success: (outlets) {
                    if (outlets.isEmpty) {
                      return const Text(
                        'Tidak ada jadwal rute/outlet untuk Anda saat ini.',
                      );
                    }
                    return DropdownButtonFormField<MasterRouteModel>(
                      value: selectedOutlet,
                      isExpanded: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                      hint: const Text('Tap untuk memilih...'),
                      items: outlets.map((outlet) {
                        return DropdownMenuItem(
                          value: outlet,
                          child: Text(
                            '${outlet.outletSiteId} - ${outlet.outletName}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedOutlet = value;
                        });
                      },
                    );
                  },
                  orElse: () => const SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLocationCard() {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Status Lokasi Anda',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                state.maybeWhen(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (message) => Text(
                    message,
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  success: (position, isMocked, accuracy) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.my_location,
                              size: 20,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '${position.latitude}, ${position.longitude}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              accuracy <= 50
                                  ? Icons.check_circle
                                  : Icons.warning,
                              size: 20,
                              color: accuracy <= 50
                                  ? Colors.green
                                  : Colors.orange,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Akurasi: ${accuracy.toStringAsFixed(2)} m',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        if (isMocked) ...[
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              children: [
                                Icon(Icons.error, color: Colors.red, size: 20),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Aplikasi Fake GPS terdeteksi!',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    );
                  },
                  orElse: () => const Text('Menunggu data lokasi...'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildActionButtons() {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, locationState) {
        final currentPosition = locationState.maybeWhen(
          success: (pos, mocked, acc) => pos,
          orElse: () => null,
        );
        final isMocked = locationState.maybeWhen(
          success: (_, mocked, __) => mocked,
          orElse: () => false,
        );
        final isButtonDisabled = currentPosition == null || isMocked;

        return BlocBuilder<VisitBloc, VisitState>(
          builder: (context, visitState) {
            final isSubmitting = visitState.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: isButtonDisabled || isSubmitting
                        ? null
                        : () => _doCheckIn(currentPosition),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Check In',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isButtonDisabled || isSubmitting
                        ? null
                        : () => _doCheckOut(currentPosition),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'Check Out',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
