import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saylani_final_project/Controllers/cart_controller.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';
import 'package:saylani_final_project/View/Screen/cart/cart.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0), // Padding for the container
      color: Theme.of(context)
          .appBarTheme
          .backgroundColor, // Background color for the custom app bar
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Column content for the title and address
          Column(
            children: [
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery address",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Row(children: [
                      Text(
                        "Salatiga City, Central Java",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      const SizedBox(width: 5), // Small space
                      const Icon(Icons.keyboard_arrow_down),
                    ])
                  ],
                )
              ])
            ],
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    HelperFunction.simpleAnimationNavigation(
                        screen: const Cart());
                  },
                  icon: Obx(
                    () => Stack(
                      children: [
                        const Icon(
                          Iconsax.shopping_cart,
                          size: 30,
                        ),
                        if (cartController.cartItems
                            .isNotEmpty) // Check if there are items in the cart
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 15,
                                minHeight: 15,
                              ),
                              child: Center(
                                child: Text(
                                  cartController.cartItems.length
                                      .toString(), // Show the count
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  )),
              IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.notification, size: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
