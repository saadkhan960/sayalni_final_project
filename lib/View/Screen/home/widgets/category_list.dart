import 'package:flutter/material.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';
import 'package:saylani_final_project/View/Screen/home/widgets/category_item.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CategoryItem(
          assetString: "assets/category_icons/1.png",
          categoryName: "Apparel",
          backgroundColor: AppColors.cList1,
        ),
        CategoryItem(
          assetString: "assets/category_icons/2.png",
          categoryName: "School",
          backgroundColor: AppColors.cList2,
        ),
        CategoryItem(
          assetString: "assets/category_icons/3.png",
          categoryName: "Sports",
          backgroundColor: AppColors.cList3,
        ),
        CategoryItem(
          assetString: "assets/category_icons/4.png",
          categoryName: "Electronic",
          backgroundColor: AppColors.cList4,
        ),
        CategoryItem(
          assetString: "assets/category_icons/4.png",
          categoryName: "All",
          backgroundColor: AppColors.secondary,
        ),
      ],
    );
  }
}
