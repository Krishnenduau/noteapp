import 'package:get/get.dart';
import 'package:note_app/Api/api.dart';

import 'package:http/http.dart' as http;
import 'package:note_app/Screen/home/home_view.dart';
import 'package:note_app/components/snackbar.dart';
import 'dart:convert';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var passwordVisible = false.obs;

  // Toggle password visibility
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  // Function to make the real API call for login
  static Future<bool> apiLogin(Map<String, String> data) async {
    final url = Uri.parse(ApiConstants.login); // Replace with your API URL
    final headers = {
      'Content-Type': 'application/json',
      'X-API-Key': 'reqres-free-v1', // Add your API key if needed
    };

    try {
      // Make POST request with email and password in the body
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(data),
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Parse response data, assuming successful login contains a token
        var responseData = json.decode(response.body);
        showCustomSnackbar('Success', 'Login successful:');

        return true; // Return true if login is successful
      } else {
        // If the response code is not 200, login failed
        var responseData = json.decode(response.body);
        String errorMessage =
            responseData['error'] ??
            'Login failed'; // Assuming API returns 'error' field for failure
        showCustomSnackbar(
          'Login Failed',
          errorMessage,
        ); // Show error message in snackbar
        return false; // Return false if login failed
      }
    } catch (e) {
      // Catch errors like network issues or invalid URL
      print('Error during login: $e');
      showCustomSnackbar('Error', 'An error occurred. Please try again.');
      return false; // Return false if there was an error
    }
  }

  // Function to handle login logic
  Future<void> login() async {
    // Check if either email or password is empty
    if (email.value.isEmpty || password.value.isEmpty) {
      showCustomSnackbar('Message', 'Please fill in both email and password');
      return; // Don't proceed further if fields are empty
    }

    final data = {'email': email.value, 'password': password.value};

    // Make the API call to validate the login
    final isSuccess = await apiLogin(data);

    if (isSuccess) {
      // Navigate to the HomePage on success
      Get.offAll(() => HomePage());
    } else {
      showCustomSnackbar('Login Failed', 'Invalid username or password');
    }
  }
}
