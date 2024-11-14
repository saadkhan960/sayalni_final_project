import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saylani_final_project/Controllers/payment_final_controller.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/View/Global%20Widgets/custom_app_bar.dart';
import 'package:saylani_final_project/View/Screen/paymentMethod/widgets/payment_method_bottom.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX controller binding
    final PaymentFinalController controller = Get.put(PaymentFinalController());

    return Stack(
      children: [
        Scaffold(
          appBar: const CustomAppBar(
            title: "Payment Method",
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: controller.formKey, // Attach the formKey for validation
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const SizedBox(height: AppSizes.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppSizes.spaceBtwItems,
                        right: AppSizes.spaceBtwItems,
                        bottom: 270),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select existing Card",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppSizes.smallSpace),
                        Container(
                          padding:
                              const EdgeInsets.all(AppSizes.mediumSpace + 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  AppSizes.extraborderRadius),
                              border: Border.all(
                                  width: 1, color: AppColors.lightGrey)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Iconsax.card,
                                    size: 18,
                                  ),
                                  SizedBox(width: AppSizes.extraSmallSpace),
                                  Text("**** **** **** 1934"),
                                ],
                              ),
                              Icon(Icons.delete_outline_outlined)
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        const Divider(),
                        const SizedBox(height: AppSizes.smallSpace),
                        Text(
                          "Or input new card",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(height: AppSizes.spaceBtwItems),
                        // ---- fields --
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Card Number",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: AppSizes.smallSpace),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppSizes.extraborderRadius),
                                border: Border.all(
                                    width: 1, color: AppColors.lightGrey),
                              ),
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: controller.cardNumberController,
                                decoration: const InputDecoration(
                                  hintText: "**** **** **** ****",
                                  hintStyle:
                                      TextStyle(color: AppColors.lightGrey),
                                  border: InputBorder.none,
                                ),
                                style: Theme.of(context).textTheme.bodyLarge,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter card number';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: AppSizes.spaceBtwItems),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Exp Date",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      const SizedBox(
                                          height: AppSizes.smallSpace),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppSizes.extraborderRadius),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.lightGrey),
                                        ),
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          controller:
                                              controller.expDateController,
                                          decoration: const InputDecoration(
                                            hintText: "mm/yy",
                                            hintStyle: TextStyle(
                                                color: AppColors.lightGrey),
                                            border: InputBorder.none,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter expiration date';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: AppSizes.spaceBtwItems),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Security Code",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      const SizedBox(
                                          height: AppSizes.smallSpace),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 3, horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppSizes.extraborderRadius),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.lightGrey),
                                        ),
                                        child: TextFormField(
                                          controller:
                                              controller.securityCodeController,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            hintText: "ccv/csv",
                                            hintStyle: TextStyle(
                                                color: AppColors.lightGrey),
                                            border: InputBorder.none,
                                          ),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter security code';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: AppSizes.spaceBtwItems),
                            Text(
                              "Card holder",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(height: AppSizes.smallSpace),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppSizes.extraborderRadius),
                                border: Border.all(
                                    width: 1, color: AppColors.lightGrey),
                              ),
                              child: TextFormField(
                                controller: controller.cardHolderController,
                                decoration: const InputDecoration(
                                  hintText: "Enter card holder name",
                                  hintStyle:
                                      TextStyle(color: AppColors.lightGrey),
                                  border: InputBorder.none,
                                ),
                                style: Theme.of(context).textTheme.bodyLarge,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter card holder name';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const PaymentMethodBottom()
      ],
    );
  }
}
