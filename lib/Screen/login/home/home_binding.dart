import 'package:get/get.dart';
import 'package:note_app/Screen/home/home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
