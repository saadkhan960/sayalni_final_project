// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:saylani_final_project/Utils/app_colors.dart';
// import 'package:saylani_final_project/Utils/app_sizes.dart';
// import 'package:saylani_final_project/View/Global%20Widgets/round_button.dart';

// class ProductShow extends StatelessWidget {
//   const ProductShow({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 170,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(AppSizes.extraborderRadius),
//           color: AppColors.productShowBackground),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           ClipRRect(
//               borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(AppSizes.extraborderRadius),
//                   topRight: Radius.circular(AppSizes.extraborderRadius)),
//               child: Image.asset(
//                 "assets/product_images/2.jpeg",
//               )),
//           const SizedBox(height: AppSizes.spaceBtwItems),
//           Padding(
//               padding: const EdgeInsets.only(
//                   left: AppSizes.smallSpace,
//                   right: AppSizes.smallSpace,
//                   bottom: AppSizes.smallSpace),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Monitor LG 22'inc 2K Display HDR",
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     softWrap: true,
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   const SizedBox(height: AppSizes.smallSpace),
//                   const Text(
//                     "\$199.99",
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                     softWrap: true,
//                     style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
//                   ),
//                   const SizedBox(height: AppSizes.smallSpace),
//                   Center(
//                     child: SizedBox(
//                       width: Get.width / 2.4,
//                       child: CustomRoundButton(
//                         onPress: () {},
//                       ),
//                     ),
//                   )
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';
import 'package:saylani_final_project/View/Global%20Widgets/round_button.dart';

class ProductShow extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final VoidCallback onAddToCart;
  final VoidCallback onProductTap;

  const ProductShow(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.onAddToCart,
      required this.onProductTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onProductTap,
      child: Container(
        width: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.extraborderRadius),
          color: AppColors.productShowBackground,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSizes.extraborderRadius),
                topRight: Radius.circular(AppSizes.extraborderRadius),
              ),
              child: SizedBox(
                height: Get.width / 3.5,
                width: Get.width,
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.spaceBtwItems),
            Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.smallSpace,
                right: AppSizes.smallSpace,
                bottom: AppSizes.smallSpace,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(height: AppSizes.smallSpace),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: AppSizes.smallSpace),
                  Center(
                    child: SizedBox(
                      width: Get.width / 2.4,
                      child: CustomRoundButton(
                        onPress: onAddToCart,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
