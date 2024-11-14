import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/cart_controller.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';
import 'package:saylani_final_project/View/Global%20Widgets/round_button.dart';
import 'package:saylani_final_project/View/Screen/paymentMethod/payment_method.dart';

class CheckoutBottomCart extends StatefulWidget {
  const CheckoutBottomCart({super.key});

  @override
  State<CheckoutBottomCart> createState() => _CheckoutBottomCartState();
}

class _CheckoutBottomCartState extends State<CheckoutBottomCart> {
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
                    "Total price (3 items)",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Obx(() => Text(
                        "\$ ${cartController.totalPrice.value}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ))
                ],
              ),
              Obx(
                () => cartController.courierPrice.value != 0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Courier",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            "\$ ${cartController.courierPrice.value}",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Marketplace fee",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    "\$ 1.23",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Obx(() => Text(
                        "\$ ${cartController.totalPrice.value + cartController.courierPrice.value + 1.23}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ))
                ],
              ),
              const SizedBox(height: AppSizes.spaceBtwItems),
              Obx(() => SizedBox(
                    height: 50,
                    width: Get.width,
                    child: cartController.courierPrice.value == 0
                        ? CustomRoundButton(
                            onPress: () {
                              HelperFunction.showSnackbar(
                                // title: "Login Error",
                                message: "Please select delivery",
                                color: Colors.amber,
                              );
                            },
                            textColor: Colors.black,
                            bgColor: const Color.fromARGB(255, 230, 230, 230),
                            text: "Select Payment Method",
                          )
                        : CustomRoundButton(
                            onPress: () {
                              HelperFunction.simpleAnimationNavigation(
                                  screen: const PaymentMethod());
                            },
                            text: "Select Payment Method",
                          ),
                  ))
            ],
          )),
    );
  }
}
