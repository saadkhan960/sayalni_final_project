import 'package:saylani_final_project/Models/product_model.dart';

class CartModel {
  final int productId;
  final String title;
  final double price;
  final String image;
  String color;
  int quantity;

  CartModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    required this.color,
    required this.quantity,
  });

  factory CartModel.empty() {
    return CartModel(
      productId: 0,
      title: '',
      price: 0.0,
      image: '',
      color: '',
      quantity: 0,
    );
  }

  factory CartModel.fromProductModel(ProductModel product, String selectedColor,
      {int quantity = 1}) {
    return CartModel(
      productId: product.productId,
      title: product.title,
      price: product.price,
      image: product.image,
      color: selectedColor,
      quantity: quantity,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'color': color,
      'quantity': quantity,
    };
  }
}
