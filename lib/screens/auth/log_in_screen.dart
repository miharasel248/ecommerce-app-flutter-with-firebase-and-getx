import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/colors.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/screens/auth/sign_up_screen.dart';
import 'package:loginsignup/widgets/Button_Widget.dart';
import 'package:loginsignup/widgets/TextFieldWidget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 74.h,
                width: 74.w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/smart-login-d3e3d.appspot.com/o/Vector%20(3).png?alt=media&token=f8e79a18-0a6d-4c7b-8f94-db8600537095"))),
              ),
              SizedBox(
                height: 38.h,
              ),
              Text(
                "Log in",
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                  controller: _emailcontroller,
                  hinttext: "Enter your email",
                  prifixicon: const Icon(
                    Icons.email,
                    color: primery,
                  )),
              SizedBox(
                height: 15.h,
              ),
              TextFieldWidget(
                  obscureText: true,
                  controller: _passwordcontroller,
                  hinttext: "Enter your password",
                  prifixicon: const Icon(
                    Icons.lock,
                    color: primery,
                  )),
              SizedBox(
                height: 15.h,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot password?",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 25.h,
              ),
              InkWell(
                  onTap: () {
                    authcontroller.logInUser(
                        _emailcontroller.text, _passwordcontroller.text);
                  },
                  child: ButtonWidget(text: "Log in")),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don\'t have a account  ",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.8))),
                  InkWell(
                    onTap: () {
                      Get.to(() => SignupScreen());
                    },
                    child: Text("Sign up",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
