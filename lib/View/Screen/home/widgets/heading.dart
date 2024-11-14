import 'package:flutter/material.dart';

class CustomHeading extends StatelessWidget {
  const CustomHeading(
      {super.key,
      required this.headingText,
      this.trailingWidget,
      this.textStyle});

  final String headingText;
  final Widget? trailingWidget;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headingText,
          style: textStyle ?? Theme.of(context).textTheme.titleMedium,
        ),
        if (trailingWidget != null)
          trailingWidget!, // Only adds if it's not null
      ],
    );
  }
}
