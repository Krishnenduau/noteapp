import 'package:get/get.dart';
import 'package:note_app/Screen/login/login_logic.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
