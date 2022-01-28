import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/screens/components/my_carousel.dart';
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
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      // shrinkWrap: true,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyCarouselSlider(),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MyContainer(
                          txt: "Top Categories", img: ImagesPath.category),
                      MyContainer(txt: "Brands", img: ImagesPath.brand),
                      MyContainer(txt: "Top Sellers", img: ImagesPath.top),
                      MyContainer(txt: "Today Deals", img: ImagesPath.today),
                      MyContainer(txt: "Flash Side", img: ImagesPath.flash),
                    ],
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 8,
            // ),
            const SizedBox(
              height: 10,
            ),
            AutoSizeText("Featured Categories", style: kSemiBold(blackColor)),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.3,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return MyProductContainer(
                      txt: "Jewelery &\n Watches",
                      img: ImagesPath.jewelery,
                    );
                  }),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const SizedBox(
              height: 18,
            ),
            Text("Featured Products", style: kSemiBold(blackColor)),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: MediaQuery.of(context).size.height*0.35,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height * 0.8),
                  ),
                  itemCount: 10,
                  itemBuilder: (BuildContext ctx, index) {
                    return MyProductContainerg(
                      txt: "Categories",
                      img: ImagesPath.watch,
                      color: "pacific_cube",
                      price: ("\$888.00"),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
