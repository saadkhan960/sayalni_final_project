import 'package:flutter/material.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton(
      {super.key,
      required this.onPress,
      this.text = "Add to Cart",
      this.bgColor,
      this.textColor,
      this.isLoading = false});
  final VoidCallback onPress;
  final String text;
  final Color? bgColor;
  final Color? textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.primary,
        foregroundColor: textColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Text(
              text,
            ),
    );
  }
}
