import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  String? txt, img;
   MyContainer({this.txt,this.img,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
     // height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: MediaQuery.of(context).size.height*0.04,
              child: Container(
                height: MediaQuery.of(context).size.height*0.07,
                child: Image.asset(img!,fit: BoxFit.fill,),
              ),
            ),
            //SizedBox(height: 8,),
            Text(txt!,style: kNormalBlack(blackColor),),
          ],
        ),
      ),
    );
  }
}
class MyProfileContainer extends StatelessWidget {
  String? txt;
   Icon?  icon;
  MyProfileContainer({this.txt,this.icon,Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: MediaQuery.of(context).size.height*0.04,
                child: Container(
                  height: MediaQuery.of(context).size.height*0.07,
                  child: icon,
                ),
              ),
              SizedBox(height: 8,),
              Text(txt!,style: kNormalBlack(blackColor),),
            ],
          ),
        ),
      ),
    );
  }
}
class MyProductContainer extends StatelessWidget {
  String? txt, img;
  MyProductContainer({this.txt,this.img,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Center(
        child: Container(
         // height: MediaQuery.of(context).size.height*0.3,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
                child: Image.asset(img!,height: 110,width: 80,fit: BoxFit.cover,),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height*0.12,
              //   width: MediaQuery.of(context).size.width*0.18,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(14),
              //     image: DecorationImage(image: ExactAssetImage(img!),fit: BoxFit.fill)
              //   ),
              //  // child: Image.asset(img!),
              // ),
              SizedBox(height:0,),
              AutoSizeText(txt!),
            ],
          ),
        ),
      ),
    );
  }
}
class MyProductContainerg extends StatelessWidget {
  String? txt, img,color, price;
  MyProductContainerg({this.txt,this.img,this.color,this.price,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   double height =  MediaQuery.of(context).size.height;
   double width =  MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              //image: DecorationImage(image: ExactAssetImage(img!),fit: BoxFit.fill)
          ),
          child: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height*0.2,
                  width: width*0.3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(image: ExactAssetImage(img!),fit: BoxFit.fill)
                  ),
                  // child: Image.asset(img!),
                ),
                SizedBox(height: 5,),
                AutoSizeText(txt!,style:  kNormalBlack(blackColor),),
                SizedBox(height: 5,),
                AutoSizeText(color!,style:  kNormalBlack(blackColor),),
                SizedBox(height: 5,),
                AutoSizeText(price!,style:  kNormalBlack(kIconColorRed),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}