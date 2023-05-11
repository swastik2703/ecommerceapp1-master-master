import 'package:ecommerceapp/const/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget orderStatus({icon,color,title,showDone}){
  return ListTile(
    leading: Icon(icon,
    color: color,).box.border(color: color).make(),
  trailing: SizedBox(
    height: 100,
    width: 120,
    child: Row(
      children: [
        "$title".text.color(darkFontGrey).make(),
        showDone ? Icon(Icons.done,
          color: redColor,) : Container(),
      ],
    ),
  ),

  );
}