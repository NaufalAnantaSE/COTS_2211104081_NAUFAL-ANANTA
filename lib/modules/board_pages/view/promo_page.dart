import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pesanan"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Riwayat"),
              Tab(text: "Dalam Proses"),
              Tab(text: "Terjadwal"),
            ],
          ),
          backgroundColor: const Color(0xFF00AA13),
        ),
        body: TabBarView(
          children: [
            _buildOrderList("Riwayat"),
            _buildOrderList("Dalam Proses"),
            _buildOrderList("Terjadwal"),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(String title) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.restaurant),
          title: Text("$title Item $index"),
          subtitle: Text("Detail pesanan $index"),
          trailing: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF00AA13),
            ),
            child: const Text("Pesan lagi"),
          ),
        );
      },
    );
  }
}
