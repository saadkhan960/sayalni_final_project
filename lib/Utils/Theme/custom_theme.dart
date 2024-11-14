import 'package:flutter/material.dart';
import 'package:saylani_final_project/Utils/Theme/bottom_navbar_theme.dart';
import 'package:saylani_final_project/Utils/Theme/text_theme.dart';
import 'package:saylani_final_project/Utils/app_colors.dart';

class CustomThemeData {
  static ThemeData customThemeData = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      useMaterial3: true,
      fontFamily: 'Poppins',
      textTheme: PoppinsTextTheme.textTheme,
      navigationBarTheme: NavigationBarThemeDatas.lightBottomSheetThemeData);
}
