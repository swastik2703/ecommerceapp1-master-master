import 'package:flutter/cupertino.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:flutter/material.dart';
Widget bgWidget(Widget? child) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(
        imgBackground,
      ), fit: BoxFit.fitHeight),
    ),
    child: child,
  );
}