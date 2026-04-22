import 'package:flutter/material.dart';
import 'package:geofence_visit_mobile/models/responses/master_route/master_route_model.dart';

class OutletSearchBottomSheet extends StatefulWidget {
  final List<MasterRouteModel> outlets;
  final Function(MasterRouteModel) onSelected;

  const OutletSearchBottomSheet({
    required this.outlets,
    required this.onSelected,
  });

  @override
  State<OutletSearchBottomSheet> createState() =>
      _OutletSearchBottomSheetState();
}

class _OutletSearchBottomSheetState extends State<OutletSearchBottomSheet> {
  final TextEditingController _searchController = TextEditingController();
  List<MasterRouteModel> _filteredOutlets = [];

  @override
  void initState() {
    super.initState();
    // Saat pertama kali dibuka, tampilkan semua outlet
    _filteredOutlets = widget.outlets;
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterOutlets(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredOutlets = widget.outlets;
      } else {
        final lowerQuery = query.toLowerCase();
        _filteredOutlets = widget.outlets.where((outlet) {
          // Cari berdasarkan ID atau Nama Outlet
          final idMatch = outlet.outletSiteId.toLowerCase().contains(
            lowerQuery,
          );
          final nameMatch = outlet.outletName.toLowerCase().contains(
            lowerQuery,
          );
          return idMatch || nameMatch;
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Ambil tinggi layar agar BottomSheet maksimal tingginya 80% dari layar
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.8,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        // Hindari form tertutup keyboard
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        children: [
          // Garis kecil penanda BottomSheet (Handle)
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Cari Outlet',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Kolom Search
          TextField(
            controller: _searchController,
            onChanged: _filterOutlets,
            autofocus: true, // Otomatis munculkan keyboard
            decoration: InputDecoration(
              hintText: 'Cari nama atau Site outlet...',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        _filterOutlets('');
                      },
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          const SizedBox(height: 16),

          // List Hasil Pencarian
          Expanded(
            child: _filteredOutlets.isEmpty
                ? const Center(
                    child: Text(
                      'Outlet tidak ditemukan',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.separated(
                    itemCount: _filteredOutlets.length,
                    separatorBuilder: (context, index) =>
                        const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final outlet = _filteredOutlets[index];
                      return ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          child: Icon(
                            Icons.store,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                        title: Text(
                          outlet.outletName,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text('Site: ${outlet.outletSiteId}'),
                        onTap: () {
                          // Kirim data ke parent (HomepageScreen) dan tutup BottomSheet
                          widget.onSelected(outlet);
                          Navigator.pop(context);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
