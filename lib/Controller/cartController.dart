import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class cartController extends GetxController{
  var totalp = 0.obs;
  var addresscontroller = TextEditingController();
  var citycontroller = TextEditingController();
  var statecontroller = TextEditingController();
  var postcontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var paymentIndex = 0.obs;

  late dynamic productSnapshot;
  var products = [];
  var placeingOrder = false.obs;


  calculate(data){
    totalp.value = 0;
    for(var i=0; i<data.length; i++){
      totalp.value = totalp.value + int.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index){
    paymentIndex.value = index;
  }

  //order
placeOrder({required orderPaymentMethod,required tamount}) async{
  placeingOrder(true);
    await getProductDetail();
    await firestore.collection(orderCollection).doc().set({
      'order_by': currentUser!.uid,
      'order_code': "23398765",
      'order_data': FieldValue.serverTimestamp(),
      // 'order_by_name': Get.find<homeController>().Na,
      'order_email' : currentUser!.email,
      'order_add': addresscontroller.text,
      'order_state': statecontroller.text,
      'order_city': citycontroller.text,
      'order_phone': phonecontroller.text,
      'order_postal': postcontroller.text,
      'shipping_method': 'Home delivery',
      'Payment_method': orderPaymentMethod,
      'order_confirm': false,
      'order_delivery': false,
      'order_ondelivery': false,
      'order_place': true,
      'total_amt': tamount,
      'orders': FieldValue.arrayUnion(products)
    });
  placeingOrder(false);
}

getProductDetail(){
    for(var i =0 ; i<productSnapshot.length; i++){
      products.add({
        'color': productSnapshot[i]['color'],
        'vendor_id': productSnapshot[i]['vendor_id'],
        'tprice': productSnapshot[i]['tprice'],
        'img': productSnapshot[i]['img'],
        'qty': productSnapshot[i]['qty'],
        'title': productSnapshot[i]['title'],
      });
    }
}

clearCart(){
    for(var i=0; i<productSnapshot.length; i++){
      firestore.collection(cartCollection).doc(productSnapshot[i].id).delete();
    }
}
}