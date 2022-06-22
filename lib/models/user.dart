import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loginsignup/models/cart_iteam_model.dart';
import 'package:loginsignup/models/userinfo.dart';

import 'Favorite_model.dart';

class UserAuth {
  String? uid;
  String? username;
  String? email;
  String? password;
  String? profilePics;
  List<CartItemModel>? cart;
  List<Favorite>? favarate;
  List<UsersInfo>? userinfo;
  static const CART = "cart";

  UserAuth(
      {this.uid,
      this.email,
      this.password,
      this.username,
      this.profilePics,
      this.cart,
      this.favarate,
      this.userinfo});

  Map<String, dynamic> tojson() => {
        "profilepics": profilePics,
        "uid": uid,
        "email": email,
        "password": password,
        "username": username,
        "cart": cart,
        "favarate": favarate,
        "userinfo": userinfo
      };

  List<CartItemModel> _convertCartItems(List cartFomDb) {
    List<CartItemModel> _result = [];
    int i = 0;
    if (cartFomDb.length > i) {
      for (var element in cartFomDb) {
        _result.add(CartItemModel.fromJson(element));
      }
    }
    return _result;
  }

  UserAuth.fromjson(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    profilePics = snapshot["profilePics"];
    uid = snap.id;
    email = snapshot["email"];
    password = snapshot["password"];
    username = snapshot["username"];

    if (snapshot["favarate"] != null) {
      favarate = <Favorite>[];
      for (var element in (snapshot["favarate"] as List)) {
        favarate!.add(Favorite.fromJson(element));
      }
    }

    if (snapshot["cart"] != null) {
      cart = <CartItemModel>[];
      for (var element in (snapshot["cart"] as List)) {
        cart!.add(CartItemModel.fromJson(element));
      }
    }

    if (snapshot["userinfo"] != null) {
      userinfo = <UsersInfo>[];
      for (var element in (snapshot["userinfo"] as List)) {
        userinfo!.add(UsersInfo.fromJson(element));
      }
    }
    //cart = _convertCartItems(snapshot["cart"] ?? []);
  }

  List cartItemsToJson() => cart!.map((item) => item.toJson()).toList();
}

 /*UserAuth.fromjson(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    profilePics = snapshot["profilePics"];
    uid = snap.id;
    email = snapshot["email"];
    password = snapshot["password"];
    username = snapshot["username"];
    if (snapshot["cart"] != null) {
      cart = <CartItemModel>[];
      (snapshot["cart"] as List).forEach((element) {
        cart!.add(CartItemModel.fromJson(element));
      });
    }
    
  }*/