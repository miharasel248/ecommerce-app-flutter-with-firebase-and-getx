import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/controllers/authcontroller.dart';
import 'package:loginsignup/controllers/favarate_controller.dart';
import 'package:loginsignup/controllers/product_controller.dart';
import 'package:loginsignup/screens/auth/log_in_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loginsignup/screens/onboarding/splashone.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCMGhYOKuxCiKKRICCJlNHn3aJq8VYBaYY",
      appId: "1:255184025950:web:41c4d6cbe7532b24fab7cf",
      messagingSenderId: "255184025950",
      projectId: "smart-login-d3e3d",
    ),
  ).then(
    (value) {
      Get.put(Authcontroller());
      Get.put(ProductController());
      Get.put(FavarateController());
    },
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        title: 'Ecommerce App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreenOne(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
