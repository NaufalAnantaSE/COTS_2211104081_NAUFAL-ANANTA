import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Find services, food, or places',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Section: Icon Grid
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 4,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            physics: NeverScrollableScrollPhysics(),
            children: [
              _buildServiceIcon(Icons.directions_car, 'GoRide'),
              _buildServiceIcon(Icons.delivery_dining, 'GoFood'),
              _buildServiceIcon(Icons.local_grocery_store, 'GoMart'),
              _buildServiceIcon(Icons.wallet, 'GoPay'),
              _buildServiceIcon(Icons.movie, 'GoTix'),
              _buildServiceIcon(Icons.health_and_safety, 'GoMed'),
              _buildServiceIcon(Icons.more_horiz, 'More'),
            ],
          ),
          SizedBox(height: 20),
          // Section: Points and Badges
          Card(
            color: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '321 XP to your next treasure',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Level up to unlock more rewards',
                        style: TextStyle(
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 32,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Section: Promotions with Images
          _buildPromotionCard(
            'https://github.com/user-attachments/assets/c4395f7f-eaa6-4565-a6aa-6a342534da87/promo1.png',
            'Makin Seru 🤑',
            'Aktifkan & Sambungkan GoPay & GoPayLater di Tokopedia!',
          ),
          _buildPromotionCard(
            'https://github.com/user-attachments/assets/c4395f7f-eaa6-4565-a6aa-6a342534da87/promo2.png',
            'Makin Seru 😍',
            'Tukarkan poin dan nikmati voucher eksklusif!',
          ),
          _buildPromotionCard(
            'https://github.com/user-attachments/assets/c4395f7f-eaa6-4565-a6aa-6a342534da87/promo3.png',
            'Bayar Apa Aja Lebih Hemat!',
            'Pakai GoPay untuk promo cashback hingga 10%',
          ),
        ],
      ),
    );
  }

  Widget _buildServiceIcon(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.green,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildPromotionCard(String imageUrl, String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
