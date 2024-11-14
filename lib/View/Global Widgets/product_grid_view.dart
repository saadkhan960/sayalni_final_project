import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Controllers/cart_controller.dart';
import 'package:saylani_final_project/Controllers/product_detail_controller.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';
import 'package:saylani_final_project/Utils/products_data.dart';
import 'package:saylani_final_project/View/Global%20Widgets/product_show.dart';
import 'package:saylani_final_project/View/Screen/Product%20detail/peoduct_detail.dart';

class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key});

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {
  final CartController cartController = Get.put(CartController());
  final ProductDetailController productDetialController =
      Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          crossAxisSpacing: 10.0, // Space between columns
          mainAxisSpacing: 10.0, // Space between rows
          childAspectRatio: 0.6, // Adjust to control item height
          mainAxisExtent: 250),
      itemCount: productList.length,
      itemBuilder: (context, index) {
        final product = productList[index];
        return ProductShow(
          title: product['title'],
          image: product['image'],
          price: product['price'],
          onAddToCart: () {
            cartController.addToCart(product['productId']);
          },
          onProductTap: () {
            productDetialController
                .addDataOnProductDetailmodel(product['productId']);
            HelperFunction.simpleAnimationNavigation(
              screen: const ProductDetailPage(),
            );
          },
        );
      },
    );
  }
}
