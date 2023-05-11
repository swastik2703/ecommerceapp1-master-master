import 'package:ecommerceapp/Controller/cartController.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/screens/cart_screen/payment_method.dart';
import 'package:ecommerceapp/widgets/button.dart';
import 'package:ecommerceapp/widgets/customtextfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shippingdetails extends StatelessWidget {
  const Shippingdetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<cartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shipping Info".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: button(
        onpresss: (){
          if(controller.addresscontroller.text.length > 10){
            Get.to(()=> paymentMehtod());
          }
          else{
            VxToast.show(context, msg: "Please fill the form");
          }
        },
        color: redColor,
        textColor: whiteColor,
        title: "Continue",

      ),

      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            customfield(hint: "Address",isPass: false,title: "Address", controller: controller.addresscontroller),
            customfield(hint: "City",isPass: false, title: "City", controller: controller.citycontroller),
            customfield(hint: "State",isPass: false, title: "State", controller: controller.statecontroller),
            customfield(hint: "Postal Code",isPass: false, title: "Postal Code", controller: controller.postcontroller),
            customfield(hint: "Phone",isPass: false, title: "Phone", controller: controller.phonecontroller),
          ],
        ),
      ),
    );
  }
}
