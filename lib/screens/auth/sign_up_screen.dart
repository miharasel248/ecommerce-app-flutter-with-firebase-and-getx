import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/colors.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/screens/auth/log_in_screen.dart';
import 'package:loginsignup/widgets/Button_Widget.dart';
import 'package:loginsignup/widgets/TextFieldWidget.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController usernamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        /*leading: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: maincolors.withOpacity(0.2)),
          child: const Icon(Icons.arrow_back_ios, color: maincolors),
        ),*/
      ),*/
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
                "Sign Up",
                style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              SizedBox(
                height: 15.h,
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 100.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAHsAjQMBIgACEQEDEQH/xAAbAAEAAgMBAQAAAAAAAAAAAAAABAUCAwYBB//EADYQAAICAQEGBAIIBgMAAAAAAAABAgMEEQUSITFRYSIyQXETgRQzQlORscHwI2JykqHRJFLh/8QAFAEBAAAAAAAAAAAAAAAAAAAAAP/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/APtQAAAAAAQ8jaNVWsYfxJdFyXzAmGMpwh55xj7vQpLs2+3XWbjHpHgR9deLAv8A6TR99D8TKN9MuVsP7jnQB03pqDnIW2VvWE5L2ZNo2nOPC5by6rmBbA103V3R1rlr26GwAAAAAAAAAeSajFyk92KWrbPSm2jlfGm6q3/Di+LXqwGbnyubhVrGv/MiEAAPUm2lFat8kjdiY0smei4RXOXQuqKK6I6VR06v1YFLHEyZcqZfPh+ZhZRdWm7KpRXXTgdEAOZBc5mBC1OdSULO3KX76lO04ycZJprmmBlVZKqe9XJxfYuMLNjkJRlws/MpDKMnCSlF6NAdICPhZKyKtXpvrzEgAAAAAAibSyPgY+kfPPgu3VlIiVtO34mXKK8tfhX6kUAexTlJJc2eG7DW9lVJ8t5AXeNTGimMFz5t9WbQAAAAFXtilRlG+K5+GX6FoRNqLXBs7NP/ACgKQBADfh3Oi9S+y/MXyeqTXLQ5ovNm2/ExVrzjwAlAAAAYW/VT/pYHOylvycnzk2zwLkABnRP4d8J9JJmAbA6VPVJrk+R6V+zctTgqZvxLy9ywAAAAQdr2KONues5Lh2XEmWTjXBzm92KXFsoczIeRe58VFcIrsBpQAAFlsefjsh2TK0nbIf8AyX/SwLgAADyS3otdVoegDmUtFoDdm1urLtj6b2q9nxNIGUISsmoQWsm9EWuPsyqKTv1nLonokebJoUYO5rxS4LsiwAqczZ8q5O3HTcVx3VzXseUbTnDw2x3+/JotzTdi03cbK05f9lwYGhbSx/XfXyMLNq1peCuUn34Hr2VR95Yvmv8ARlDZmPF6y359m/8AQFdOzIzrFHi+kY8kWFGzaY16XLem+bT5exMrrhXHdriorojICmzcB0Rc6m5QXNPnEhHStarQoMun6PkSrXl5x9gNJP2PHW+cukSAW+x4btM5+snp+AE8AAAABW7Yp1jG+K8vhl7ehVri0u50k4RnFxktYyWjRQX0zxrnB+j1i+qAvqYKumEF6JGZEwMtZFajLhYufclgAAAAAAAACs2zXwqsXPjF/v8AEsm0k22klz1KXaGX9Jnuw+rjy79wI0IuclGPFt6I6GmtU1RrX2VoV2ysZ/XzWnpFP8y0AAAAAABoy8aOTXo+ElxjLobwBzs42Y9uj1hNepZ4m0YWJRu0jLr6MlZGPXkQ3bI+zXNexU5OBdRxgviQ6xXFe6Auk01quR6c9TlW0/VzenT0JkNqy+3Wn3XAC1BXratX3czGW1oaeGqXzYFka7766I71skui9WVVu0r58IaVr+UipWXWaJTsm/mBvzM2eS91eCvp6v3PcDDeRJTsTVa5/wAxJxdmaaTydH0gv1LFJJJJaJAEkkklokegAAAAAAAAAAABpuxaL3rZWnJ/aXBkSeyq35LZx7NJliAKp7Jn6XR/tC2S35r0vaH/AKWoAg17Moh5t6b7vQmV1wrju1wjFdEjIAAAAAAAAAf/2Q==")),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    right: -20,
                    bottom: -10,
                    child: InkWell(
                      onTap: () {
                        authcontroller.picimage();
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(
                          Icons.add_a_photo,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              TextFieldWidget(
                  controller: usernamecontroller,
                  hinttext: "user name",
                  //label: "User Name",
                  prifixicon: const Icon(
                    Icons.person,
                    color: primery,
                  )),
              SizedBox(
                height: 15.h,
              ),
              TextFieldWidget(
                  controller: emailcontroller,
                  hinttext: "Enter Your Email",
                  //label: "email",
                  prifixicon: const Icon(
                    Icons.email,
                    color: primery,
                  )),
              SizedBox(
                height: 15.h,
              ),
              TextFieldWidget(
                  obscureText: true,
                  controller: passwordcontroller,
                  hinttext: "Enter Your Password",
                  // label: "password",
                  prifixicon: const Icon(
                    Icons.lock,
                    color: primery,
                  )),
              SizedBox(
                height: 25.h,
              ),
              InkWell(
                onTap: () {
                  authcontroller.register(
                      emailcontroller.text,
                      passwordcontroller.text,
                      usernamecontroller.text,
                      authcontroller.profilephoto);
                },
                child: ButtonWidget(text: "Sign up"),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Allready have account  ",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.black.withOpacity(0.8))),
                  InkWell(
                    onTap: () {
                      Get.to(() => LoginScreen());
                    },
                    child: Text("Log in",
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
