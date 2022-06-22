import 'package:get/get.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/models/splashscreenmodel.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController intance = Get.find();
  var splash = <SplashModel>[].obs;

  @override
  void onInit() {
    splash.bindStream(firebasestore.collection("splashscreen").snapshots().map(
        (event) => event.docs.map((e) => SplashModel.fromJson(e)).toList()));

    super.onInit();
  }
}
