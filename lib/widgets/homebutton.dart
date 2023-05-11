import 'package:ecommerceapp/const/consts.dart';
import 'package:flutter/cupertino.dart';

Widget homeButton({width, height, icon, String? title, onpress}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset(icon, width: 26,),
      5.heightBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  ).box.white.rounded.size(width, height).make();
}