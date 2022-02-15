/*
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
*/
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/widgets/my_button.dart';
import 'package:estore/widgets/my_text_field.dart';
import 'package:estore/widgets/star_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart/flutter_cart.dart';

class ProductDetailScreen extends StatefulWidget {
  String? img, name, description;
  int? price,id;
  ProductDetailScreen(
      {this.img, this.name, this.price, this.description,this.id, Key? key})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  var cart = FlutterCart();
  final quantaty = TextEditingController();
  final Col = Colors.grey;
  int _counter = 0;
  int? item = 0, unitprice;
  //bool showElevatedButtonBadge = true;
  Widget _shoppingCartBadge() {
    return Badge(
      position: BadgePosition.topEnd(top: -4, end: 3),
      animationDuration: const Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        cart.cartItem.length.toString(),
        //  _counter.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child: IconButton(
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.black,
            size: 20,
          ),
          onPressed: () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).getCategories();
    return Material(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: whiteColor,
            elevation: 0.0,
            title: TabBar(
              tabs: [
                const Tab(
                  icon: Text(
                    "Products",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Tab(
                  icon: _shoppingCartBadge(),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // backgroundColor: Colors.white,
              Padding(
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
                                        image:
                                            NetworkImage(widget.img.toString()),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Center(
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedBtn(
                            color: kIconColorGreen,
                            circularSize: 12,
                            btnHeight: 50.0,
                            onPress: () {
                              setState(() {
                                quantaty.clear();
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SimpleDialog(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          child: MyTextField(
                                              const Icon(
                                                  Icons.add_shopping_cart),
                                              textInputType:
                                                  TextInputType.number,
                                              labelText: getTranslated(context, "quantity").toString(),
                                              obscure: false,
                                              textEditingController: quantaty),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: MyButton(
                                            lable: getTranslated(context, "ok").toString(),
                                            onTap: () => {
                                              setState(() {
                                                //item =  int.parse(quantaty.text);
                                                cart.addToCart(
                                                  productId:
                                                   widget.id,
                                                  unitPrice: widget.price,
                                                  productName:widget.name,
                                                  quantity: item =
                                                      int.parse(quantaty.text),
                                                );
                                                _counter++;
                                                print(_counter);
                                              }),
                                              Navigator.pop(context, true)
                                            },
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                );
                                //  unitprice= ProductsList[index].iteM_SALE_RATE;
                                item = item! + 1;
                                print(item.toString());
                                print(widget.price);
                              });
                              print("//////////////////" +
                                  cart.cartItem.length.toString());
                            },
                            txtColor: whiteColor,
                            text: getTranslated(context, "Add_to_cart")
                                .toString(),
                            btnTxtSize: 14.0,
                            btnWidth: MediaQuery.of(context).size.width,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Column(
                children: [
                  if (cart.cartItem.isEmpty)
                    const Center(child: Text("Noting added in cart"))
                  else
                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                        itemCount: cart.cartItem.length.toInt(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                                cart.cartItem[index].productName.toString()),
                            //CircleAvatar(//  backgroundImage: NetworkImage(asyncSnapshot.data[index].picture + asyncSnapshot.data[index].index.toString() + ".jpg"),),
                            subtitle: Text(
                              "Quantity: " +
                                  cart.cartItem[index].quantity.toString() +
                                  " unit price Rs: " +
                                  cart.cartItem[index].unitPrice.toString() +
                                  "\n total Rs =  " +
                                  (cart.cartItem[index].quantity *
                                          cart.cartItem[index].unitPrice)
                                      .toString(),
                            ),
                            trailing: Container(
                              height: 20,
                              width: 70,
                              child: Row(
                                // mainAxisAlignment:
                                //     MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onLongPress: () {
                                      setState(() {
                                        cart.deleteItemFromCart(index);
                                        if (_counter > 0) {
                                          setState(() {
                                            _counter--;
                                          });
                                        }
                                        // cart.decrementItemFromCart(index);
                                      });
                                    },
                                    onTap: () {
                                      setState(() {
                                        cart.decrementItemFromCart(index);
                                      });
                                    },
                                    child:Container(
                                        height: 17,
                                        width: 17,
                                        decoration: const BoxDecoration(
                                            color: kIconColorRed,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.remove,
                                          color: whiteColor,
                                          size: 14,
                                        )),
                                  ),
                                  SizedBox(width: 10,),
                                  GestureDetector(
                                    // onLongPress: () {
                                    //   setState(() {
                                    //     cart.deleteItemFromCart(index);
                                    //     if (_counter > 0) {
                                    //       setState(() {
                                    //         _counter++;
                                    //       });
                                    //     }
                                    //     // cart.decrementItemFromCart(index);
                                    //   });
                                    // },
                                    onTap: () {
                                      setState(() {
                                        cart.incrementItemToCart(index);
                                      });
                                    },
                                    child: Container(
                                        height: 17,
                                        width: 17,
                                        decoration: const BoxDecoration(
                                            color: kIconColorGreen,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.add,size: 14,
                                          color: whiteColor,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                      child: Column(
                        children: [
                          _container(getTranslated(context, "sub_total").toString(), cart.getTotalAmount().toString(),12.0),
                          _container(getTranslated(context, "discount").toString(), 34.00,12.0),
                          _container(getTranslated(context, "delivery_charges").toString(), 0.00,12.0),
                          _container(getTranslated(context, "order_total").toString(), cart.getTotalAmount().toString(),14.0),
                        ],
                      ),
                    ),
                  ),
                  ElevatedBtn(
                    btnHeight: 45,
                    btnWidth: 300,
                    color: kIconColorRed,
                    btnTxtSize: 14,
                    text:getTranslated(context, "order_proceed").toString(),
                    circularSize: 8,
                    txtColor: whiteColor,
                    onPress: () {
                      setState(() {});
                      // Navigator.push(context, MaterialPageRoute(builder: (builder)=>MyLocation()));
                      print("proceed order");
                    },
                    //  btnWidth: 200,
                  ),
                  SizedBox(height: 5,),
                  /*
                  Card(
                    child: Expanded(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(14),
                              bottomLeft: Radius.circular(14),
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.44,
                              color: Colors.white,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: MyButton(
                                      lable: "CheckOut",
                                      onTap: () {
                                        print("check out");
                                      },
                                    ),
                                  )
                                ],
                              )),
                            ),
                          ),
                          const VerticalDivider(
                            width: 1.0,
                            color: Colors.black,
                            thickness: 1.0,
                          ),
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.15,
                              width: MediaQuery.of(context).size.width * 0.44,
                              color: Colors.white,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(getTranslated(context, "sub_total").toString(),),
                                      Text(cart.getTotalAmount().toString()),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children:  [
                                      Text(getTranslated(context, "discount").toString()),
                                      const Text("0.00"),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Grand total :"),
                                      Text(
                                        cart.getTotalAmount().toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //
                    // Row(
                    //   children: [
                    //     SizedBox(width: 4),
                    //     MyButton(lable: "CheckOut",onTap: (){},),
                    //     Expanded(
                    //       child: Column(
                    //         children: [
                    //
                    //
                    //           Text("Subtotal Rs= " +
                    //               cart.getTotalAmount().toString()),
                    //           Text("Discount = 0"
                    //           ),
                    //           Text("Grand total = Rs" +
                    //               cart.getTotalAmount().toString()),
                    //
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    //
                  )  */
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
  Widget _container(titleText, price,textSize,) {
    return Padding(
      padding: const EdgeInsets.all(
        8.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: kSemiBold(Colors.black45),
          ),
          Text(
            "\$$price",
            style: kBold(blackColor, textSize),
          ),
        ],
      ),
    );
  }
}
