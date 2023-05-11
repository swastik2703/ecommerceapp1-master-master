import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

User? currentUser = auth.currentUser;

//collection
const userCollection = "user";
const productsCollection = "Products";
const cartCollection = 'cart';
const orderCollection = 'orders';