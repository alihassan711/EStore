import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/model/product_model.dart';
import 'package:estore/screens/components/my_carousel.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/widgets/my_container.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices _apiServices = ApiServices();
  late  Future<List<Products>> futureProducts;

  @override
  void initState() {
    super.initState();
setState(() {
  futureProducts = _apiServices.getAllProducts();
});

  }
  @override
  Widget build(BuildContext context) {
    futureProducts;
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
                          txt:getTranslated(context, "top_categories").toString(),img: ImagesPath.category),
                      MyContainer(txt: getTranslated(context, "brand").toString(), img: ImagesPath.brand),
                      MyContainer(txt: getTranslated(context, "top_sellers").toString(), img: ImagesPath.top),
                      MyContainer(txt: getTranslated(context, "today_deals").toString(), img: ImagesPath.today),
                      MyContainer(txt: getTranslated(context, "flash_side").toString(), img: ImagesPath.flash),
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
            Padding(
              padding: const EdgeInsets.only(left: 5.0,right: 5.0),
              child: AutoSizeText(getTranslated(context, "featured_categories").toString(), style: kBold(blackColor,14.0)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 160,
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
            Padding(
              padding: const EdgeInsets.only(left: 5.0,right: 5.0),
              child: Text(getTranslated(context, "featured_product").toString(), style: kBold(blackColor,14.0)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // height: MediaQuery.of(context).size.height*0.35,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: FutureBuilder(
                future: futureProducts,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if(snapshot.hasData){
                return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio:
                      MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height * 0.94),
                    ),
                    itemCount: 1,
                    itemBuilder: (BuildContext ctx, index) {
                      return MyProductContainerg(
                       // txt:snapshot.data.name,
                        //"Categories",
                        img: ImagesPath.watch,
                        color: "pacific_cube",
                       // price: snapshot.data.price,
                      );
                    });}
                return const CircularProgressIndicator();
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
