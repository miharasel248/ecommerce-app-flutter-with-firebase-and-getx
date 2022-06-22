import 'package:cloud_firestore/cloud_firestore.dart';

class SplashModel {
  String? name;
  String? dec;
  String? image;
  SplashModel({this.dec, this.image, this.name});

  factory SplashModel.fromJson(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return SplashModel(
        name: snap["name"], dec: snap["dec"], image: snap["image"]);
  }
}
