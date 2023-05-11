import 'package:ecommerceapp/const/colors.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator(){
  return CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(redColor),
  );
}