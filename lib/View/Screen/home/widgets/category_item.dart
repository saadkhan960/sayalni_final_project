import 'package:flutter/material.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key,
      required this.assetString,
      required this.categoryName,
      required this.backgroundColor});
  final String assetString;
  final String categoryName;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(AppSizes.extraborderRadius),
            ),
          ),
          child: Center(
            child: Image.asset(
              assetString,
              height: 35,
              width: 35,
            ),
          ),
        ),
        const SizedBox(height: AppSizes.extraSmallSpace),
        Text(
          categoryName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
