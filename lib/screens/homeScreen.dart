import 'package:ecommerceapp/const/consts.dart';
import 'package:ecommerceapp/const/list.dart';
import 'package:ecommerceapp/screens/components/featured_button.dart';
import 'package:ecommerceapp/widgets/homebutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              color: lightGrey,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: whiteColor,
                  hintText: search,
                  hintStyle: TextStyle(color: textfieldGrey)
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    VxSwiper.builder(
                        aspectRatio: 16/ 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: SliderList.length, itemBuilder: (context,index){
                      return Image.asset(SliderList[index],
                        fit: BoxFit.fill,
                      ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
                    }
                    ),

                    10.heightBox,
                    //deals button
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: List.generate(2, (index) => homeButton(
                    //     height: context.screenHeight * 0.12,
                    //     width: context.screenWidth /2.5,
                    //     icon: index == 0 ? icTodaysDeal : icFlashDeal,
                    //     title: index == 0 ? todaydeal : flashsale,
                    //   )),
                    // ),

                    10.heightBox,
                    // VxSwiper.builder(
                    //     aspectRatio: 16/ 9,
                    //     autoPlay: true,
                    //     height: 150,
                    //     enlargeCenterPage: true,
                    //     itemCount: secondSliderList.length, itemBuilder: (context,index){
                    //   return Image.asset(secondSliderList[index],
                    //     fit: BoxFit.fill,
                    //   ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
                    // }),

                    //category builder
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(3, (index) => homeButton(
                        height: context.screenHeight *0.12,
                        width: context.screenWidth /3.5,
                        icon: index == 0 ? icTopCategories : index == 1
                            ? icBrands : icTopSeller,
                        title: index == 0 ? topcategory : index == 1
                            ? brand : topseller,
                      )),
                    ),

                    //feature category
                    20.heightBox,
                    Align(
                      alignment: Alignment.centerLeft,
                      child: featurecat.text.color(darkFontGrey).size(18).fontFamily(semibold).make(),

                    ),
                    20.heightBox,
                    
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                                (index) => Column(
                          children: [
                            featuredButton(icon: featuredImages1[index], title: featuredTitles1[index]),
                            10.heightBox,
                            featuredButton(icon: featuredImages2[index], title: featuredTitles2[index]),
                          ],
                        )).toList(),
                      ),
                    ),

                    //Featured Product
                    20.heightBox,
                    Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(color: redColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          featuredProducts.text.white.fontFamily(bold).size(18).make(),
                          10.heightBox,
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(6, (index) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(imgP1, width: 150, fit: BoxFit.cover,),
                                  10.heightBox,
                                  "Laptop 4Gb/64Gb".text.fontFamily(semibold).color(darkFontGrey).make(),
                                  10.heightBox,
                                  "\$600".text.fontFamily(bold).color(redColor).size(16).make()
                                ],
                              ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(8)).make()),
                            ),
                          ),

                        ],
                      ),
                    ),

                    //Third Swipper
                    20.heightBox,
                    VxSwiper.builder(
                        aspectRatio: 16/ 9,
                        autoPlay: true,
                        height: 150,
                        enlargeCenterPage: true,
                        itemCount: secondSliderList.length, itemBuilder: (context,index){
                      return Image.asset(secondSliderList[index],
                        fit: BoxFit.fill,
                      ).box.rounded.clip(Clip.antiAlias).margin(EdgeInsets.symmetric(horizontal: 8)).make();
                    }),

                    //all products
                    20.heightBox,
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8, mainAxisExtent: 300),
                        itemBuilder: (context , index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(imgP5,height: 200, width: 200, fit: BoxFit.cover),
                          const Spacer(),
                          "Laptop 4Gb/64Gb".text.fontFamily(semibold).color(darkFontGrey).make(),
                          10.heightBox,
                          "\$600".text.fontFamily(bold).color(redColor).size(16).make()
                        ],
                      ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.padding(const EdgeInsets.all(12)).make();
                        })



                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
