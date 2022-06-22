import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/models/cart_iteam_model.dart';

import 'package:loginsignup/models/product_model.dart';
import 'package:loginsignup/models/user.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  Rx<double> total = 0.0.obs;
  var cartitem = <UserAuth>[].obs;

  //get totalprice
  int get count => cartitem[0].cart!.length;

  double get totalPrice =>
      cartitem[0].cart!.fold(0.0, (sum, item) => sum + item.price!.toDouble());

  //get cart item

  @override
  void onReady() {
    cartitem.bindStream(getCartItem());

    super.onReady();
  }

  String? userCredential = firebaseAuth.currentUser!.uid;

  Stream<List<UserAuth>> getCartItem() {
    return firebasestore
        .collection("users")
        .where("uid", isEqualTo: userCredential)
        .snapshots()
        .map((event) {
      return event.docs.map((snap) => UserAuth.fromjson(snap)).toList();
    });
  }

  //add to cart
  addToCart(ProductModel product) {
    try {
      CartItemModel cartModel = CartItemModel(
        producrid: product.productid,
        id: firebaseAuth.currentUser!.uid,
        imgurl: product.imgurl,
        name: product.name,
        price: product.price.toDouble(),
        quantity: 1,
      );

      updateUserData({
        "cart": FieldValue.arrayUnion([cartModel.toJson()])
      });
      Get.snackbar("Add to Cart", "your ${product.name}is added",
          duration: Duration(seconds: 3), snackPosition: SnackPosition.BOTTOM);

      /* FirebaseFirestore.instance
          .collection("user_cart_item")
          .doc(firebaseAuth.currentUser!.uid)
          .collection("Cart")
          .doc()
          .set(cartModel.toJson())
          .then((value) =>
              Get.snackbar("Add to Cart", "your ${product.name}is added"));*/
    } catch (e) {
      Get.snackbar("Can not add this item", e.toString());
    }
  }
  //remove cart item

  removeCartItem(
    CartItemModel cartitem,
  ) {
    updateUserData({
      "cart": FieldValue.arrayRemove([cartitem.toJson()])
    });
  }

  updateUserData(Map<String, dynamic> data) {
    firebasestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .update(data);
  }
}
