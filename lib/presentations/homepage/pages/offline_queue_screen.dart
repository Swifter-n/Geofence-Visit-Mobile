import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geofence_visit_mobile/data/local/entities/offline_visit_entity.dart';
import 'dart:convert';

import 'package:geofence_visit_mobile/data/local/local_db_service.dart';
import 'package:geofence_visit_mobile/presentations/homepage/bloc/visit/visit_bloc.dart';

class OfflineQueueScreen extends StatefulWidget {
  const OfflineQueueScreen({super.key});

  @override
  State<OfflineQueueScreen> createState() => _OfflineQueueScreenState();
}

class _OfflineQueueScreenState extends State<OfflineQueueScreen> {
  final LocalDbService _localDb = LocalDbService();
  List<OfflineVisitEntity> _unsyncedData = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    final data = await _localDb.getUnsyncedVisits();
    setState(() {
      _unsyncedData = data;
      _isLoading = false;
    });
  }

  void _triggerSync() {
    if (_unsyncedData.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Antrean kosong')));
      return;
    }
    context.read<VisitBloc>().add(const VisitEvent.syncOfflineData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Antrean Offline'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadData, // Tombol refresh list manual
          ),
        ],
      ),
      // Gunakan BlocConsumer untuk memantau proses Sync
      body: BlocConsumer<VisitBloc, VisitState>(
        listener: (context, state) {
          state.maybeWhen(
            success: (message, isOffline) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.green),
              );
              _loadData(); // Muat ulang list jika sukses
            },
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
              _loadData(); // Muat ulang list karena loading hilang
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isSyncing = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return Column(
            children: [
              // Bagian Header Status
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.blue.shade50,
                child: Row(
                  children: [
                    const Icon(
                      Icons.cloud_upload,
                      color: Colors.blue,
                      size: 32,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tersisa ${_unsyncedData.length} data',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const Text(
                            'Data ini akan dikirim saat ada sinyal.',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: isSyncing || _unsyncedData.isEmpty
                          ? null
                          : _triggerSync,
                      child: isSyncing
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Sync Now'),
                    ),
                  ],
                ),
              ),

              // Bagian List Antrean
              Expanded(
                child: _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : _unsyncedData.isEmpty
                    ? const Center(
                        child: Text(
                          'Semua data sudah tersinkronisasi!',
                          style: TextStyle(color: Colors.grey),
                        ),
                      )
                    : ListView.separated(
                        itemCount: _unsyncedData.length,
                        separatorBuilder: (_, __) => const Divider(height: 1),
                        itemBuilder: (context, index) {
                          final item = _unsyncedData[index];
                          // Coba ambil nama outlet dari payload JSON
                          String outletName = 'Unknown Outlet';
                          try {
                            final map = jsonDecode(item.payloadJson);
                            outletName = map['outlet_site_id'] ?? 'Titik Visit';
                          } catch (_) {}

                          return ListTile(
                            leading: Icon(
                              item.type == 'check_in'
                                  ? Icons.login
                                  : Icons.logout,
                              color: item.type == 'check_in'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                            title: Text(
                              '${item.type == 'check_in' ? 'Check-In' : 'Check-Out'} - $outletName',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              item.timestamp.toString().substring(0, 16),
                            ), // Tampilkan jam
                            trailing: const Icon(
                              Icons.schedule,
                              color: Colors.orange,
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
