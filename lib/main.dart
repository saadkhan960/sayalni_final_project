import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:saylani_final_project/Utils/Theme/custom_theme.dart';
import 'package:saylani_final_project/View/Screen/login/login_page.dart';
import 'package:saylani_final_project/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sayalni Final Project',
      theme: CustomThemeData.customThemeData,
      home: LoginPage(),
    );
  }
}
