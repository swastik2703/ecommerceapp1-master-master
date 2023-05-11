
import 'package:ecommerceapp/Models/category_model.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  var quant = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;
  var subcat = [];


  getSubCategory(title) async{
    subcat.clear();
    var data = await rootBundle.loadString('lib/services/category_mode.json');
    var decoded = categoryModelFromJson(data);
    var s = decoded.categories.where((element) => element.name == title).toList();

    for(var e in s[0].subcategory){
      subcat.add(e);
    }
  }

  changeColorIndex(index){
    colorIndex = index;
  }

  increaseQuant(totalQuantity){
    if(quant.value < totalQuantity){
      quant.value++;
    }

  }

  decreaseQuant(){
    if(quant.value > 0){
      quant.value--;
    }
  }

  calculatePrice(price){
    totalPrice.value = price * quant.value;
  }

  addtoCart({title, img, sellername, color, qty, tprice, context,vendorId}) async{

    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'color': color,
      "qty": qty,
      "vendor_id": vendorId,
      'tprice': tprice,
      'added_by': currentUser!.uid
    }).catchError((error){
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues(){
    totalPrice.value = 0;
    quant.value = 0;
    colorIndex.value = 0;

  }
}

