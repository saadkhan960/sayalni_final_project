import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/product_detail_controller.dart';
import 'package:saylani_final_project/Models/product_model.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';

class ColorsSelection extends StatefulWidget {
  const ColorsSelection({super.key, required this.product});
  final ProductModel product;

  @override
  State<ColorsSelection> createState() => _ColorsSelectionState();
}

class _ColorsSelectionState extends State<ColorsSelection> {
  final ProductDetailController productDetialController =
      Get.find<ProductDetailController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose the Color",
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: const Color.fromARGB(255, 119, 119, 119)),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.product.colors.length,
            itemBuilder: (context, index) {
              // Get the color name
              String colorName = widget.product.colors[index];

              // Return a container for each color
              return Obx(() {
                final chosseColor = productDetialController.selectedColor.value;
                return GestureDetector(
                  onTap: () {
                    productDetialController.selectedColor.value = colorName;
                  },
                  child: chosseColor != colorName
                      ? Container(
                          margin: const EdgeInsets.only(
                              right: AppSizes.spaceBtwItems),
                          height: 40,
                          width: 70,
                          decoration: BoxDecoration(
                            color: HelperFunction.getColorFromName(
                                colorName), // Map the color name to a color
                            borderRadius: const BorderRadius.all(
                              Radius.circular(AppSizes.extraborderRadius),
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(
                              right: AppSizes.spaceBtwItems),
                          height: 45,
                          width: 70,
                          decoration: BoxDecoration(
                            color: HelperFunction.getColorFromName(colorName),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppSizes.extraborderRadius)),
                            border: Border.all(color: Colors.white, width: 2),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    HelperFunction.getColorFromName(colorName)
                                        .withOpacity(0.4),
                                offset: const Offset(0, 0),
                                blurRadius: 3,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                        ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
