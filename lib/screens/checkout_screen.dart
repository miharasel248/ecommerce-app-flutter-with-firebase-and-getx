import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/colors.dart';
import 'package:loginsignup/constants/firebase_intance.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key? key}) : super(key: key);

  bool isselected = false;
  int currentindex = -1;
  List payment = [
    {
      "image":
          "https://logos-world.net/wp-content/uploads/2020/09/Mastercard-Logo.png"
    },
    {
      "image":
          "data:image/png;base64,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"
    },
    {
      "image":
          "data:image/png;base64,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"
    },
    {
      "image":
          "https://cdn.pixabay.com/photo/2018/05/08/21/29/paypal-3384015_1280.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: backroundcolors,
        title: const Text(
          "CheckOut",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Delivery address",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 86.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CheckBoxWidget(
                              valuee: isselected,
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Home",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text("(342)  4522019",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("220  New York",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 86.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CheckBoxWidget(valuee: isselected),
                            SizedBox(
                              width: 20.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Office",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text("(342)  4522019",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400)),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Text("220  New York",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400)),
                              ],
                            ),
                          ],
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text("Billing information",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  width: double.infinity,
                  height: 134.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white),
                  child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Delivery Fee     : ",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "0",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subtotal           :",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "${cartcoltroller.totalPrice}\$",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          const Divider(
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total                 :",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                "${cartcoltroller.totalPrice}\$",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text("Payment Method",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Paymetoption(
                                  image: payment[index]["image"],
                                  curindex: currentindex,
                                  index: index),
                            ],
                          ),
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: payment.length),
                ),
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 56.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.white),
                      child: Image.network(
                        "https://logos-world.net/wp-content/uploads/2020/09/Mastercard-Logo.png",
                        height: 30.h,
                        width: 30.w,
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.white),
                      child: Image.network(
                        "data:image/png;base64,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",
                        height: 30.h,
                        width: 30.w,
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.white),
                      child: Image.network(
                        "data:image/png;base64,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",
                        height: 30.h,
                        width: 30.w,
                      ),
                    ),
                    Container(
                      height: 56.h,
                      width: 70.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.white),
                      child: Image.network(
                          "https://cdn.pixabay.com/photo/2018/05/08/21/29/paypal-3384015_1280.png"),
                    ),
                  ],
                ),*/
                SizedBox(
                  height: 50.h,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 55.h,
                      width: 229.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(123.r),
                        color: primery,
                      ),
                      child: const Center(
                          child: Text(
                        "Swipe for Payment",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({Key? key, required this.valuee}) : super(key: key);
  bool? valuee;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool? isselected;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        shape: CircleBorder(),
        activeColor: primery,
        checkColor: Colors.white,
        value: widget.valuee,
        onChanged: (bool? value) {
          setState(() {
            widget.valuee = value;
          });
        });
  }
}

class Paymetoption extends StatefulWidget {
  var image;
  int curindex;
  int index;
  Paymetoption(
      {Key? key,
      required this.image,
      required this.curindex,
      required this.index})
      : super(key: key);

  @override
  State<Paymetoption> createState() => _PaymetoptionState();
}

class _PaymetoptionState extends State<Paymetoption> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.curindex = widget.index;
        });
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            height: 56.h,
            width: 70.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r), color: Colors.white),
            child: SizedBox(
              height: 30.h,
              width: 30.h,
              child: Image.network(
                widget.image,
              ),
            ),
          ),
          widget.curindex == widget.index
              ? Positioned(
                  top: -10,
                  bottom: 35,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: Center(
                      child: Icon(
                        Icons.done,
                        size: 8,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Text("")
        ],
      ),
    );
  }
}
