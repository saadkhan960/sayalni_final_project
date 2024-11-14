import 'package:flutter/material.dart';
import 'package:saylani_final_project/Utils/app_sizes.dart';

class Thumbnails extends StatelessWidget {
  const Thumbnails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 17, left: 17),
      child: SizedBox(
        height: 150,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          separatorBuilder: (_, index) => const SizedBox(
            width: AppSizes.mediumSpace,
          ),
          itemBuilder: (_, index) => SizedBox(
            width: 307,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                  Radius.circular(AppSizes.extraborderRadius)),
              child: Image.asset(
                "assets/banners/banner${index + 1}.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
