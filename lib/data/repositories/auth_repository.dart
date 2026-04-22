import 'dart:convert';
import 'package:geofence_visit_mobile/models/responses/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/payloads/login/login_payload.dart';
import '../network/api_client.dart';

class AuthRepository {
  final ApiClient apiClient;

  AuthRepository({required this.apiClient});

  /// Mengirim payload ke backend dan menyimpan token jika sukses
  Future<bool> login(LoginPayload payload) async {
    // Sesuaikan endpoint ini dengan rute di backend Laravel kamu (AuthController)
    final response = await apiClient.post('login', payload.toJson());

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final data = jsonDecode(response.body);

      final token = data['token'] ?? data['access_token'];

      if (token != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('access_token', token);
        return true;
      }
      return false;
    } else {
      // Lempar error jika gagal login (misal: 401 Unauthorized)
      throw Exception('Login gagal. Periksa kembali email dan password Anda.');
    }
  }

  /// Menghapus token dari local storage
  Future<void> logout() async {
    try {
      await apiClient.post('mobile/auth/logout', {});
    } catch (e) {
      // Abaikan jika gagal (misal koneksi mati), tetap hapus token lokal
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('access_token');
  }

  Future<UserModel> getMe() async {
    final response = await apiClient.get('me');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decoded = jsonDecode(response.body);
      // Antisipasi jika backend membungkus response dengan key "data"
      final userData = decoded['data'] ?? decoded;

      return UserModel.fromJson(userData);
    } else {
      // 2. Tampilkan pesan asli dari backend untuk mempermudah debugging
      throw Exception(
        'Error Server: ${response.statusCode} - ${response.body}',
      );
    }
  }

  /// Mengecek apakah user sudah login (token ada)
  Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('access_token');
  }
}
