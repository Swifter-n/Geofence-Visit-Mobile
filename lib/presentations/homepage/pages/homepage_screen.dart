import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geofence_visit_mobile/presentations/homepage/pages/offline_queue_screen.dart';
import 'package:geofence_visit_mobile/presentations/homepage/widgets/custom_camera_screen.dart';
import 'package:geofence_visit_mobile/models/payloads/check_in/check_in_payload.dart';
import 'package:geofence_visit_mobile/models/payloads/check_out/check_out_payload.dart';
import 'package:geofence_visit_mobile/models/responses/master_route/master_route_model.dart';
import 'package:geofence_visit_mobile/models/responses/user/user_model.dart';
import 'package:geofence_visit_mobile/presentations/auth/bloc/auth/auth_bloc.dart';
import 'package:geofence_visit_mobile/presentations/auth/pages/login_screen.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/location/location_bloc.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/master_data/master_data_bloc.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/visit/visit_bloc.dart';
import 'package:geofence_visit_mobile/presentations/homepage/widgets/outlet_search_bottom_sheet.dart';
import 'package:geofence_visit_mobile/presentations/profile/pages/profile_screen.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class HomepageScreen extends StatefulWidget {
  const HomepageScreen({super.key});

  @override
  State<HomepageScreen> createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  List<String> _capturedPhotoPaths = [];
  MasterRouteModel? selectedOutlet;
  bool _isCheckedIn = false;
  String _lastAction = '';

  @override
  void initState() {
    super.initState();
    // Tarik koordinat GPS saat ini
    context.read<LocationBloc>().add(const LocationEvent.getCurrentLocation());
    // Tarik data master outlet/rute dari API backend
    context.read<MasterDataBloc>().add(const MasterDataEvent.fetchData());
    _loadVisitState();
  }

  Future<void> _loadVisitState() async {
    final prefs = await SharedPreferences.getInstance();
    final isCheckedIn = prefs.getBool('is_checked_in') ?? false;
    final savedOutletStr = prefs.getString('saved_outlet');

    setState(() {
      _isCheckedIn = isCheckedIn;
      // Jika terdeteksi sedang Check-In, otomatis isi kembali Dropdown Outlet-nya
      if (savedOutletStr != null) {
        selectedOutlet = MasterRouteModel.fromJson(jsonDecode(savedOutletStr));
      }
    });
  }

  Future<void> _saveVisitState(
    bool isCheckedIn,
    MasterRouteModel? outlet,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_checked_in', isCheckedIn);

    if (outlet != null) {
      await prefs.setString('saved_outlet', jsonEncode(outlet.toJson()));
    } else {
      await prefs.remove('saved_outlet');
    }

    setState(() {
      _isCheckedIn = isCheckedIn;
      selectedOutlet = outlet;
    });
  }

  void _doCheckIn(Position position, UserModel user) {
    if (selectedOutlet == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan pilih titik visit (outlet) terlebih dahulu'),
        ),
      );
      return;
    }

    final now = DateTime.now();
    final String formattedDateTime =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

    final String dateNow = now.toIso8601String();

    final payload = CheckInPayload(
      latitude: position.latitude,
      longitude: position.longitude,
      vehicleId: user.vehicleId?.toString() ?? "0",
      outletSiteId: selectedOutlet!.outletSiteId,
      ruteId: selectedOutlet!.ruteId,
      gpsTime: dateNow,
      entryTime: formattedDateTime,
    );

    _lastAction = 'check_in';
    context.read<VisitBloc>().add(
      VisitEvent.submitCheckIn(payload, photoPaths: _capturedPhotoPaths),
    );
  }

  void _doCheckOut(Position position, UserModel user) {
    if (selectedOutlet == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan pilih titik visit (outlet) terlebih dahulu'),
        ),
      );
      return;
    }

    final now = DateTime.now();
    final String formattedDateTime =
        "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
    final String dateNow = now.toIso8601String();

    final payload = CheckOutPayload(
      latitude: position.latitude,
      longitude: position.longitude,
      ruteId: selectedOutlet!.ruteId,
      vehicleId: user.vehicleId?.toString() ?? "0",
      outletSiteId: selectedOutlet!.outletSiteId,
      gpsTime: dateNow,
      exitTime: formattedDateTime,
    );

    _lastAction = 'check_out';
    context.read<VisitBloc>().add(VisitEvent.submitCheckOut(payload));
  }

  void _showOutletSearchBottomSheet(
    BuildContext context,
    List<MasterRouteModel> outlets,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Agar bisa full screen saat keyboard muncul
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return OutletSearchBottomSheet(
          outlets: outlets,
          onSelected: (outlet) {
            setState(() {
              selectedOutlet = outlet;
            });
          },
        );
      },
    );
  }

  Future<void> _openCamera() async {
    final photoPath = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CustomCameraScreen()),
    );

    if (photoPath != null && photoPath is String) {
      if (_capturedPhotoPaths.length < 3) {
        setState(() {
          _capturedPhotoPaths.add(photoPath);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final user = authState.maybeWhen(
      authenticated: (user) => user,
      orElse: () => null,
    );

    if (user == null)
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
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

                if (_lastAction == 'check_in') {
                  _saveVisitState(true, selectedOutlet); // Kunci outlet
                } else if (_lastAction == 'check_out') {
                  _saveVisitState(false, null); // Lepas kunci
                  setState(() {
                    _capturedPhotoPaths.clear(); // Bersihkan preview foto
                  });
                }
                _lastAction = '';
              },
              error: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message), backgroundColor: Colors.red),
                );
                _lastAction = '';
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
              icon: const Icon(Icons.cloud_sync_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const OfflineQueueScreen()),
                );
              },
            ),
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
              icon: const Icon(Icons.person_pin),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        ProfileScreen(user: user, isCheckedIn: _isCheckedIn),
                  ),
                );
              },
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
                _buildHeaderSection(user),
                const SizedBox(height: 24),
                _buildRouteSelection(), // Dropdown Master Data
                const SizedBox(height: 16),
                _buildLocationCard(), // Kartu Status GPS
                const SizedBox(height: 24),
                if (!_isCheckedIn) ...[
                  _buildPhotoSection(),
                  const SizedBox(height: 24),
                ],
                const SizedBox(height: 24),
                _buildActionButtons(user), // Tombol In/Out
              ],
            ),
          ),
        ),
      ),
    );
  }

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
                  'Pilih Outlet',
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

                    // CUSTOM DROPDOWN TRIGGER
                    return InkWell(
                      onTap: _isCheckedIn
                          ? null
                          : () =>
                                _showOutletSearchBottomSheet(context, outlets),
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: _isCheckedIn
                              ? Colors.grey.shade200
                              : Colors.transparent,
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                selectedOutlet != null
                                    ? '${selectedOutlet!.outletSiteId} - ${selectedOutlet!.outletName}'
                                    : 'Tap untuk mencari & memilih outlet...',
                                style: TextStyle(
                                  color: selectedOutlet != null
                                      ? Colors.black87
                                      : Colors.grey.shade600,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
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

  Widget _buildHeaderSection(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, ${user.name}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Siap melakukan visit hari ini?',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPhotoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Foto Bongkaran',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          children: [
            ..._capturedPhotoPaths.asMap().entries.map((entry) {
              return Stack(
                children: [
                  Image.file(
                    File(entry.value),
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () => setState(
                        () => _capturedPhotoPaths.removeAt(entry.key),
                      ),
                      child: const Icon(Icons.cancel, color: Colors.red),
                    ),
                  ),
                ],
              );
            }),
            if (_capturedPhotoPaths.length < 3)
              GestureDetector(
                onTap: _openCamera,
                child: Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.add_a_photo),
                ),
              ),
          ],
        ),
      ],
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
                    // --- HITUNG JARAK SECARA REALTIME ---
                    double? distanceInMeters;
                    bool isOutsideRadius = true;

                    if (selectedOutlet != null &&
                        selectedOutlet!.latitude != null &&
                        selectedOutlet!.longitude != null) {
                      distanceInMeters = Geolocator.distanceBetween(
                        position.latitude,
                        position.longitude,
                        selectedOutlet!.latitude!,
                        selectedOutlet!.longitude!,
                      );

                      // Cek apakah jarak saat ini lebih besar dari radius yang diizinkan (default 50 meter jika null)
                      isOutsideRadius =
                          distanceInMeters > (selectedOutlet!.radius ?? 50.0);
                    }
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
                              'Akurasi GPS: ${accuracy.toStringAsFixed(2)} m',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),

                        // --- TAMPILAN JARAK KE OUTLET ---
                        if (selectedOutlet != null &&
                            distanceInMeters != null) ...[
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                isOutsideRadius
                                    ? Icons.location_off
                                    : Icons.location_on,
                                size: 20,
                                color: isOutsideRadius
                                    ? Colors.red
                                    : Colors.green,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Jarak ke Outlet: ${distanceInMeters.toStringAsFixed(2)} m',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: isOutsideRadius
                                        ? Colors.red
                                        : Colors.green,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],

                        const SizedBox(height: 8),

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

  Widget _buildActionButtons(UserModel user) {
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

        bool isOutsideRadius = true;
        if (selectedOutlet != null &&
            currentPosition != null &&
            selectedOutlet!.latitude != null &&
            selectedOutlet!.longitude != null) {
          double distance = Geolocator.distanceBetween(
            currentPosition.latitude,
            currentPosition.longitude,
            selectedOutlet!.latitude!,
            selectedOutlet!.longitude!,
          );
          isOutsideRadius = distance > (selectedOutlet!.radius ?? 50.0);
        } else if (selectedOutlet == null) {
          isOutsideRadius = true; // Kunci tombol jika belum pilih outlet
        } else {
          isOutsideRadius =
              false; // Bypass jika data koordinat outlet di master data tidak lengkap
        }
        final isButtonDisabled =
            currentPosition == null || isMocked || isOutsideRadius;

        return BlocBuilder<VisitBloc, VisitState>(
          builder: (context, visitState) {
            final isSubmitting = visitState.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return Column(
              // Ganti jadi Column untuk menambahkan pesan warning di atas tombol
              children: [
                if (selectedOutlet != null && isOutsideRadius)
                  const Padding(
                    padding: EdgeInsets.only(bottom: 12.0),
                    child: Text(
                      'Anda berada di luar area Geofence. Dekati titik outlet untuk Check-In.',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        // CHECK IN MATI JIKA: Sudah check-in (_isCheckedIn == true) ATAU GPS/Radius gagal
                        onPressed:
                            (_isCheckedIn || isButtonDisabled || isSubmitting)
                            ? null
                            : () => _doCheckIn(currentPosition, user),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isSubmitting && _lastAction == 'check_in'
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
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        // CHECK OUT MATI JIKA: BELUM check-in (!_isCheckedIn) ATAU GPS/Radius gagal
                        onPressed:
                            (!_isCheckedIn || isButtonDisabled || isSubmitting)
                            ? null
                            : () => _doCheckOut(currentPosition, user),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: isSubmitting && _lastAction == 'check_out'
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
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
