import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/controllers/userinfoController.dart';
import 'package:loginsignup/models/user.dart';
import 'package:loginsignup/models/userinfo.dart';
import 'package:loginsignup/screens/edite_userinfo.dart';
import 'package:loginsignup/widgets/Button_Widget.dart';

import '../constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  UserinfoController userinfoController = Get.put(UserinfoController());

  // final userdata = cartcoltroller.cartitem[0].userinfo![0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backroundcolors,
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(right: 18),
              child: const Icon(
                Icons.timeline,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Obx(() {
            if (userinfo.usersinfo[0].userinfo!.isEmpty) {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Get.to(() => EditeUserInfo());
                      },
                      child: ButtonWidget(text: "Edite user data"))
                ],
              ));
            } else
              // ignore: curly_braces_in_flow_control_structures
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 120.r,
                      width: 120.r,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "data:image/jpeg;base64,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"))),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Text(
                      userinfo.usersinfo[0].userinfo![0].name.toString(),
                      style: TextStyle(fontSize: 24.sp, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                    child: Text(
                      userinfo.usersinfo[0].email.toString(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 117.h,
                        width: 106.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 45.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primery.withOpacity(0.1)),
                              child: Image.asset("assets/Bag.png"),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Progress order",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "10+",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 117.h,
                        width: 106.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 45.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primery.withOpacity(0.1)),
                              child: Image.asset("assets/Ticket.png"),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Promocodes",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "5",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 117.h,
                        width: 106.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 45.h,
                              width: 45.w,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primery.withOpacity(0.1)),
                              child: Image.asset("assets/Vector (2).png"),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "Reviewes",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.black.withOpacity(0.5),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "4.5k",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 49.h,
                  ),
                  Personalinfo()
                ],
              );
          }),
        ),
      ),
    );
  }
}

class Personalinfo extends StatelessWidget {
  Personalinfo({
    Key? key,
  }) : super(key: key);
  UserinfoController userinfoController = Get.put(UserinfoController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Personal Information",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 14.h,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.black.withOpacity(0.03)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Name   :",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      userinfo.usersinfo[0].userinfo![0].name.toString(),
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email   :",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      userinfo.usersinfo[0].email.toString(),
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Location   :",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      userinfo.usersinfo[0].userinfo![0].location.toString(),
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                      maxLines: 2,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Zip Code   :",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      userinfo.usersinfo[0].userinfo![0].zipcode.toString(),
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Phone Number   :",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black.withOpacity(0.5)),
                    ),
                    Text(
                      userinfo.usersinfo[0].userinfo![0].phone.toString(),
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
