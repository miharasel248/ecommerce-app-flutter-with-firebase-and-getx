import 'package:flutter/material.dart';
import 'package:loginsignup/constants/colors.dart';
import 'package:loginsignup/screens/cart_screen.dart';
import 'package:loginsignup/screens/favorite_screen.dart';
import 'package:loginsignup/screens/home_screen.dart';
import 'package:loginsignup/screens/profile_screen.dart';

class BottomBar extends StatefulWidget {
  BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentindex = 0;

  final screens = [
    Homescreen(),
    CartScreen(),
    FavoriteScreen(),
    ProfileScreen()
    //Homescreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (index) => setState(() {
                currentindex = index;
              }),
          selectedItemColor: primery,
          unselectedItemColor: Colors.grey,
          backgroundColor: bottomc,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              backgroundColor: bottomc,
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: "Favorite"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: "Profile"),
          ]),
      body: screens[currentindex],
    );
  }
}
