import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart'; // Pastikan path ini benar
import '../../board_pages/view/board_pages.dart'; // Impor BoardPages jika diperlukan

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/images/gojek_logo.png', // Pastikan logo tersedia
              height: 20,
            ),
            const SizedBox(width: 8),
            const Text(
              "Login",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: Colors.black,
            ),
            onPressed: () {
              // Aksi untuk bantuan
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Masukkan nomor HP kamu yang terdaftar untuk login",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                // Kode Negara
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.flag, color: Colors.black),
                      const SizedBox(width: 8),
                      const Text(
                        "+62",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                // Input Nomor Telepon
                Expanded(
                  child: TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: "81234567890",
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.cancel, color: Colors.grey),
                        onPressed: () {
                          phoneController.clear();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Aksi untuk "Ada masalah dengan nomor?"
              },
              child: const Text(
                "Ada masalah dengan nomor?",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF00AA13), // Hijau Gojek
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Spacer(),
            // Tombol Continue
            ElevatedButton(
              onPressed: () {
                // Navigasi ke board_pages
                Get.offAll(() => BoardPages()); // Pastikan BoardPages diimpor
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00AA13), // Hijau Gojek
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Placeholder untuk Keyboard NumPad (opsional)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Colors.grey[200],
              child: const Text(
                "Keyboard NumPad Placeholder",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
