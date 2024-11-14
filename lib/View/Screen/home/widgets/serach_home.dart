import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';

class SerachHome extends StatelessWidget {
  const SerachHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGrey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Iconsax.search_normal),
          hintText: "Search here...",
          hintStyle: TextStyle(color: Color.fromARGB(255, 194, 194, 194)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(12),
        ),
      ),
    );
  }
}
