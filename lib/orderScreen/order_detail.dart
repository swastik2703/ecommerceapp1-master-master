import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/orderScreen/orderStatus.dart';
import 'package:flutter/material.dart';

class orderDetails extends StatelessWidget {
  final dynamic data;
  const orderDetails({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "Order details".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: Column(
        children: [
          orderStatus(
            color: redColor,
            icon: Icons.done,
            title: "Order Placed",
            showDone: data['order_placed'],
          )
        ],
      ),
      // body: Row(
      //   children: [
      //     Column(
      //       children: [
      //         "Shipping Method".text.fontFamily(semibold).make(),
      //         "${data['shipping_method']}".text.color(redColor).fontFamily(semibold).make()
      //       ],
      //     ),
      //
      //   ],
      // ),
    );
  }
}
