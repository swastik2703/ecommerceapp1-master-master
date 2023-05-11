import 'package:ecommerceapp/Controller/home_controller.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/screens/cart_screen/cart_screen.dart';
import 'package:ecommerceapp/screens/category_screen/category_screen.dart';
import 'package:ecommerceapp/screens/homeScreen.dart';
import 'package:ecommerceapp/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(homeController());
    var navbarItems = [
      BottomNavigationBarItem(icon: Image.asset(icHome, width: 26,), label: home),
      BottomNavigationBarItem(icon: Image.asset(icCategories, width: 26,), label: category),
      BottomNavigationBarItem(icon: Image.asset(icCart, width: 26,), label: cart),
      BottomNavigationBarItem(icon: Image.asset(icProfile, width: 26,), label: profile),
    ];

    var navBody= [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen(),

    ];
    return Scaffold(
      body: Column(
        children: [
          Obx( ()=> Expanded(child: navBody.elementAt(controller.currNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currNavIndex.value,
          items: navbarItems,
        selectedItemColor: Colors.blue,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType.fixed,
          backgroundColor: whiteColor,
          onTap: (value){
            controller.currNavIndex.value = value;
          },
        ),
      ),
    );
  }
}
