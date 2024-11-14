import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';
import 'package:saylani_final_project/View/bottom_nav_menu.dart/bottom_nav_menu.dart';

class RegiterController extends GetxController {
  // Controllers for email and password input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isLoading = false.obs;

  // FirebaseAuth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to register a new user
  Future<void> registerAccount() async {
    try {
      isLoading.value = true;
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        isLoading.value = false;
        HelperFunction.showSnackbar(
            title: "Error",
            message: "Email and password cannot be empty",
            color: Colors.red);

        return;
      }

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading.value = false;
      emailController.clear();
      passwordController.clear();
      HelperFunction.showSnackbar(
          title: "Success",
          message: "Account created for ${userCredential.user!.email}");
      HelperFunction.mostStrictAnimationNavigation(screen: BottomNavMenu());
    } catch (e) {
      isLoading.value = false;
      HelperFunction.showSnackbar(
          title: "Registration Error",
          message: "Something Went Wrong",
          color: Colors.red);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
