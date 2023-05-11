import 'package:ecommerceapp/Controller/productController.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/const/list.dart';
import 'package:ecommerceapp/screens/category_screen/category_details.dart';
import 'package:ecommerceapp/widgets/bgwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgWidget(Scaffold(
      appBar: AppBar(
        title: category.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 200), itemBuilder: (context,index){
          return Column(
            children: [
              Image.asset(categoriesImages[index], height: 120,width: 200,fit: BoxFit.cover),
              10.heightBox,
              "${categoriesList[index]}".text.color(darkFontGrey).align(TextAlign.center).make(),
            ],
          ).box.white.rounded.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
            controller.getSubCategory(categoriesList[index]);
            Get.to(()=>CategoryDetail(title: categoriesList[index]));
          });
        }),
      ),
    ));
  }
}
