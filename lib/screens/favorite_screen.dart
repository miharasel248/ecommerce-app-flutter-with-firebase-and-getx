import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/constants/colors.dart';
import 'package:loginsignup/constants/firebase_intance.dart';
import 'package:loginsignup/controllers/favarate_controller.dart';

class FavoriteScreen extends StatelessWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  final FavarateController favarateController = Get.put(FavarateController());

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
          ),
        ),
        elevation: 0,
        title: const Text(
          "Favarate",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: backroundcolors,
      ),
      body: Column(
        children: const [
          Expanded(
            child: FavaIteam(),
          ),
        ],
      ),
    );
  }
}

class FavaIteam extends StatelessWidget {
  const FavaIteam({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartcoltroller.cartitem[0].favarate!.isEmpty) {
        return const Center(child: Text("your favorite item is empty"));
      } else {
        return ListView.builder(
            itemCount: cartcoltroller.cartitem[0].favarate!.length,
            itemBuilder: (BuildContext context, index) {
              var data = cartcoltroller.cartitem[0].favarate![index];

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
                              image: NetworkImage(data.imgurl.toString())),
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
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 25,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: primery,
                              ),
                              child: const Center(
                                  child: Text(
                                "Buy Now",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          favoritecontroller.removeFavoriteItem(data);
                        },
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: boxc.withOpacity(0.2)),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}
