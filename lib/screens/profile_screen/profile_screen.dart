import 'package:ecommerceapp/Controller/auth_controller.dart';
import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/const/images.dart';
import 'package:ecommerceapp/const/list.dart';
import 'package:ecommerceapp/orderScreen/order_detail.dart';
import 'package:ecommerceapp/orderScreen/order_screen.dart';
import 'package:ecommerceapp/screens/loginscreen.dart';
import 'package:ecommerceapp/screens/profile_screen/components/details_card.dart';
import 'package:ecommerceapp/widgets/bgwidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(

              child: Column(
                children: [

                  //edit profile button
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Align(
                      alignment: Alignment.topRight,
                        child: const Icon(Icons.edit, color: Colors.white)).onTap(() { }),
                  ),


                  //user detail section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Image.asset(imgProfile2, width: 100,fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                        10.widthBox,
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Dummy User".text.fontFamily(semibold).color(Colors.white).make(),
                            "customer@example.com".text.color(Colors.white).make()
                          ],
                        )),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: Colors.white,
                            )
                          ),
                            onPressed: () async {
                            await Get.put(AuthController()).signoutMethod(context);
                            Get.offAll(()=> const LoginScreen());
                            }, child: icLogout.text.fontFamily(semibold).white.make(),
                        )
                      ],
                    ),
                  ),

                  20.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      detailsCard(count: "00", title: "In your Cart", width: context.screenWidth/3.4),
                      detailsCard(count: "32", title: "In your wishlist", width: context.screenWidth/3.4),
                      detailsCard(count: "675", title: " Your order", width: context.screenWidth/3.4),
                    ],
                  ),

                  //buttons section

                  25.heightBox,

                  ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context,index){
                      return const Divider(
                        color: lightGrey
                      );
                    },
                    itemCount: profileButtonsList.length,
                     itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: (){
                          switch(index){
                            case 0:
                              // Get.to(()=> orderScreen());
                              break;
                            case 1:
                              Get.to(()=>orderScreen());
                              break;
                          }

                        },
                        leading: Image.asset(profileButtonsIcons[index],width: 22),
                        title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                      );
                     },

                  ).box.white.rounded.padding(const EdgeInsets.symmetric(horizontal: 16)).make().box.color(Colors.blue).make()

                ],
              )

            ),
          ],
        ),
      ),
    );
  }
}
