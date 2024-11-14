import 'package:flutter/material.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer(
      {super.key,
      required this.child,
      this.borderColor = AppColors.lightGrey,
      this.radius = 30});
  final Widget child;
  final Color borderColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: borderColor,
          )),
      child: child,
    );
  }
}
