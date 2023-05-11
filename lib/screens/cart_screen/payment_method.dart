import 'package:ecommerceapp/const/list.dart';
import 'package:ecommerceapp/screens/category_screen/category_screen.dart';
import 'package:ecommerceapp/screens/home.dart';
import 'package:ecommerceapp/screens/homeScreen.dart';
import 'package:ecommerceapp/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerceapp/const/consts.dart';

import '../../Controller/cartController.dart';
import '../../widgets/button.dart';

class paymentMehtod extends StatelessWidget {
  const paymentMehtod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<cartController>();
    return Obx(()=>
       Scaffold(
        backgroundColor: whiteColor,
        bottomNavigationBar: controller.placeingOrder.value ? Center(child: loadingIndicator()
        ):
           button(
          onpresss: () async{
            await controller.placeOrder(orderPaymentMethod: paymentMehtods[controller.paymentIndex.value],
            tamount: controller.totalp.value
             );

            await controller.clearCart();
            VxToast.show(context, msg: 'Order Placed Successfully');
            Get.to(()=>Home());
          },
          color: redColor,
          textColor: whiteColor,
          title: "place order",
        ),
        appBar: AppBar(
          title: "Choose Payment Mehthod".text.fontFamily(semibold).color(darkFontGrey).make(),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Obx(()=> Column(
              children: List.generate(paymentMehtodList.length, (index) {
                return GestureDetector(
                  onTap: (){
                    controller.changePaymentIndex(index);
                  },
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: controller.paymentIndex.value == index ? Colors.red : Colors.transparent,
                        width: 5,
                      )
                    ),
                    margin: EdgeInsets.only(bottom: 8),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children:[
                    Image.asset(paymentMehtodList[index], width: double.infinity, height: 120,
                      colorBlendMode: controller.paymentIndex.value == index ? BlendMode.darken : BlendMode.color,
                      color: controller.paymentIndex.value == index ? Colors.black.withOpacity(0.4): Colors.transparent,
                      fit: BoxFit.cover,),
                      controller.paymentIndex.value == index ? Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          activeColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          value: true, onChanged: (value){

                        },
                        ),
                      ): Container(),
                        Positioned(
                            bottom: 0,
                            right:10,
                            child: paymentMehtods[index].text.white.fontFamily(bold).size(16).make()),
                    ],
                  ),
                  ),
                );
              }),
        ),
          ),
        ),
      ),
    );
  }
}
