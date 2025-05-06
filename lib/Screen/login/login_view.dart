import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/components/common_textfield.dart';
import 'package:note_app/Screen/login/login_logic.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ), // 5% padding on left and right
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ), // To ensure some space from the top
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Email Field
                CommonTextField(
                  label: 'Email',
                  controller: emailController,
                  onChanged: (value) => controller.email.value = value,
                  isPasswordField: false,
                ),
                const SizedBox(height: 20),

                // Password Field with visibility toggle
                Obx(
                  () => CommonTextField(
                    label: 'Password',
                    controller: passwordController,
                    obscureText: controller.passwordVisible.value,
                    isPasswordField: true,
                    onChanged: (value) => controller.password.value = value,
                    onToggleVisibility: controller.togglePasswordVisibility,
                  ),
                ),
                const SizedBox(height: 30),

                // Login Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(
                      size.width * 0.8,
                      size.height * 0.07,
                    ), // 80% width, 7% height
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    controller.login();
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
