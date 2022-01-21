import 'package:estore/constants/image_path.dart';
import 'package:flutter/material.dart';
class MyContainer extends StatelessWidget {
  String? txt, img;
   MyContainer({this.txt,this.img,Key? key}) : super(key: key);

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
                radius: 50,
                child: Container(
                  height: 60,
                  child: Image.asset(img!),
                ),
              ),
              SizedBox(height: 10,),
              Text(txt!,),
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Center(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(image: ExactAssetImage(img!),fit: BoxFit.fill)
                    ),
                   // child: Image.asset(img!),
                  ),
                  SizedBox(height: 10,),
                  Text(txt!,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
