import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/board_controller.dart';
import 'home_page.dart';
import 'promo_page.dart';
import 'orders_page.dart';

class BoardPages extends StatelessWidget {
  final BoardController controller = Get.put(BoardController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            _getPageTitle(controller.tabIndex.value),
            style: const TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xFF00AA13), // Green Gojek
        ),
        body: IndexedStack(
          index: controller.tabIndex.value,
          children: [
            HomePage(),
            PromoPage(),
            OrdersPage(),
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
          selectedItemColor: const Color(0xFF00AA13),
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
