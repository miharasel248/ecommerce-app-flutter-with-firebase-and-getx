import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/colors.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/widgets/Button_Widget.dart';
import 'package:loginsignup/widgets/TextFieldWidget.dart';

class EditeUserInfo extends StatelessWidget {
  EditeUserInfo({Key? key}) : super(key: key);
  TextEditingController namecontroller = TextEditingController();
  TextEditingController locationcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController zipcodecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black)),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "Edite Profile",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
                controller: namecontroller,
                hinttext: "name",
                prifixicon: Icon(
                  Icons.person,
                  color: primery,
                )),
            SizedBox(
              height: 15,
            ),
            TextFieldWidget(
                controller: locationcontroller,
                hinttext: "Enter your Address",
                prifixicon: Icon(
                  Icons.location_city,
                  color: primery,
                )),
            SizedBox(
              height: 15,
            ),
            TextFieldWidget(
                controller: zipcodecontroller,
                hinttext: "Zipcode",
                prifixicon: Icon(
                  Icons.code,
                  color: primery,
                )),
            SizedBox(
              height: 15,
            ),
            TextFieldWidget(
                controller: phonecontroller,
                hinttext: "Phone",
                prifixicon: Icon(
                  Icons.phone,
                  color: primery,
                )),
            SizedBox(
              height: 30,
            ),
            InkWell(
                onTap: () {
                  userinfo.updateUser(
                      namecontroller.text,
                      locationcontroller.text,
                      zipcodecontroller.text,
                      phonecontroller.text);
                },
                child: ButtonWidget(text: "Save"))
          ],
        ),
      ),
    );
  }
}
