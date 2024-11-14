import 'package:flutter/material.dart';

// Custom AppBar widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.centerTitle = true});
  final String title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    // final CartController cartController = Get.find<CartController>();
    return AppBar(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      automaticallyImplyLeading: false,
      centerTitle: centerTitle,
      // actions: [
      //   IconButton(
      //       onPressed: () {
      //         // Your action on cart press
      //         HelperFunction.simpleAnimationNavigation(screen: const Cart());
      //       },
      //       icon: Obx(
      //         () => Stack(
      //           children: [
      //             const Icon(
      //               Iconsax.shopping_cart,
      //               size: 30,
      //             ),
      //             if (cartController.cartItems
      //                 .isNotEmpty) // Check if there are items in the cart
      //               Positioned(
      //                 right: 0,
      //                 top: 0,
      //                 child: Container(
      //                   padding: const EdgeInsets.all(2),
      //                   decoration: const BoxDecoration(
      //                     color: Colors.red,
      //                     shape: BoxShape.circle,
      //                   ),
      //                   constraints: const BoxConstraints(
      //                     minWidth: 15,
      //                     minHeight: 15,
      //                   ),
      //                   child: Center(
      //                     child: Text(
      //                       cartController.cartItems.length
      //                           .toString(), // Show the count
      //                       style: const TextStyle(
      //                         fontSize: 12,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //           ],
      //         ),
      //       ))
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
