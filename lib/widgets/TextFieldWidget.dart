import 'package:flutter/material.dart';
import 'package:loginsignup/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  String? label;
  String hinttext;
  TextEditingController controller;
  Icon prifixicon;
  late bool obscureText;

  TextFieldWidget(
      {Key? key,
      required this.controller,
      required this.hinttext,
      this.label,
      required this.prifixicon,
      this.obscureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /* Text(
          label,
          style:
              const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),*/
        const SizedBox(
          height: 8,
        ),
        TextField(
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintText: hinttext,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            prefixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(start: 5, end: 12),
              child: Container(
                height: 45,
                width: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: primery.withOpacity(0.1)),
                child: prifixicon,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
