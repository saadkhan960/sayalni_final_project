import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/cart_controller.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/View/Global%20Widgets/round_button.dart';

class BottomMenuCart extends StatefulWidget {
  const BottomMenuCart(
      {super.key, required this.productId, required this.selectColor});
  final int productId;
  final String selectColor;

  @override
  State<BottomMenuCart> createState() => _BottomMenuCartState();
}

class _BottomMenuCartState extends State<BottomMenuCart> {
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.only(
            left: AppSizes.defaultSpace,
            right: AppSizes.defaultSpace,
            top: AppSizes.defaultSpace,
            bottom: 20),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            border:
                Border(top: BorderSide(width: 1, color: Colors.grey.shade300))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: CustomRoundButton(
                  onPress: () {
                    cartController.addonPageToCart(
                        widget.productId, widget.selectColor);
                  },
                  text: "Add to Cart",
                ),
              ),
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Expanded(
              child: SizedBox(
                height: 100,
                width: double.infinity,
                child: CustomRoundButton(
                  onPress: () {},
                  textColor: Colors.black,
                  bgColor: const Color.fromARGB(255, 230, 230, 230),
                  text: "Buy Now",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
