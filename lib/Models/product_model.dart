// class ProductModel {
//   final int productId;
//   final String title;
//   final double price;
//   final int buyCount;
//   final String image;
//   final List<String> colors;
//   final String brand;
//   final int online;
//   final String description;

//   ProductModel({
//     required this.productId,
//     required this.title,
//     required this.price,
//     required this.buyCount,
//     required this.image,
//     required this.colors,
//     required this.brand,
//     required this.online,
//     required this.description,
//   });
//   factory ProductModel.empty() {
//     return ProductModel(
//       productId: 0,
//       title: '',
//       price: 0.0,
//       buyCount: 0,
//       image: '',
//       colors: [],
//       brand: '',
//       online: 0,
//       description: '',
//     );
//   }

//   factory ProductModel.fromJson(Map<String, dynamic> json) {
//     return ProductModel(
//       productId: json['productId'],
//       title: json['title'],
//       price: json['price'].toDouble(),
//       buyCount: json['buyCount'],
//       image: json['image'],
//       colors: List<String>.from(json['colors']),
//       brand: json['brand'],
//       online: json['online'],
//       description: json['description'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'productId': productId,
//       'title': title,
//       'price': price,
//       'buyCount': buyCount,
//       'image': image,
//       'colors': colors,
//       'brand': brand,
//       'online': online,
//       'description': description,
//     };
//   }
// }
class ProductModel {
  final int productId;
  final String title;
  final double price;
  final int buyCount;
  final String image;
  final String brandimage; // New property for brand image
  final List<String> colors;
  final String brand;
  final int online;
  final String description;

  ProductModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.buyCount,
    required this.image,
    required this.brandimage, // Include brandimage in constructor
    required this.colors,
    required this.brand,
    required this.online,
    required this.description,
  });

  factory ProductModel.empty() {
    return ProductModel(
      productId: 0,
      title: '',
      price: 0.0,
      buyCount: 0,
      image: '',
      brandimage: '', // Default value for brandimage
      colors: [],
      brand: '',
      online: 0,
      description: '',
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      title: json['title'],
      price: json['price'].toDouble(),
      buyCount: json['buyCount'],
      image: json['image'],
      brandimage: json['brandimage'] ??
          json['image'], // Set brandimage to image if not present
      colors: List<String>.from(json['colors']),
      brand: json['brand'],
      online: json['online'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'buyCount': buyCount,
      'image': image,
      'brandimage': brandimage, // Include brandimage in toJson
      'colors': colors,
      'brand': brand,
      'online': online,
      'description': description,
    };
  }
}
