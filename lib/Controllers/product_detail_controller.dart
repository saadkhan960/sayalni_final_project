import 'package:get/get.dart';
import 'package:saylani_final_project/Models/product_model.dart';
import 'package:saylani_final_project/Utils/products_data.dart';

class ProductDetailController extends GetxController {
  // List of sample products
  final Rx<ProductModel> productModelDetail = ProductModel.empty().obs;
  final RxString selectedColor = "".obs;

  // void addDataOnProductDetailmodel(int productId) {

  // }
  void addDataOnProductDetailmodel(int productId) {
    // Find the product with the matching ID
    var productData = productList.firstWhere(
      (product) => product['productId'] == productId,
      orElse: () => {}, // Return an empty map if not found
    );

    if (productData.isNotEmpty) {
      // Use fromJson to populate the model and assign it
      productModelDetail.value = ProductModel.fromJson(productData);
    }
  }
}
