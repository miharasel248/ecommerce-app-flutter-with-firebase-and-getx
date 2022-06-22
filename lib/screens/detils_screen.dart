import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/widgets/Button_Widget.dart';
import '../constants/colors.dart';
import '../models/product_model.dart';

class Productview extends StatelessWidget {
  Productview({required this.iteams, Key? key}) : super(key: key);
  final ProductModel iteams;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(clipBehavior: Clip.none, children: [
                  Positioned(
                    top: 0,
                    child: Container(
                      height: 525.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          image: DecorationImage(
                              fit: BoxFit.contain,
                              image: NetworkImage(iteams.imgurl.toString()))),
                    ),
                  ),
                  /* Positioned(
                    bottom: -50,
                    child: Container(
                      height: 100,
                      width: 200,
                      color: Colors.red,
                    ),
                  )*/
                  Positioned(
                    //bottom: -200,
                    top: 480.h,
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25))),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      iteams.name.toString(),
                                      style: TextStyle(fontSize: 20.sp),
                                    ),
                                    Text(iteams.price.toString() + "\$",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  "A Henley shirt is a collarless pullover shirt, by a round neckline and a placket about 3 to 5 inches (8 to 13 cm) long and usually having 2.5 buttons.",
                                  style: TextStyle(
                                      fontSize: 12.h,
                                      color: Colors.black.withOpacity(0.5)),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const Text("Colors"),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 10.r,
                                      backgroundColor: primery,
                                    ),
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    CircleAvatar(
                                      radius: 10.r,
                                      backgroundColor: Colors.black,
                                    ),
                                    SizedBox(
                                      width: 10.h,
                                    ),
                                    CircleAvatar(
                                      radius: 10.r,
                                      backgroundColor: Colors.green,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: InkWell(
                                    onTap: () {
                                      cartcoltroller.addToCart(iteams);
                                    },
                                    child: ButtonWidget(
                                      text: "Add to Cart",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        /* Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey),
                        ),*/
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 18, top: 18),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          favoritecontroller.addTofavarate(iteams);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 18, top: 18),
                          child: Icon(Icons.favorite, color: Colors.red),
                        ),
                      )
                    ],
                  ),
                  /*Positioned(
                      left: 0,
                      right: 0,
                      bottom: 40.h,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: InkWell(
                          onTap: () {
                            cartcoltroller.addToCart(iteams);
                          },
                          child: ButtonWidget(
                            text: "Add to Cart",
                          ),
                        ),
                      )
                      )*/
                ]),
              ),
              SizedBox(
                height: 20.h,
              ),
              //Addcart(cart: iteams)
              //Positioned(bottom: -800, child: Addcart(cart: iteams))
            ],
          ),
        ),
      ),
    );
  }
}

class Addcart extends StatefulWidget {
  const Addcart({Key? key, required this.cart}) : super(key: key);
  final cart;

  @override
  State<Addcart> createState() => _AddcartState();
}

class _AddcartState extends State<Addcart> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          setState(() {});
        },
        child: Container(
          height: 45.h,
          width: 253.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(68.r), color: primery),
          child: Center(
            child: Text("Add to Cart",
                style: TextStyle(fontSize: 16.sp, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
