import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var currentIndex = 0.obs;

  get currentPage => null;

  void changePage(int index) {
    currentIndex.value = index;
  }
}
