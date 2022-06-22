import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:loginsignup/controllers/Splash_Screen_controller.dart';
import 'package:loginsignup/controllers/authcontroller.dart';
import 'package:loginsignup/controllers/cart_controller.dart';
import 'package:loginsignup/controllers/favarate_controller.dart';
import 'package:loginsignup/controllers/iconController.dart';

import 'package:loginsignup/controllers/product_controller.dart';
import 'package:loginsignup/controllers/userinfoController.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebasestore = FirebaseFirestore.instance;
var firebaseStorage = FirebaseStorage.instance;

//controller

var authcontroller = Authcontroller.instance;
var productcontroller = ProductController.instance;
var cartcoltroller = CartController.instance;
var favoritecontroller = FavarateController.intance;
var icon = IconController.intance;
var userinfo = UserinfoController.instance;
var splashscreen = SplashScreenController.intance;
