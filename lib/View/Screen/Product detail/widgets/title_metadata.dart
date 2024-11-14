import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saylani_final_project/Models/product_model.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';

class TitleMetadata extends StatelessWidget {
  const TitleMetadata({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width * 0.7,
              child: Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Row(
              children: [
                Text(
                  "\$${product.price}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 21),
                ),
                const SizedBox(
                  width: AppSizes.smallSpace,
                ),
                Text(
                  "( ${product.buyCount} people buy this )",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(color: const Color.fromARGB(194, 0, 0, 0)),
                ),
              ],
            )
          ],
        ),
        Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(50)),
          child: const Center(
            child: Icon(
              Iconsax.heart,
              color: Color.fromARGB(255, 119, 119, 119),
            ),
          ),
        )
      ],
    );
  }
}
