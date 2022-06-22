import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String name;
  String imgurl;
  int price;
  String? productid;

  ProductModel(
      {required this.imgurl,
      required this.name,
      required this.price,
      this.productid});

  factory ProductModel.fromJson(DocumentSnapshot snapshot) {
    var snap = snapshot.data() as Map<String, dynamic>;
    return ProductModel(
        imgurl: snap["imgurl"],
        name: snap["name"],
        price: snap["price"],
        productid: snapshot.id);
  }
  Map<String, dynamic> toJson() =>
      {"name": name, "imgurl": imgurl, "price": price};
}
