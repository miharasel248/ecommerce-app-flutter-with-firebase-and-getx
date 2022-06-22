import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loginsignup/controllers/Splash_Screen_controller.dart';
import 'package:loginsignup/controllers/iconController.dart';
import 'package:loginsignup/screens/cart_screen.dart';
import 'package:loginsignup/screens/detils_screen.dart';
import 'package:loginsignup/screens/edite_userinfo.dart';
import 'package:loginsignup/screens/onboarding/splashone.dart';
import 'package:loginsignup/widgets/drawer.dart';
import '../constants/colors.dart';
import '../constants/firebase_intance.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);

  final IconController iconController = Get.put(IconController());
  final SplashScreenController _controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: backroundcolors,
        elevation: 0,
        title: Text(
          "15/2 New Texas",
          style: TextStyle(color: Colors.black, fontSize: 14.sp),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => SplashScreenOne());
              //print(splashscreen.splash.length);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(Icons.notifications, color: Colors.grey),
            ),
          )
        ],
      ),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Explore",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "best Outfits for you",
                  style: TextStyle(color: Colors.black45, fontSize: 18),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 60),
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.withOpacity(0.2)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              onTap: () {},
                              decoration: const InputDecoration(
                                hintText: "Search iteams...",
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                  //isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20),
                                  )),
                                  context: context,
                                  builder: (builder) => Text(authcontroller
                                      .userModel.value.uid
                                      .toString()));
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: primery,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 100.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: icon.icons.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 75.h,
                            width: 71.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                    //offset: const Offset(0, 3),
                                  )
                                ]),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  children: [
                                    Image.network(
                                      icon.icons[index].image.toString(),
                                      height: 35.h,
                                      width: 35.w,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      icon.icons[index].name.toString(),
                                      style: TextStyle(
                                          fontSize: 12.h,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 18,
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "New Arrival",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 14, color: Colors.black.withOpacity(0.5)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productcontroller.products.length,
                        itemBuilder: (context, index) {
                          var productdata = productcontroller.products[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Productview(
                                        iteams: productdata,
                                      )));
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 190.r,
                                  width: 154.r,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.white),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 133.h,
                                        width: 154.w,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    productdata.imgurl))),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                      Text(
                                        productdata.name,
                                        style: TextStyle(fontSize: 12.sp),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        productdata.price.toString() + "\$",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                              ],
                            ),
                          );
                        })),
                const SizedBox(
                  height: 15,
                ),
                const Popular(),
                /* ElevatedButton(
                    onPressed: () {
                      getproduct();
                    },
                    child: const Text("data"))*/
              ],
            ),
          ),
        )),
      ),
    );
  }
}

class Popular extends StatelessWidget {
  //final products;
  const Popular({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular Arrival",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                "See All",
                style: TextStyle(
                    fontSize: 14.sp, color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    //mainAxisExtent: 10,
                    crossAxisSpacing: 15,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 15),
                itemCount: productcontroller.products.length,
                itemBuilder: (BuildContext context, index) {
                  var product = productcontroller.products[index];
                  return Container(
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white),
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Container(
                            height: 133.h,
                            width: 154.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.contain,
                                    image: NetworkImage(product.imgurl))),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          Text(
                            product.name,
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            "${product.price}\$",
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
