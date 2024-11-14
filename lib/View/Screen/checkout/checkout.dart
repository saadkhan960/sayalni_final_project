// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/cart_controller.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';
import 'package:saylani_final_project/View/Global%20Widgets/custom_app_bar.dart';
import 'package:saylani_final_project/View/Screen/cart/widgets/cart_product.dart';
import 'package:saylani_final_project/View/Screen/checkout/widgets/checkout_bottom_cart.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: const CustomAppBar(
          title: "Checkout",
          centerTitle: false,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: AppSizes.smallSpace,
                    horizontal: AppSizes.spaceBtwItems),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery to",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Row(children: [
                      Text(
                        "Salatiga City, Central Java",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(width: 5), // Small space
                      const Icon(Icons.keyboard_arrow_down),
                    ])
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Padding(
                padding: const EdgeInsets.only(
                    left: AppSizes.spaceBtwItems,
                    right: AppSizes.spaceBtwItems,
                    bottom: 250),
                child: Column(
                  children: [
                    Obx(
                      () => SizedBox(
                        height: 150,
                        child: ListView.separated(
                          shrinkWrap: true,
                          separatorBuilder: (_, index) => const SizedBox(
                            height: 15,
                          ),
                          itemCount: cartController.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartController.cartItems.value[index];
                            return CartProduct(
                              isCheckout: true,
                              cartmodel: item,
                              index: index,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    InkWell(
                      onTap: () {
                        HelperFunction.showDeliveryOptionsBottomSheet();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(AppSizes.mediumSpace + 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                AppSizes.extraborderRadius),
                            border: Border.all(
                                width: 1, color: AppColors.lightGrey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              final value = cartController.deliveryMethod.value;
                              return cartController.courierPrice.value == 0
                                  ? const Text("Select the delivery option")
                                  : Text("${value["type"]}");
                            }),
                            const Icon(Icons.keyboard_arrow_right_rounded)
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spacerBtwSections),
                    const Divider(),
                    const SizedBox(height: AppSizes.spacerBtwSections),
                    Container(
                      padding: const EdgeInsets.all(AppSizes.mediumSpace + 5),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.extraborderRadius),
                          border:
                              Border.all(width: 1, color: AppColors.lightGrey)),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Apply a Discounts"),
                          Icon(Icons.keyboard_arrow_right_rounded)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      const CheckoutBottomCart()
    ]);
  }
}
