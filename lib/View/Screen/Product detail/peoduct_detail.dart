import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/product_detail_controller.dart';
import 'package:saylani_final_project/Models/product_model.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/View/Global%20Widgets/custom_app_bar.dart';
import 'package:saylani_final_project/View/Screen/Product%20detail/widgets/bottom_menu_cart.dart';
import 'package:saylani_final_project/View/Screen/Product%20detail/widgets/bradn_follow.dart';
import 'package:saylani_final_project/View/Screen/Product%20detail/widgets/colors_Selection.dart';
import 'package:saylani_final_project/View/Screen/Product%20detail/widgets/title_metadata.dart';
import 'package:saylani_final_project/View/Screen/home/widgets/heading.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final ProductDetailController productDetialController =
      Get.find<ProductDetailController>();
  @override
  Widget build(BuildContext context) {
    ProductModel productValues =
        productDetialController.productModelDetail.value;
    return Stack(children: [
      Scaffold(
        appBar: const CustomAppBar(title: "Details Product"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //Image
              Container(
                height: Get.height / 3,
                width: Get.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(productValues.image),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: AppSizes.smallSpace),

              Padding(
                padding: const EdgeInsets.only(
                    left: AppSizes.defaultSpace,
                    right: AppSizes.defaultSpace,
                    bottom: 125,
                    top: AppSizes.smallSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Title and metadata
                    TitleMetadata(
                      product: productValues,
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    //Color--------------
                    ColorsSelection(
                      product: productValues,
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    const Divider(),
                    // ---brand and follow
                    BradnFollow(
                      product: productValues,
                    ),
                    const Divider(),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    const CustomHeading(
                      headingText: "Description of product",
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    //Description
                    Text(productValues.description),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      BottomMenuCart(
        selectColor: productDetialController.selectedColor.value,
        productId: productValues.productId,
      )
    ]);
  }
}
