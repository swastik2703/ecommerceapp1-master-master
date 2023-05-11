import 'package:ecommerceapp/const/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customfield({String? title, String? hint, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(Colors.black).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
        border: OutlineInputBorder(
        borderSide: BorderSide(
        color: Colors.blue, // set border color here
        width: 2.0,
        ),
  ),
          hintStyle: TextStyle(
            fontFamily: semibold,
            color: Colors.blueGrey,
          ),

          hintText: hint,
          isDense: true,
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black))

        ),
      ),
      10.heightBox,
    ],
  );
}