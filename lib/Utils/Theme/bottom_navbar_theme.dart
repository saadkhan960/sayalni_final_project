import 'package:flutter/material.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';

class NavigationBarThemeDatas {
//light-----------
  static NavigationBarThemeData lightBottomSheetThemeData =
      NavigationBarThemeData(
          backgroundColor: Colors.white,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(
                    color: AppColors.primary, fontSize: 11.5);
              }
              return const TextStyle(color: Color(0xFF939393), fontSize: 11.5);
            },
          ),
          iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return const IconThemeData(color: AppColors.primary);
              }
              return const IconThemeData(color: Color(0xFF939393));
            },
          ),
          overlayColor: WidgetStateProperty.resolveWith<Color>(
            (states) {
              if (states.contains(WidgetState.selected)) {
                return Colors.transparent;
              }
              return Colors.transparent;
            },
          ));
}
