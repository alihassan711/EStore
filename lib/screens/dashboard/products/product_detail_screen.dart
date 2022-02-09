import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/widgets/star_display_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  String? img, name, price, description, color, size;
  ProductDetailScreen(
      {this.img,
      this.name,
      this.price,
      this.description,
      this.color,
      this.size,
      Key? key})
      : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  /*
  List<String> colorList = [
    "Color",
    "Gold",
    "Black",
    "Brown",
  ];
  List<String> sizeList = [
    "Size",
    "large",
    "medium",
    "small",
  ];
  String colorString = "Color";
  final FocusNode _colorNode = FocusNode();
  String sizeString = "Size";
  final FocusNode _sizeNode = FocusNode();
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: whiteColor,
        title: AutoSizeText(
          getTranslated(context, "accessories").toString(),
          style: kBold(kIconColorGreen, 20.0),
        ),
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 8.0, bottom: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Card(
                  //elevation: 2.0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    // width: 300,
                    child: Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(widget.img.toString()),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    right: 20,
                    child: AutoSizeText(
                      "\$ ${widget.price}",
                      style: kBold(kIconColorGreen, 16.0),
                    )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    widget.name.toString(),
                    style: kBold(blackColor, 14.0),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const IconTheme(
                    data: IconThemeData(
                      color: Colors.amber,
                      size: 20,
                    ),
                    child: StarDisplay(value: 3),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    widget.description.toString(),
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            /*
            Row(
              children: [
                Expanded(child: Container(
                  child: Theme(
                    data: ThemeData(
                      // canvasColor: Colors.amberAccent,
                        primaryColor: Colors.white),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        itemHeight: 60,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(5.0, 17.0, 5.0, 17.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                        style: kBold(blackColor, 14.0),
                        value: colorString,
                        // hint: Text(
                        //   getTranslated(context, "country").toString(),
                        //   style: kBold(blackColor, 16.0),
                        // ),
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (cvalue) {
                          FocusScope.of(context).requestFocus(_colorNode);
                          setState(() {
                            colorString = cvalue!;
                          });
                        },
                        items: colorList
                            .map<DropdownMenuItem<String>>((String covalue) {
                          return DropdownMenuItem<String>(
                            value: covalue,
                            child: Text(
                              covalue,
                              style: kBold(blackColor, 14.0),
                            ),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == "Color") {
                            return getTranslated(context, "please_select_color")
                                .toString();
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  height:52,)),SizedBox(width: 5,),
                Expanded(child: Container(
                  child: Theme(
                    data: ThemeData(
                      // canvasColor: Colors.amberAccent,
                        primaryColor: Colors.white),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButtonFormField<String>(
                        itemHeight: 60,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(5, 17.0, 5.0, 17),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                        ),
                        style: kBold(blackColor, 14.0),
                        value: sizeString,
                        // hint: Text(
                        //   getTranslated(context, "country").toString(),
                        //   style: kBold(blackColor, 16.0),
                        // ),
                        icon: Icon(Icons.arrow_drop_down),
                        onChanged: (svalue) {
                          FocusScope.of(context).requestFocus(_colorNode);
                          setState(() {
                            sizeString = svalue!;
                          });
                        },
                        items: sizeList
                            .map<DropdownMenuItem<String>>((String sovalue) {
                          return DropdownMenuItem<String>(
                            value: sovalue,
                            child: Text(
                              sovalue,
                              style: kBold(blackColor, 14.0),
                            ),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == "Size") {
                            return getTranslated(context, "please_select_size")
                                .toString();
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  height:52,)),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                alignment: Alignment.bottomCenter,
                child: ElevatedBtn(
                  color: kIconColorGreen,
                  circularSize: 12,
                  btnHeight: 45.0,
                  onPress: () {},
                  txtColor: whiteColor,
                  text: getTranslated(context, "Add_to_cart").toString(),
                  btnTxtSize: 14.0,
                  btnWidth: 250,
                ),
              ),
            ),
            */
            Expanded(
              child: Center(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedBtn(
                    color: kIconColorGreen,
                    circularSize: 12,
                    btnHeight: 50.0,
                    onPress: () {},
                    txtColor: whiteColor,
                    text: getTranslated(context, "Add_to_cart").toString(),
                    btnTxtSize: 14.0,
                    btnWidth: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
