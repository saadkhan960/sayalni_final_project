import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:saylani_final_project/Controllers/bottom_nav_controller.dart';
import 'package:saylani_final_project/Controllers/product_detail_controller.dart';
import 'package:saylani_final_project/View/Screen/History/history.dart';
import 'package:saylani_final_project/View/Screen/home/home.dart';
import 'package:saylani_final_project/View/Screen/wishlist/wishlist.dart';
import 'package:saylani_final_project/View/Screen/account/account.dart';

class BottomNavMenu extends StatelessWidget {
  BottomNavMenu({super.key});

  final BottomNavController bottomNavController =
      Get.put(BottomNavController());
  final ProductDetailController bottomNavCsontroller =
      Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => NavigationBar(
            elevation: 0,
            height: 80,
            indicatorColor: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            selectedIndex: bottomNavController.selectedIndex.value,
            onDestinationSelected: (index) =>
                bottomNavController.onItemTapped(index),
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.home),
                selectedIcon: Icon(Iconsax.home_15),
                label: "Home",
              ),
              NavigationDestination(
                icon:
                    // Wishlist Badge logic
                    SizedBox(
                  child: Icon(Iconsax.heart),
                ),
                selectedIcon: SizedBox(
                  child: Icon(Iconsax.heart5),
                ),
                label: "Wishlist",
              ),
              NavigationDestination(
                icon: SizedBox(
                  child: Icon(Iconsax.document_text4),
                ),
                selectedIcon: SizedBox(
                  child: Icon(Iconsax.document_text5),
                ),
                label: "History",
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  size: 28,
                ),
                selectedIcon: Icon(
                  Icons.person,
                  size: 28,
                ),
                label: "Account",
              ),
            ],
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          )),
      body: Obx(() {
        switch (bottomNavController.selectedIndex.value) {
          case 0:
            return const Home();
          case 1:
            return const Wishlist();
          case 2:
            return const History();
          case 3:
            return const Account();
          default:
            return const Home();
        }
      }),
    );
  }
}
