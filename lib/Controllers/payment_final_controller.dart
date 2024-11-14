import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';

class PaymentFinalController extends GetxController {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void submitForm() {
    if (formKey.currentState?.validate() ?? false) {
      HelperFunction.showOrderSuccess();
    } else {
      HelperFunction.showSnackbar(
        title: "Error",
        message: "Please fill in all the fields correctly.",
        color: Colors.red,
      );
    }
  }

  @override
  void onClose() {
    cardNumberController.dispose();
    expDateController.dispose();
    securityCodeController.dispose();
    cardHolderController.dispose();
    super.onClose();
  }
}
