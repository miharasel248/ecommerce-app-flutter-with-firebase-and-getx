import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loginsignup/models/userinfo.dart';

import '../constants/firebase_intance.dart';
import '../models/user.dart';

class UserinfoController extends GetxController {
  static UserinfoController instance = Get.find();
  var usersinfo = <UserAuth>[].obs;

  updateUserData(Map<String, dynamic> data) {
    firebasestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .update(data);
  }

  updateUser(String name, String location, String zipcode, String phone) {
    UsersInfo usersInfo = UsersInfo(
        name: name, location: location, zipcode: zipcode, phone: phone);
    try {
      updateUserData({
        "userinfo": FieldValue.arrayUnion([usersInfo.toJson()])
      });
    } catch (e) {
      e.toString();
    }
  }

  @override
  void onReady() {
    usersinfo.bindStream(getUserInfo());

    super.onReady();
  }

  Stream<List<UserAuth>> getUserInfo() {
    String? userCredential = firebaseAuth.currentUser!.uid;

    return firebasestore
        .collection("users")
        .where("uid", isEqualTo: userCredential)
        .snapshots()
        .map((event) {
      return event.docs.map((snap) => UserAuth.fromjson(snap)).toList();
    });
  }
}
