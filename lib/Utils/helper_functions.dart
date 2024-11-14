// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/cart_controller.dart';
import 'package:saylani_final_project/Controllers/payment_final_controller.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';
import 'package:saylani_final_project/View/Global%20Widgets/round_button.dart';
import 'package:saylani_final_project/View/bottom_nav_menu.dart/bottom_nav_menu.dart';

class HelperFunction {
  static final CartController cartController = Get.find<CartController>();
  static final PaymentFinalController paymentController =
      Get.find<PaymentFinalController>();
  static Color getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case "white":
        return Colors.white;
      case "black":
        return Colors.black;
      case "red":
        return Colors.red;
      case "blue":
        return Colors.blue;
      case "green":
        return Colors.green;
      case "yellow":
        return Colors.yellow;
      case "pink":
        return Colors.pink;
      case "grey":
        return Colors.grey;
      case "purple":
        return Colors.purple;
      case "orange":
        return Colors.orange;
      case "silver":
        return const Color(0xFFC0C0C0); // Silver color in Hex
      case "beige":
        return const Color(0xFFF5F5DC); // Beige color in Hex
      case "gold":
        return const Color(0xFFD4AF37); // Gold color in Hex
      default:
        return Colors.transparent; // Default to transparent if color is unknown
    }
  }

  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }

  static Future<void> copyToClipboardAndShowSnackbar({
    required String copyText,
    int duration = 1,
    Color color = Colors.green,
    Icon? icon,
  }) async {
    await Clipboard.setData(ClipboardData(text: copyText));
    Get.snackbar(
      '',
      'Text copied to clipboard!',
      titleText: const SizedBox.shrink(),
      snackStyle: SnackStyle.FLOATING,
      backgroundColor: color,
      colorText: Colors.white,
      icon: icon,
      duration: Duration(seconds: duration),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(bottom: 10.0),
    );
  }

  static void showSnackbar({
    String? title,
    required String message,
    Color color = Colors.green,
    int duration = 2,
    Icon? icon,
  }) {
    Get.snackbar(
      '',
      '',
      titleText: title != null
          ? Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : const SizedBox.shrink(),
      messageText: message != ""
          ? Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
                maxLines: 2,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            )
          : const SizedBox.shrink(),
      backgroundColor: color,
      duration: Duration(seconds: duration),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      borderRadius: 10,
      isDismissible: true,
      icon: icon,
    );
  }

  static void simpleAnimationNavigation({
    required Widget screen,
    int durationInMillisec = 200,
    Cubic animationCurve = Curves.easeIn,
  }) {
    Get.to(
      screen,
      transition: Transition.rightToLeftWithFade,
      duration: Duration(milliseconds: durationInMillisec),
      curve: animationCurve,
      fullscreenDialog: true,
    );
  }

  static void mostStrictAnimationNavigation({
    required Widget screen,
    int durationInMillisec = 200,
    Cubic animationCurve = Curves.easeIn,
  }) {
    Get.offAll(
      screen,
      transition: Transition.rightToLeft,
      duration: Duration(milliseconds: durationInMillisec),
      curve: animationCurve,
    );
  }

  static void showCustomDialog({
    required String titleText,
    String? contentText,
    String deleteButtonText = "Delete",
    String cancelButtonText = "Cancel",
    required VoidCallback onDelete,
    VoidCallback? onCancel,
    Color backgroundColor = Colors.white,
    Color titleTextColor = Colors.black,
    Color contentTextColor = Colors.black,
    bool clickOnBackgroundToRemove = false,
  }) {
    Get.dialog(
      AlertDialog(
        backgroundColor: backgroundColor,
        title: titleText.isNotEmpty
            ? Center(
                child: Text(
                  titleText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: titleTextColor,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        content: contentText != null
            ? Text(
                contentText,
                textAlign: TextAlign.center,
                style: TextStyle(color: contentTextColor),
              )
            : null,
        actions: [
          TextButton(
            onPressed: onDelete,
            child: Text(
              deleteButtonText,
              style: const TextStyle(color: Colors.red),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              minimumSize: const Size(0, 40),
              padding: const EdgeInsets.symmetric(horizontal: 16),
            ),
            onPressed: onCancel,
            child: Text(cancelButtonText),
          ),
        ],
        actionsAlignment: MainAxisAlignment.spaceAround,
      ),
      barrierDismissible: clickOnBackgroundToRemove,
    );
  }

  static void showDeliveryOptionsBottomSheet() {
    Get.bottomSheet(
      Container(
          padding: const EdgeInsets.all(16.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with close button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Select the delivery",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        Get.back(); // Close the bottom sheet
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                // Delivery Options
                InkWell(
                    onTap: () {
                      cartController.deliveryMethod.value = {
                        "type": "Express 1 - 3 days delivery",
                        "price": 14.99
                      };
                      cartController.courierPrice.value = 14.99;
                    },
                    child: buildDeliveryOption(
                        "Express", "1 - 3 days delivery", "\$14,99", "14.99")),
                const SizedBox(height: 8),
                InkWell(
                    onTap: () {
                      cartController.courierPrice.value = 7.99;
                      cartController.deliveryMethod.value = {
                        "type": "Regular 2 - 4 days delivery",
                        "price": 7.99
                      };
                    },
                    child: buildDeliveryOption(
                        "Regular", "2 - 4 days delivery", "\$7,99", "7.99")),
                const SizedBox(height: 8),
                InkWell(
                    onTap: () {
                      cartController.courierPrice.value = 2.99;
                      cartController.deliveryMethod.value = {
                        "type": "Cargo 7 - 14 days delivery",
                        "price": 2.99
                      };
                    },
                    child: buildDeliveryOption(
                        "Cargo", "7 - 14 days delivery", "\$2,99", "2.99")),
              ])),
      isScrollControlled: true,
    );
  }

  static Widget buildDeliveryOption(
      String title, String subtitle, String price, String checkPrice) {
    return Obx(() {
      final pricing =
          cartController.deliveryMethod.value['price']?.toStringAsFixed(2) ??
              "0";
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
            color: pricing == checkPrice
                ? AppColors.primaryLight
                : Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
            border: pricing == checkPrice
                ? Border.all(color: AppColors.primary)
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    });
  }

  static void showOrderSuccess() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/checkut/order_done.png",
                        height: 120,
                        width: 120,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Congrats! you payment is successfull",
                          style: Theme.of(Get.context!).textTheme.titleLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Track your order or just chat directly to the seller. Download order summary in down below",
                          style: Theme.of(Get.context!).textTheme.labelSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                      )
                    ],
                  ),
                ),
              )),

              const SizedBox(height: 16),
              // Delivery Options
              SizedBox(
                height: 50,
                width: Get.width,
                child: CustomRoundButton(
                  onPress: () {
                    cartController.cartItems.value = [];
                    cartController.totalPrice.value = 0;
                    cartController.courierPrice.value = 0;
                    cartController.deliveryMethod.value = {};
                    paymentController.cardHolderController.clear();
                    paymentController.expDateController.clear();
                    paymentController.securityCodeController.clear();
                    paymentController.cardHolderController.clear();
                    HelperFunction.mostStrictAnimationNavigation(
                        screen: BottomNavMenu());
                  },
                  textColor: Colors.white,
                  bgColor: AppColors.primary,
                  text: "Continue Shopping",
                ),
              )
            ]),
      ),
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
    );
  }
}
