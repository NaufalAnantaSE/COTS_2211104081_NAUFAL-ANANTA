import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs; // Tambahkan .obs agar bisa diobservasi

  void login() {
    isLoading.value = true; // Pastikan isLoading sudah terdefinisi
    Future.delayed(Duration(seconds: 1), () {
      isLoading.value = false;
      Get.offAllNamed('/board'); // Pastikan rute '/board' sudah terdaftar
    });
  }
}
