import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/controllers/Splash_Screen_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loginsignup/screens/auth/log_in_screen.dart';
import 'package:loginsignup/widgets/Button_Widget.dart';

class SplashScreenOne extends StatefulWidget {
  SplashScreenOne({Key? key}) : super(key: key);

  @override
  State<SplashScreenOne> createState() => _SplashScreenOneState();
}

class _SplashScreenOneState extends State<SplashScreenOne> {
  final SplashScreenController controller = Get.put(SplashScreenController());

  late PageController pagecontroller;

  int currentindex = 0;

  @override
  void initState() {
    pagecontroller = PageController(initialPage: -1);
    super.initState();
  }

  @override
  void dispose() {
    pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18, top: 12),
          child: Text(
              "${currentindex}/${splashscreen.splash.length}".toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              pagecontroller.jumpToPage(2);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 12, right: 18),
              child: Text(
                "skip",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                    controller: pagecontroller,
                    onPageChanged: ((value) {
                      setState(() {
                        currentindex = value;
                      });
                    }),
                    itemCount: splashscreen.splash.length,
                    itemBuilder: (context, index) {
                      final currntindex1 = splashscreen.splash[index];
                      return Obx(() {
                        return Column(
                          children: [
                            Expanded(
                                child: Image.network(splashscreen
                                    .splash[index].image
                                    .toString())),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(splashscreen.splash[index].name.toString(),
                                style: TextStyle(
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              splashscreen.splash[index].dec.toString(),
                              style: TextStyle(
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 35.h,
                            ),
                            GestureDetector(
                                onTap: () {
                                  pagecontroller.nextPage(
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.easeInCubic);
                                  if (currentindex ==
                                      splashscreen.splash.length - 1) {
                                    Get.to(() => LoginScreen());
                                  }
                                },
                                child: ButtonWidget(
                                    text: currentindex ==
                                            splashscreen.splash.length - 1
                                        ? "Start"
                                        : "Next")),
                            SizedBox(
                              height: 45.h,
                            ),
                          ],
                        );
                      });
                    }))
          ],
        ),
      ),
    );
  }
}
