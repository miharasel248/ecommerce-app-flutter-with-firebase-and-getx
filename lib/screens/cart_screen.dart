import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/controllers/cart_controller.dart';

import 'package:loginsignup/models/user.dart';
import 'package:loginsignup/screens/checkout_screen.dart';
import 'package:loginsignup/widgets/Button_Widget.dart';

import '../constants/colors.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final CartController cart = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backroundcolors,
        title: const Text(
          "My Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(child: Obx(() {
                if (cartcoltroller.cartitem[0].cart!.isEmpty) {
                  return Center(
                    child: Text("Cartitem is Empty"),
                  );
                } else {
                  return ListView.builder(
                      itemCount: cartcoltroller.cartitem[0].cart!.length,
                      itemBuilder: (BuildContext context, index) {
                        var data = cartcoltroller.cartitem[0].cart![index];

                        return Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            height: 92,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  height: 73,
                                  width: 84,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            data.imgurl.toString())),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.name.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      data.price.toString(),
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    cartcoltroller.removeCartItem(data);
                                  },
                                  child: Container(
                                      margin: EdgeInsets.only(right: 5),
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: boxc.withOpacity(0.2)),
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              })),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Subtotal :",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  Obx(
                    () => Text(
                      "${cartcoltroller.totalPrice}\$",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                  onTap: () {
                    //Get.to(() => Read());
                    /* if (authcontroller.userModel.value.cart!.isNotEmpty) {
                        return print("fail");
                      } else {
                        print("ssss");
                      }*/
                    //print(authcontroller.userModel.value.cart!.length);
                  },
                  child: GestureDetector(
                      onTap: () {
                        Get.to(() => CheckoutScreen());
                      },
                      child: ButtonWidget(text: "Checkout"))),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Cartwidget extends StatelessWidget {
  const Cartwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Text(authcontroller.userModel.value.favarate![0].name.toString())
          ],
        ));
  }
}
