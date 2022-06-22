import 'package:cloud_firestore/cloud_firestore.dart';

class UsersInfo {
  String? name;
  String? location;
  String? zipcode;
  String? phone;

  UsersInfo({this.location, this.name, this.phone, this.zipcode});

  Map<String, dynamic> toJson() =>
      {"name": name, "zipcode": zipcode, "phone": phone, "location": location};

  UsersInfo.fromJson(Map<String, dynamic> snap) {
    var snapshot = snap;

    name = snapshot["name"];
    location = snapshot["location"];
    zipcode = snapshot["zipcode"];
    phone = snapshot["phone"];
  }
}
