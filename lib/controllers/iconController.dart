import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/firebase_intance.dart';

class IconController extends GetxController {
  static IconController intance = Get.find();
  var icons = <IconModel>[].obs;

  @override
  void onInit() async {
    icons.bindStream(firebasestore
        .collection("icon")
        .snapshots()
        .map((event) => event.docs.map((e) => IconModel.fromjson(e)).toList()));
    super.onInit();
  }
}

class IconModel {
  String? image;
  String? name;

  IconModel({this.image, this.name});

  IconModel.fromjson(DocumentSnapshot snap) {
    name = snap["name"];
    image = snap["image"];
  }
}
