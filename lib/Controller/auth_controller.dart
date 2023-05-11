import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{
  var isLoading = false.obs;

  var emailController = TextEditingController();
  var passController = TextEditingController();

  //login method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try{
      await auth.signInWithEmailAndPassword(email: emailController.text, password: passController.text);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //Signup method
  Future<UserCredential?> signupMethod({email,password,context}) async {
    UserCredential? userCredential;

    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //store data
storeUserData({required String email, required String password, required String name}){
    DocumentReference store = firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({'name': name, 'password': password, 'email': email, 'imageUrl': '', 'id': currentUser!.uid});
}
  signoutMethod(context) async{
    try{
      await auth.signOut();
    }catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}