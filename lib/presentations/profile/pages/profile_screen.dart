import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geofence_visit_mobile/models/responses/user/user_model.dart';
import 'package:geofence_visit_mobile/presentations/auth/bloc/auth/auth_bloc.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel user;
  final bool isCheckedIn; // Kita lempar status check-in dari Homepage

  const ProfileScreen({
    super.key,
    required this.user,
    required this.isCheckedIn,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Saya')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 16),
            _buildProfileItem('Nama', user.name),
            _buildProfileItem('Email', user.email),
            _buildProfileItem('ID Kendaraan', user.vehicleId ?? '-'),
            const Spacer(),

            // LOGIKA POIN 1: Logout Guard
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isCheckedIn) {
                    // Blokir jika masih Check-In
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Selesaikan kunjungan (Check-Out) terlebih dahulu sebelum Logout!',
                        ),
                        backgroundColor: Colors.orange,
                      ),
                    );
                  } else {
                    _showLogoutDialog(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Apakah Anda yakin ingin keluar?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEvent.logout());
              Navigator.pop(context); // Tutup dialog
              Navigator.pop(
                context,
              ); // Balik ke Homepage (yang nanti akan auto-redirect ke Login)
            },
            child: const Text(
              'Ya, Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}
