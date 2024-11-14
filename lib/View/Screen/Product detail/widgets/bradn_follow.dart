import 'package:flutter/material.dart';
import 'package:saylani_final_project/Models/product_model.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';

class BradnFollow extends StatelessWidget {
  const BradnFollow({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(product.brandimage),
              radius: 30,
            ),
            const SizedBox(width: AppSizes.spaceBtwItems),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.brand,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400)),
                Text("online ${product.online} mins ago",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(color: const Color.fromARGB(255, 119, 119, 119)))
              ],
            )
          ],
        ),
        Container(
          height: 45,
          width: 100,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.all(Radius.circular(AppSizes.borderRadius)),
            border: Border.all(color: AppColors.lightGrey, width: 1),
          ),
          child: Center(
            child: Text(
              "Follow",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        )
      ],
    );
  }
}
