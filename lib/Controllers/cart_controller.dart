import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saylani_final_project/Models/cart_model.dart';
import 'package:saylani_final_project/Models/product_model.dart';
import 'package:saylani_final_project/Utils/helper_functions.dart';
import 'package:saylani_final_project/Utils/products_data.dart';

class CartController extends GetxController {
  final RxList<CartModel> cartItems = <CartModel>[].obs;
  final RxDouble totalPrice = 0.0.obs;
  final RxDouble courierPrice = 0.0.obs;
  RxMap deliveryMethod = {}.obs;

  void addToCart(int productId) {
    // Get the product details using productId
    ProductModel product = getProductById(productId);

    if (product != null) {
      // Check if the product is already in the cart
      if (!cartItems.any((item) => item.productId == productId)) {
        cartItems.add(CartModel.fromProductModel(product, product.colors[0]));
        getTotalPrice();
        HelperFunction.showSnackbar(
          title: "Added to Cart",
          message: "Product has been successfully added to your cart.",
          color: Colors.green,
        );
      } else {
        // Show error snackbar if the product is already in the cart
        HelperFunction.showSnackbar(
          title: "Already in Cart",
          message: "This product is already added to the cart.",
          color: Colors.red,
        );
      }
    }
  }

  void addonPageToCart(int productId, String selectColor) {
    // Get the product details using productId
    ProductModel product = getProductById(productId);

    if (product != null) {
      // Check if the product is already in the cart
      if (!cartItems.any((item) => item.productId == productId)) {
        cartItems.add(CartModel.fromProductModel(product, selectColor));
        getTotalPrice();
        HelperFunction.showSnackbar(
          title: "Added to Cart",
          message: "Product has been successfully added to your cart.",
          color: Colors.green,
        );
      } else {
        // Show error snackbar if the product is already in the cart
        HelperFunction.showSnackbar(
          title: "Already in Cart",
          message: "This product is already added to the cart.",
          color: Colors.red,
        );
      }
    }
  }

  // Method to calculate the total price of all items in the cart
  void getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    totalPrice.value = total;
  }

  void removeFromCart(int productId) {
    // Remove product by productId
    cartItems.removeWhere((item) => item.productId == productId);
    getTotalPrice();
  }

  bool isInCart(int productId) {
    return cartItems.any((item) => item.productId == productId);
  }

  // Method to retrieve a product by its ID from the product list
  ProductModel getProductById(int productId) {
    // Fetch product data from the product list
    final productData = productList.firstWhere(
      (product) => product['productId'] == productId,
      orElse: () => {},
    );

    if (productData != null) {
      return ProductModel.fromJson(productData);
    } else {
      return ProductModel.empty(); // Return an empty product if not found
    }
  }

  // Increase the quantity of a product in the cart
  void increaseQuantity(int productId) {
    final cartItem = cartItems.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartModel.empty(),
    );

    if (cartItem != CartModel.empty()) {
      cartItem.quantity++;
      getTotalPrice();
      cartItems.refresh(); // Refresh the RxList to update UI
    }
  }

  // Decrease the quantity of a product in the cart
  void decreaseQuantity(int productId) {
    final cartItem = cartItems.firstWhere(
      (item) => item.productId == productId,
      orElse: () => CartModel.empty(),
    );

    if (cartItem != CartModel.empty() && cartItem.quantity > 1) {
      cartItem.quantity--;
      getTotalPrice();
      cartItems.refresh();
    }
  }
}
