import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/orderScreen/order_detail.dart';
import 'package:ecommerceapp/services/firestore_services.dart';
import 'package:ecommerceapp/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class orderScreen extends StatelessWidget {
  const orderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: "My orders".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),

      body: StreamBuilder(
        stream: FirestoreServices.getAllorder(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapShot){
          if(!snapShot.hasData){
            return Center(
              child: loadingIndicator(),
            );
          }else if(snapShot.data!.docs.isEmpty){
            return "No orders Yet!".text.color(darkFontGrey).makeCentered();
          }else{
            var data = snapShot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  leading: "${index+1}".text.color(Colors.black).fontFamily(bold).make(),
                  title: data[index]['order_city'].toString().text.color(Colors.black).fontFamily(semibold).make(),
                  subtitle: data[index]['total_amt'].toString().numCurrency.text.color(redColor).fontFamily(semibold).make(),
                  //data[index]['total_amt'].toString().numCurrency.text.color(redColor).fontFamily(semibold).make(),
                  trailing: IconButton(
                    onPressed: (){
                    },
                    icon: Icon(Icons.arrow_forward_ios),
                    color: darkFontGrey,
                  ),
                );

              },

            );
          }
        },
      ),
    );
  }
}
