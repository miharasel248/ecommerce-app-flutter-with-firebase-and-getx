class Favorite {
  String? id;
  String? name;
  String? imgurl;
  int? price;
  String? producrid;

  Favorite({
    this.id,
    this.imgurl,
    this.name,
    this.price,
    this.producrid,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "imgurl": imgurl,
        "price": price,
        "productid": producrid,
      };

  Favorite.fromJson(Map<String, dynamic> snapshot) {
    var snap = snapshot;

    id = snap["id"];
    imgurl = snap["imgurl"];
    name = snap["name"];
    price = snap["price"];

    producrid = snap["productid"];
  }
}
