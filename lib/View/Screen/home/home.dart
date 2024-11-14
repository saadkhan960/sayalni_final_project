import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/View/Global%20Widgets/product_grid_view.dart';
import 'package:saylani_final_project/View/Screen/home/widgets/category_list.dart';
import 'package:saylani_final_project/View/Screen/home/widgets/custom_app_bar.dart';
import 'package:saylani_final_project/View/Screen/home/widgets/heading.dart';
import 'package:saylani_final_project/View/Screen/home/widgets/serach_home.dart';
import 'package:saylani_final_project/View/Screen/home/widgets/thumbnails.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 30,
            ),
            const CustomAppBar(),
            //Search
            const SerachHome(),
            //Thumbnails
            const Thumbnails(),
            Padding(
                padding: const EdgeInsets.all(AppSizes.defaultSpace),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Category
                    const CustomHeading(
                      headingText: "Category",
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    const CategoryList(),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    //Recent Products
                    CustomHeading(
                      headingText: "Recent Products",
                      trailingWidget: Container(
                        padding: const EdgeInsets.all(
                          AppSizes.extraSmallSpace,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightGrey,
                            width: 1.0,
                          ),
                          borderRadius:
                              BorderRadius.circular(AppSizes.borderRadius),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Filters",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(width: AppSizes.spaceBtwItems),
                            const Icon(
                              Iconsax.filter,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBtwItems),
                    const ProductGridView()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
