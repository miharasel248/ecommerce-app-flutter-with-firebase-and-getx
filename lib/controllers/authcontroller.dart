import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/screens/bottomNavigationBar.dart';
import 'package:loginsignup/models/user.dart';
import 'package:loginsignup/screens/auth/log_in_screen.dart';

import '../screens/onboarding/splashone.dart';

class Authcontroller extends GetxController {
  static Authcontroller instance = Get.find();
  Rx<UserAuth> userModel = UserAuth().obs;

  late Rx<File?> _pickedImage;
  File? get profilephoto => _pickedImage.value;
  late Rx<User?> _user;
  User? get user => _user.value;

  @override
  void onReady() {
    super.onReady();
    userModel;

    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => SplashScreenOne());
    } else {
      Get.offAll(() => BottomBar());
    }
  }

//pickimage

  picimage() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      Get.snackbar("profile photo",
          "You have successfully selected your profile picture!");
    }
    _pickedImage = Rx<File?>(File(pickedimage!.path));
  }

  //upload stroge

  Future<String> _uploadStroge(File image) async {
    try {
      Reference ref = firebaseStorage
          .ref()
          //.child("profilePics")
          .child(firebaseAuth.currentUser!.uid);
      UploadTask uploadTask = ref.putFile(image);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadurl = await taskSnapshot.ref.getDownloadURL();
      return downloadurl;
    } catch (e) {
      return e.toString();
    }
  }

  // registeruser
  register(String email, String password, String username, File? image) async {
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          image != null) {
        UserCredential userCredential = await firebaseAuth
            .createUserWithEmailAndPassword(email: email, password: password);

        String downloadurl = await _uploadStroge(image);

        UserAuth userAuth = UserAuth(
            profilePics: downloadurl,
            userinfo: [],
            cart: [],
            favarate: [],
            uid: userCredential.user!.uid,
            email: email,
            password: password,
            username: username);
        firebasestore
            .collection("users")
            .doc(userCredential.user!.uid)
            .set(userAuth.tojson());
      } else {
        Get.snackbar("errror", "do not create account");
      }
    } catch (e) {
      Get.snackbar("errror", e.toString(),
          duration: const Duration(seconds: 45));
    }
  }

  logInUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar("error", "enter all field");
      }
    } catch (e) {
      e.toString();
    }
  }

  signOut() async {
    await firebaseAuth.signOut();
  }

  Stream<UserAuth> listenToUser() => firebasestore
      .collection("users")
      .doc(user!.uid)
      .snapshots()
      .map((snapshot) => UserAuth.fromjson(snapshot));
}
