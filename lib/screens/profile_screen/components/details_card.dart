import 'package:ecommerceapp/const/consts.dart';
import 'package:flutter/cupertino.dart';

Widget detailsCard({width,String? count, String? title})=> Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "00".text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      "In your Cart".text.color(darkFontGrey).make(),
    ],
  ).box.white.rounded.width(width).height(70).padding(const EdgeInsets.all(4)).make();