import 'package:get/get.dart';
import '../controller/board_controller.dart';

class BoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BoardController>(() => BoardController());
  }
}
