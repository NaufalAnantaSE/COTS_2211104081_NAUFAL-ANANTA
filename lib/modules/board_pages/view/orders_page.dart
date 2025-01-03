import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Jumlah tab
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Pesanan",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF00AA13), // Green Gojek
          bottom: const TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "Riwayat"),
              Tab(text: "Dalam Proses"),
              Tab(text: "Terjadwal"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // Konten untuk Tab "Riwayat"
            _buildOrderList(
              "Riwayat Pesanan",
              "https://github.com/user-attachments/assets/c4395f7f-eaa6-4565-a6aa-6a342534da87/order1.png",
            ),
            // Konten untuk Tab "Dalam Proses"
            _buildOrderList(
              "Pesanan Dalam Proses",
              "https://github.com/user-attachments/assets/c4395f7f-eaa6-4565-a6aa-6a342534da87/order2.png",
            ),
            // Konten untuk Tab "Terjadwal"
            _buildOrderList(
              "Pesanan Terjadwal",
              "https://github.com/user-attachments/assets/c4395f7f-eaa6-4565-a6aa-6a342534da87/order3.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderList(String title, String imageUrl) {
    return ListView.builder(
      itemCount: 4, // Jumlah dummy data
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: ListTile(
              leading: Image.network(
                imageUrl, // Gambar URL dari konten
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("3 item\nMakanan sudah diantar\n28 Des 11.36"),
                  SizedBox(height: 5),
                  Text("Rp. 58.800", style: TextStyle(color: Colors.black)),
                ],
              ),
              trailing: OutlinedButton(
                onPressed: () {
                  // Aksi untuk "Pesan lagi"
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.green,
                  side: const BorderSide(color: Colors.green),
                ),
                child: const Text("Pesan lagi"),
              ),
            ),
          ),
        );
      },
    );
  }
}
