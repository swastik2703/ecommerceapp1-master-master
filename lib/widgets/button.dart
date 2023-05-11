import 'package:ecommerceapp/const/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget button({onpresss, color, textColor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: color,
      padding: EdgeInsets.all(12),
    ),
    onPressed: onpresss,
    //
    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}