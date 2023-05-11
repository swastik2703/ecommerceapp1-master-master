import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/screens/home.dart';
import 'package:ecommerceapp/screens/homeScreen.dart';
import 'package:ecommerceapp/screens/signupscreen.dart';
import 'package:ecommerceapp/widgets/applogo.dart';
import 'package:ecommerceapp/widgets/bgwidget.dart';
import 'package:ecommerceapp/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/auth_controller.dart';
import '../const/list.dart';
import '../widgets/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return bgWidget(Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Login to $appname".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              SizedBox(height: 15,),
              Obx(
                  ()=> Column(
                  children: [
                    customfield(title: email, hint: emailHint, isPass: false, controller: controller.emailController),
                    customfield(title: password, hint: passwordHint, isPass: true, controller: controller.passController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(onPressed: (){}, child: forgetpass.text.make(),),
                    ),
                    5.heightBox,
                    //
                    controller.isLoading.value?const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ): button(color: Colors.cyan, textColor: whiteColor, title: login, onpresss: () async {
                      controller.isLoading(true);
                      await controller.loginMethod(context: context).then((value){
                        if(value != null){
                          VxToast.show(context, msg: loggedin);
                          Get.offAll(()=> const Home());
                        }else{
                          controller.isLoading(false);
                        }
                      });
                    }).box.width(context.screenWidth-50).make(),
                    7.heightBox,
                    createAcc.text.color(fontGrey).make(),
                    button(color: lightGrey, textColor: Colors.black, title: signup, onpresss: () {
                      Get.to(()=> Signup());
                    }).box.width(context.screenWidth-50).make(),

                    10.heightBox,
                    loginwith.text.color(fontGrey).make(),
                    5.heightBox,

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                        List.generate(
                          3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(socialicon[index],width: 30,),
                              ),
                            ),
                        ),
                    ),
                  ],
                ).box.white.rounded.padding(EdgeInsets.all(16)).width(context.screenWidth - 70).make(),
              ),
            10.heightBox,
            ],
          ),
        ),
      ),
    ));
  }
}
