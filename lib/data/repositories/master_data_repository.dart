import 'dart:convert';
import 'package:geofence_visit_mobile/data/network/api_client.dart';
import 'package:geofence_visit_mobile/models/responses/master_route/master_route_model.dart';

class MasterDataRepository {
  final ApiClient apiClient;

  MasterDataRepository({required this.apiClient});

  Future<List<MasterRouteModel>> fetchRoutes() async {
    final response = await apiClient.get('/mobile/master-outlets');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final decoded = jsonDecode(response.body);

      final List jsonList = decoded['data'] ?? [];

      return jsonList.map((e) => MasterRouteModel.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil data rute: ${response.statusCode}');
    }
  }
}
