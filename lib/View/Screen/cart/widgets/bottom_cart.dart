import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/cart_controller.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';
import 'package:saylani_final_project/View/Global%20Widgets/round_button.dart';
import 'package:saylani_final_project/View/Screen/checkout/checkout.dart';

class BottomCart extends StatefulWidget {
  const BottomCart({super.key});

  @override
  State<BottomCart> createState() => _BottomCartState();
}

class _BottomCartState extends State<BottomCart> {
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
              bottom: 20),
          // height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  top: BorderSide(width: 1, color: Colors.grey.shade300))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Order Summary",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.keyboard_arrow_up_outlined))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Obx(() => Text(
                        "\$ ${cartController.totalPrice.value}",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ))
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              SizedBox(
                height: 50,
                width: Get.width,
                child: CustomRoundButton(
                  onPress: () {
                    HelperFunction.simpleAnimationNavigation(
                        screen: const Checkout());
                  },
                  text: "Continue for payments",
                ),
              )
            ],
          )),
    );
  }
}
