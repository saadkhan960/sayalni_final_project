import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saylani_final_project/Controllers/login_controller.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';
import 'package:saylani_final_project/View/Global%20Widgets/round_button.dart';
import 'package:saylani_final_project/View/Screen/register/register_page.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.message,
                        size: 18,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextFormField(
                          controller: loginController.emailController,
                          decoration: const InputDecoration.collapsed(
                            hintText: "Enter your email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "Password",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8.0),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.grey[300]!),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Iconsax.key,
                        size: 18,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: TextFormField(
                          controller: loginController.passwordController,
                          decoration: const InputDecoration.collapsed(
                            hintText: "Enter your password",
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Obx(() => SizedBox(
                      height: 50,
                      width: Get.width,
                      child: CustomRoundButton(
                        onPress: () {
                          if (_formKey.currentState!.validate()) {
                            loginController.loginUser();
                          }
                        },
                        isLoading: loginController.isLoading.value,
                        text: "Login",
                      ),
                    )),
                const SizedBox(height: 10),
                SizedBox(
                  height: 50,
                  width: Get.width,
                  child: CustomRoundButton(
                    onPress: () {
                      HelperFunction.simpleAnimationNavigation(
                          screen: RegisterPage());
                    },
                    textColor: Colors.black,
                    bgColor: const Color.fromARGB(255, 230, 230, 230),
                    text: "Register Account",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
