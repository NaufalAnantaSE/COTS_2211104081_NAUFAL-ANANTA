import 'package:get/get.dart';

class BoardController extends GetxController {
  // Tab index untuk bottom navigation bar
  var tabIndex = 0.obs;

  // Method untuk mengupdate tab index
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
