import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/Controller/productController.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/screens/category_screen/item_details.dart';
import 'package:ecommerceapp/services/firestore_services.dart';
import 'package:ecommerceapp/widgets/bgwidget.dart';
import 'package:ecommerceapp/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetail extends StatelessWidget {
  final String? title;
  const CategoryDetail({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return Scaffold(
      appBar: AppBar(
        title: title!.text.fontFamily(bold).white.make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getProducts(title),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          // return Container(
          //   child: ,
          // )
          if(!snapshot.hasData){
            return Center(
              child: loadingIndicator(),
            );
          }else if(snapshot.data!.docs.isEmpty){
            return Center(
              child: "No Products Found!".text.color(darkFontGrey).make(),
            );
          }
          else{
            var data = snapshot.data!.docs;

            return
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(controller.subcat.length, (index) =>
                          "${controller.subcat[index]}"
                              .text.size(12).fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.rounded.size(120, 60).margin(const EdgeInsets.symmetric(horizontal: 4)).make()),
                    ),
                  ),

                  20.heightBox,

                  //itmes container
                  Expanded(child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250, mainAxisSpacing: 8,crossAxisSpacing: 8), itemBuilder: (context,index){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(data[index]['p_imgs'][0],height: 150, width: 200, fit: BoxFit.cover),

                        "${data[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                        10.heightBox,
                        "${data[index]['p_price']}".numCurrency.text.fontFamily(bold).color(redColor).size(16).make()
                      ],
                    ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.outerShadowSm.padding(const EdgeInsets.all(12)).make().onTap(() {
                      Get.to(()=> ItemDetails(title: "${data[index]['p_name']}", data: data[index],));
                    });
                  }))


                ],
              ),
            );
          }
        },
      )
    );
  }
}
