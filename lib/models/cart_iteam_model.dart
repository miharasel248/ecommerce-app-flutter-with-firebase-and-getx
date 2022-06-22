import 'package:cloud_firestore/cloud_firestore.dart';

class CartItemModel {
  String? id;
  String? name;
  String? imgurl;
  double? price;
  String? producrid;
  int? quantity;
  double? cost;

  CartItemModel(
      {this.id,
      this.imgurl,
      this.name,
      this.price,
      this.cost,
      this.producrid,
      this.quantity});

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imgurl": imgurl,
        "price": price,
        "cost": price! * quantity!,
        "productid": producrid,
        "quantity": quantity
      };

  CartItemModel.fromJson(Map<String, dynamic> snapshot) {
    var snap = snapshot;

    id = snap["id"];
    imgurl = snap["imgurl"];
    name = snap["name"];
    price = snap["price"].toDouble();
    cost = snap["cost"];
    producrid = snap["productid"];
    quantity = snap["quantity"];
  }
}
