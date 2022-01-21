import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/screens/components/my_carousel.dart';
import 'package:estore/screens/components/my_drawer.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:estore/widgets/my_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        actions: [
          IconBtn(
            icon: const Icon(Icons.search,color: black,),
            onPress: () {},
            color: black,
          ),
          IconBtn(
            icon: const Icon(Icons.notifications_active_outlined,color: black,),
            onPress: () {},
            color: black,
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      drawer: MyDrawer(),
      body: ListView(
        children: [
         Column(crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            MyCarouselSlider(),
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyContainer(txt: "My Product",img: ImagesPath.iconOrder),
                MyContainer(txt: "My Product",img: ImagesPath.iconOrder),
                MyContainer(txt: "My Product",img: ImagesPath.iconOrder),
                MyContainer(txt: "My Product",img: ImagesPath.iconOrder),
                MyContainer(txt: "My Product",img: ImagesPath.iconOrder),
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text("Featured Categories",style: black14f5()),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)),
                child: ListView.builder(scrollDirection: Axis.horizontal,
                  itemCount: 10,
                    itemBuilder: (BuildContext context,index){
                    return MyProductContainer(txt: "Categories",img: ImagesPath.p3,);
                    }
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Text("Featured Products",style: black14f5()),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)),
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio:0.6,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20),
                    itemCount: 10,
                    itemBuilder: (BuildContext ctx, index) {
                      return MyProductContainer(txt: "Categories",img: ImagesPath.p2,);
                    }),
              ),
            ),
          ],
        ),
        ],
      ),
    );
  }
}
