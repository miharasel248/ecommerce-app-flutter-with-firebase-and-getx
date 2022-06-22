import 'package:get/get.dart';
import 'package:loginsignup/constants/firebase_intance.dart';

import 'package:loginsignup/models/product_model.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  var products = <ProductModel>[].obs;

  @override
  void onInit() async {
    products.bindStream(getproduct());

    super.onInit();
  }

  Stream<List<ProductModel>> getproduct() {
    return firebasestore.collection("products").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => ProductModel.fromJson(doc)).toList();
    });
  }
}
