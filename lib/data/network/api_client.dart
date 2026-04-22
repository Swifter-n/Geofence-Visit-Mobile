import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/constants/variables.dart';

class ApiClient {
  /// Mengambil header bawaan dan token dari SharedPreferences
  Future<Map<String, String>> _getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(
      'access_token',
    ); // Key ini disesuaikan dengan saat login nanti

    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  /// Fungsi generic untuk HTTP POST
  Future<http.Response> post(String endpoint, Map<String, dynamic> body) async {
    final headers = await _getHeaders();

    // Pastikan baseUrl dan endpoint digabung dengan benar tanpa double slash
    final String cleanBaseUrl = Variables.baseUrl.endsWith('/')
        ? Variables.baseUrl
        : '${Variables.baseUrl}/';
    final String cleanEndpoint = endpoint.startsWith('/')
        ? endpoint.substring(1)
        : endpoint;

    final url = Uri.parse('$cleanBaseUrl$cleanEndpoint');

    // Timeout dipasang agar jika sinyal jelek (edge), tidak nunggu selamanya dan langsung lari ke mode offline
    return await http
        .post(url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 15));
  }

  Future<http.Response> get(String endpoint) async {
    final headers = await _getHeaders();

    final String cleanBaseUrl = Variables.baseUrl.endsWith('/')
        ? Variables.baseUrl
        : '${Variables.baseUrl}/';
    final String cleanEndpoint = endpoint.startsWith('/')
        ? endpoint.substring(1)
        : endpoint;

    final url = Uri.parse('$cleanBaseUrl$cleanEndpoint');

    return await http
        .get(url, headers: headers)
        .timeout(const Duration(seconds: 15));
  }
}
