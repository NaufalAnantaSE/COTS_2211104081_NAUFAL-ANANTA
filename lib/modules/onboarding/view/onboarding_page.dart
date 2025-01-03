import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  Timer? _autoSlideTimer;
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Selamat datang di gojek!",
      "subtitle":
          "Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun.",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Transportasi & logistik",
      "subtitle":
          "Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Pesan makan & belanja",
      "subtitle": "Lagi ngidam sesuatu? Gojek beliin gak pakai lama.",
      "image": "assets/images/onboarding3.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _autoSlideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _autoSlideTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      int nextPage = _currentIndex + 1;

      if (nextPage >= onboardingData.length) {
        nextPage = 0; // Kembali ke halaman pertama
      }

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      setState(() {
        _currentIndex = nextPage;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Gambar
                        Image.asset(
                          data["image"]!,
                          height: 250,
                        ),
                        const SizedBox(height: 20),
                        // Judul
                        Text(
                          data["title"]!,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        // Subjudul
                        Text(
                          data["subtitle"]!,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Indikator PageView
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentIndex == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? const Color(0xFF00AA13) // Aktif (Hijau)
                        : Colors.grey, // Tidak Aktif
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Tombol Masuk
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Arahkan ke halaman login
                  Get.toNamed('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00AA13), // Green Gojek
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Teks Daftar
            TextButton(
              onPressed: () {
                // Arahkan ke halaman daftar
                Get.toNamed('/register');
              },
              child: const Text(
                "Belum ada akun?, Daftar dulu",
                style: TextStyle(
                  color: Color(0xFF00AA13), // Green Gojek
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Dengan masuk atau mendaftar, kamu menyetujui Ketentuan layanan dan Kebijakan privasi.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
