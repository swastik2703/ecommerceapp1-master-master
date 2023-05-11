import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Controller/cartController.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/screens/cart_screen/shippingscreen.dart';
import 'package:ecommerceapp/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../services/firestore_services.dart';
import '../../widgets/loading.dart';
import 'package:get/get.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(cartController());
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: button(
          color: Colors.red,
          onpresss: (){
            Get.to(()=>Shippingdetails());
          },
          textColor: whiteColor,
          title: 'Proceed to Shipping'
      ),
      appBar: AppBar(

        automaticallyImplyLeading: false,
        title: "Shopping Cart".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: loadingIndicator(),
            );
          }else if(snapshot.data !.docs.isEmpty){
            return Center(
              child: "cart is Empty".text.color(darkFontGrey).make(),
            );
          }else{
            var data = snapshot.data!.docs;
            controller.calculate(data);
            controller.productSnapshot = data;
            return Padding(padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(child: ListView.builder(
                    itemCount: data.length,
                      itemBuilder: (BuildContext context, int index){
                    return ListTile(
                      leading: Image.network("${data[index]['img']}"),
                      title: "${data[index]['title']} (*${data[index]['qty']})".text.fontFamily(semibold).size(16).make(),
                      subtitle: "${data[index]['tprice']}".numCurrency.text.color(redColor).fontFamily(semibold).size(16).make(),
                      trailing: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ).onTap(() {
                        FirestoreServices.delete(data[index].id);
                      }),
                    );
                  }),

                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      'Total Price'.text.fontFamily(semibold).color(Colors.black).make(),
                      Obx(()=> '${controller.totalp.value}'.numCurrency.text.fontFamily(semibold).color(Colors.black).make()),
                    ],
                  ).box.padding(EdgeInsets.all(12)).color(Colors.black12).width(context.screenWidth-60).roundedSM.make(),
                  10.heightBox,
                  // SizedBox(
                  //   width: context.screenWidth-60,
                  //   child: button(
                  //     color: Colors.red,
                  //     onpresss: (){},
                  //     textColor: whiteColor,
                  //     title: 'Proceed to Shipping'
                  //   ),
                  // ),
                ],
              ),
            );
          }
        },
      )
    );
  }
}
