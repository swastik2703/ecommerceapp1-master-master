import 'package:ecommerceapp/const/consts.dart';

class FirestoreServices{
  static getUser(uid){
    return firestore.collection(userCollection).where('id', isEqualTo: uid).snapshots();
  }

  static getProducts(category){
    return firestore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();
  }

  //get cart

static getCart(uid){
    return firestore.collection(cartCollection).where('added_by', isEqualTo: uid).snapshots();
}

//delete
static delete(docId){
    return firestore.collection(cartCollection).doc(docId).delete();
}

static getAllorder(){
    return firestore.collection(orderCollection).where('order_by',isEqualTo: currentUser!.uid).snapshots();

}
  static getAllwishList(){
    return firestore.collection(productsCollection).where('p_wishlist',isEqualTo: currentUser!.uid).snapshots();

  }
}