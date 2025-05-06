import 'package:get/get.dart';
import 'package:note_app/Api/api.dart';

import 'package:http/http.dart' as http;
import 'package:note_app/Screen/home/home_view.dart';
import 'package:note_app/components/snackbar.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var passwordVisible = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  static Future<bool> apiLogin(Map<String, String> data) async {
    await Future.delayed(Duration(seconds: 2));

    const validEmail = 'eve.holt@reqres.in';
    const validPassword = 'cityslicka';

    if (data['email'] == validEmail && data['password'] == validPassword) {
      return true;
    } else {
      return false;
    }
  }

  // Function to handle login logic
  Future<void> login(String email, String password) async {
    // Check if either email or password is empty
    if (email.isEmpty || password.isEmpty) {
      showCustomSnackbar('Message', 'Please fill in both email and password');

      return; // Don't proceed further if fields are empty
    }

    final data = {'email': email, 'password': password};

    // Simulate an API call to validate the login
    final isSuccess = await apiLogin(data);

    if (isSuccess) {
      // Navigate to the HomePage on success
      Get.offAll(() => HomePage());
    } else {
      showCustomSnackbar('Login Failed', 'Invalid username or password');
    }
  }
}
