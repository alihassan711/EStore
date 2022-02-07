import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  String? txt, img;
  MyContainer({this.txt, this.img, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: MediaQuery.of(context).size.height * 0.035,
              child: Container(
               // height:40,
               // width: 40,
                decoration: BoxDecoration(
                  image: DecorationImage(image: ExactAssetImage(img!),fit: BoxFit.fill)
                ),
                // child: Image.asset(
                //   img!,
                //   fit: BoxFit.fill,
                // ),
              ),
            ),
            //SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 5.0,right: 5.0),
              child: Text(
                txt!,
                style: kNormalBlack(blackColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyProfileContainer extends StatelessWidget {
  String? txt;
  Icon? icon;
  MyProfileContainer({this.txt, this.icon, Key? key}) : super(key: key);
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
                radius: MediaQuery.of(context).size.height * 0.03,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: icon,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                txt!,
                style: kNormalBlack(blackColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyProductContainer extends StatelessWidget {
  String? txt,id, img;
  MyProductContainer({this.txt,this.id, this.img, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            img!,
            height: 110,
            width:  110,
            fit: BoxFit.cover,
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
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0,left: 6.0,right: 6.0),
            child: Column(
              children: [
                AutoSizeText("Name: $txt"),
                SizedBox(height: 5,),
                AutoSizeText("Id: $id"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyProductContainerg extends StatelessWidget {
  String? txt, img, price;
  MyProductContainerg({this.txt, this.img,this.price, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          //image: DecorationImage(image: ExactAssetImage(img!),fit: BoxFit.fill)
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 85,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: ExactAssetImage(img!), fit: BoxFit.fill)),
                // child: Image.asset(img!),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: AutoSizeText(
                  txt!,
                  style: kNormalBlack(blackColor),
                ),
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0,right: 8.0),
              //   child: AutoSizeText(
              //       txt!,
              //     style: kNormalBlack(blackColor),
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                child: AutoSizeText(
                  "price $price",
                  style: kNormalBlack(kIconColorRed),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
