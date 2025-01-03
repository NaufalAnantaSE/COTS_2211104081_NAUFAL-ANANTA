import 'package:get/get.dart';

import '../../modules/board_pages/bindings/board_binding.dart';
import '../../modules/board_pages/view/board_pages.dart'; // Pastikan path menuju board_pages benar
import '../../modules/login/bindings/login_binding.dart';
import '../../modules/login/view/login_page.dart';
import '../../modules/onboarding/bindings/onboarding_binding.dart';
import '../../modules/onboarding/view/onboarding_page.dart';

class AppRoutes {
  // Daftar nama rute
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String board = '/board';

  // Daftar halaman dan binding
  static final List<GetPage> pages = [
    GetPage(
      name: onboarding,
      page: () => OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: board,
      page: () => BoardPages(), // Panggil kelas BoardPages
      binding: BoardBinding(),
    ),
  ];
}
