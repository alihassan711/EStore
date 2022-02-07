import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/widgets/star_display_widget.dart';
import 'package:flutter/material.dart';
class ProductDetailScreen extends StatefulWidget {
  String? img,name,price,description,color,size;
   ProductDetailScreen({this.img,this.name,this.price,this.description,this.color,this.size,Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: whiteColor,
        title:  AutoSizeText("Accessories",style: kBold(kIconColorGreen, 20.0),),
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(color: kGrey,
                  height: 200,
                 // width: 300,
                  child: Center(
                    child: Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(image: DecorationImage(image: ExactAssetImage(ImagesPath.watch),fit: BoxFit.fill)),
                    ),
                  ),
                ),
                 Positioned(
                    top: 70,
                    right: 20,
                    child: AutoSizeText("price",style: kBold(kIconColorRed,14.0),))
              ],
            ),
            SizedBox(height: 10,),
            Column(
              children: [
            AutoSizeText("Name",style: kBold(blackColor, 14.0),),
             const SizedBox(height: 10,),
             const IconTheme(
              data: IconThemeData(
                color: Colors.amber,
                size: 20,
              ),
              child: StarDisplay(value: 3),
            ),
            const SizedBox(height: 10,),
            const AutoSizeText(
              "Description",maxLines: 3,
            ),
            Expanded(
              flex: 2,
              child: Container(color: kIconColorRed,
                //height: 50,
               // width: 300,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Theme(
                      data: ThemeData(
                        // canvasColor: Colors.amberAccent,
                          primaryColor: Colors.white),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          itemHeight: 60,
                          decoration: const InputDecoration(
                            contentPadding:
                            EdgeInsets.fromLTRB(5, 17.0, 5.0, 17),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14.0),
                              ),
                            ),
                          ),
                          style: kBold(blackColor, 14.0),
                          value: colorString,
                          hint: Text(
                              getTranslated(context, "country")
                                  .toString(),
                              style: kBold(blackColor, 16.0),),
                          icon: Icon(Icons.arrow_drop_down),
                          onChanged: (cvalue) {
                            FocusScope.of(context)
                                .requestFocus(_colorNode);
                            setState(() {
                              colorString = cvalue!;
                            });
                          },
                          items: colorList.map<DropdownMenuItem<String>>(
                                  (String covalue) {
                                return DropdownMenuItem<String>(
                                  value: covalue,
                                  child: Text(
                                    covalue,
                                    style: kBold(blackColor, 14.0),
                                  ),
                                );
                              }).toList(),
                          validator: (value) {
                            if (value == "Country") {
                              return getTranslated(
                                  context, "required_country")
                                  .toString();
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    Theme(
                      data: ThemeData(
                        // canvasColor: Colors.amberAccent,
                          primaryColor: Colors.white),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          itemHeight: 60,
                          decoration: const InputDecoration(
                            contentPadding:
                            EdgeInsets.fromLTRB(5, 17.0, 5.0, 17),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(14.0),
                              ),
                            ),
                          ),
                          style: kBold(blackColor, 14.0),
                          value: sizeString,
                          hint: Text(
                              getTranslated(context, "country")
                                  .toString(),
                              style: kBold(blackColor, 16.0)),
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (cvalue) {
                            FocusScope.of(context)
                                .requestFocus(_sizeNode);
                            setState(() {
                              sizeString = cvalue!;
                            });
                          },
                          items: sizeList.map<DropdownMenuItem<String>>(
                                  (String covalue) {
                                return DropdownMenuItem<String>(
                                  value: covalue,
                                  child: Text(
                                    covalue,
                                    style: kBold(blackColor, 16.0),
                                  ),
                                );
                              }).toList(),
                          validator: (value) {
                            if (value == "Color") {
                              return getTranslated(
                                  context, "required_country")
                                  .toString();
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedBtn(
              color: kIconColorGreen,
              circularSize: 12,
              btnHeight: 45.0,
              onPress: (){},
              txtColor: whiteColor,
              text: "Add To Cart",
              btnTxtSize: 14.0,
              btnWidth: 200,
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
