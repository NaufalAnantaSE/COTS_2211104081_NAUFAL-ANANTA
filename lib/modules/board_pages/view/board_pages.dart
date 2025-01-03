
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/board_controller.dart';


import 'orders_page.dart' as orders; // Halaman Pesanan

class BoardPages extends StatelessWidget {
  final BoardController controller = Get.put(BoardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            _getPageTitle(controller.tabIndex.value),
          ),
          backgroundColor: const Color(0xFF00AA13), // Green Gojek
        ),
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: [
            HomePageWithAds(), // Tab 0 dengan iklan di halaman Home
            orders.OrdersPage(), // Tab 2
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.tabIndex.value,
          onTap: controller.changeTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Promo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Pesanan',
            ),
          ],
          selectedItemColor: const Color(0xFF00AA13), // Green Gojek
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }

  String _getPageTitle(int tabIndex) {
    switch (tabIndex) {
      case 0:
        return "Home";
      case 1:
        return "Promo";
      case 2:
        return "Pesanan";
      default:
        return "Home";
    }
  }
}

class PromoPage {
}

class HomePageWithAds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Iklan
          Container(
            height: 150,
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  "https://github.com/user-attachments/assets/c4395f7f-eaa6-4565-a6aa-6a342534da87",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Konten Home
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Welcome to Home Page",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF004901), // Dark Green
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Explore our new features and enjoy the experience!",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
