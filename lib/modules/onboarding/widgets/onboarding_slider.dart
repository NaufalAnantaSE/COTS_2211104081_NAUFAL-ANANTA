import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';

class OnboardingSlider extends StatefulWidget {
  @override
  _OnboardingSliderState createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  final OnboardingController controller = Get.find();
  final PageController _pageController = PageController();
  Timer? _autoSlideTimer;

  final List<Map<String, String>> onboardingData = [
    {
      "title": "Welcome to the App",
      "subtitle": "Discover a new experience with us.",
      "image": "assets/images/onboarding1.png",
    },
    {
      "title": "Easy to Use",
      "subtitle": "Enjoy our user-friendly interface.",
      "image": "assets/images/onboarding2.png",
    },
    {
      "title": "Get Started",
      "subtitle": "Begin your journey today!",
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
      int nextPage = _pageController.page!.toInt() + 1;

      if (nextPage >= onboardingData.length) {
        nextPage = 0; // Kembali ke halaman pertama
      }

      _pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      controller.changePage(nextPage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) => controller.changePage(index),
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(data["image"]!, height: 300),
                      const SizedBox(height: 20),
                      Text(
                        data["title"]!,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        data["subtitle"]!,
                        style: const TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Indikator Halaman
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: controller.currentPage.value == index ? 16 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value == index
                        ? Colors.green
                        : Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // Tombol Skip dan Next
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(onboardingData.length - 1);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    int nextPage = _pageController.page!.toInt() + 1;
                    if (nextPage >= onboardingData.length) {
                      // Jika halaman terakhir, navigasi ke halaman berikutnya
                      Get.offNamed('/login');
                    } else {
                      _pageController.animateToPage(
                        nextPage,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text("Next"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
