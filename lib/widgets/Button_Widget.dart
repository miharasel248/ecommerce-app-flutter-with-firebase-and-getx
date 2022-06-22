import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loginsignup/constants/colors.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  ButtonWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 59.h,
      width: 205.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(133), color: primery),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
      )),
    );
  }
}
