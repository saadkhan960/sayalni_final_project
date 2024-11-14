import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/cart_controller.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/View/Global%20Widgets/custom_app_bar.dart';
import 'package:saylani_final_project/View/Screen/cart/widgets/bottom_cart.dart';
import 'package:saylani_final_project/View/Screen/cart/widgets/cart_product.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        appBar: const CustomAppBar(
          title: "Your Cart",
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
                    bottom: 180),
                child: Obx(
                  () => cartController.cartItems.isNotEmpty
                      ? ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (_, index) => const SizedBox(
                            height: 15,
                          ),
                          itemCount: cartController.cartItems.length,
                          itemBuilder: (context, index) {
                            final item = cartController.cartItems[index];
                            return CartProduct(
                              isCheckout: false,
                              cartmodel: item,
                              index: index,
                            );
                          },
                        )
                      : Center(
                          child: Image.asset(
                            'assets/checkut/empty_cart.png',
                            width: Get.width,
                            height: Get.height * 0.5,
                          ),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
      Obx(() => cartController.cartItems.isNotEmpty
          ? const BottomCart()
          : const SizedBox.shrink())
    ]);
  }
}
