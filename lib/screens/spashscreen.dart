import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/screens/home.dart';
import 'package:ecommerceapp/screens/loginscreen.dart';
import 'package:ecommerceapp/widgets/applogo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  changeScreen() {
    Future.delayed(Duration(seconds: 3), (){
      // Get.to(()=> LoginScreen());
      auth.authStateChanges().listen((User?user) {
        if(user == null && mounted){
          Get.to(()=>LoginScreen());
        }else{
          Get.to(()=>Home());
        }
      });
    });
  }

  void initState(){
    changeScreen();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade200,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            Text('Shopping Mart', style: TextStyle(color: Colors.white,fontFamily: semibold),),
            // credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
          ],
        ),
      ),
    );
  }
}
