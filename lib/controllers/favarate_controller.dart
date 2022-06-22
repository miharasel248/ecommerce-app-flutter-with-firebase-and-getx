import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/controllers/cart_controller.dart';
import 'package:loginsignup/models/Favorite_model.dart';
import 'package:loginsignup/models/product_model.dart';

class FavarateController extends GetxController {
  static FavarateController intance = Get.find();
  int get count => cartcoltroller.cartitem[0].favarate!.length;
  addTofavarate(ProductModel product) {
    try {
      Favorite favorite = Favorite(
        producrid: product.productid,
        id: firebaseAuth.currentUser!.uid,
        imgurl: product.imgurl,
        price: product.price,
        name: product.name,
      );

      cartcoltroller.updateUserData({
        "favarate": FieldValue.arrayUnion([favorite.toJson()])
      });
      Get.snackbar("Add to Favorite", "your ${product.name}is added");
    } catch (e) {
      Get.snackbar('ERROR', e.toString());
    }
  }

  removeFavoriteItem(Favorite favorite) {
    cartcoltroller.updateUserData({
      "favarate": FieldValue.arrayRemove([favorite.toJson()])
    });
  }
}
