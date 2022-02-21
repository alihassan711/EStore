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
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/components/my_drawer.dart';
import 'package:estore/screens/dashboard/drawer/notification_screen.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:estore/widgets/shoping_cart.dart';
import 'package:estore/widgets/star_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailScreen extends StatefulWidget {
  String? img, name, description;
  int? price, id;
  ProductDetailScreen(
      {this.img, this.name, this.price, this.description, this.id, Key? key})
      : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ApiServices _apiServices = ApiServices();
  final quantaty = TextEditingController();
  final Col = Colors.grey;
  int _counter = 0;
  int? item = 0, unitprice;
  //bool showElevatedButtonBadge = true;
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
            toolbarHeight: 60.0,
            // title:
            /*
         TextField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
              hintText:getTranslated(context, 'search').toString(),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: const Color.fromRGBO(93, 25, 72, 1),
                onPressed: () {
                },
              )),
          style: const TextStyle(color: blackColor, fontSize: 15.0),
           onSaved: (value) {
             onSearchTextChanged(value!);
           },
           onChanged: (String value) async {
             onSearchTextChanged(value);
           },

        ),
        */
            actions: [
              IconBtn(
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  color: blackColor,
                ),
                onPress: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BlocProvider(
                              create: (BuildContext context) =>
                                  CategoryCubit(
                                      repository: _apiServices),
                              child: MainScreen(
                                index: 1,
                                // form: args.toString(),
                              ))));
                },
                color: blackColor,
              ),
              ShoppingCartWidget(item:cart.cartItem.length.toString(),
                onPress: (){
                  setState(() {
                    cart.cartItem.length;
                    Navigator.pushReplacement(context,  MaterialPageRoute(
                        builder: (_) => BlocProvider(
                            create: (BuildContext context) =>
                                CategoryCubit(repository: _apiServices),
                            child:  MainScreen(
                              index: 3,
                            ))));
                  });
                },
              ),
            ],
            iconTheme: const IconThemeData(color: blackColor),
          ),
          drawer: MyDrawer(),
          body:
          //TabBarView(
            //children: [
              // backgroundColor: Colors.white,
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 8.0, bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          // width: 300,
                          child: Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image:
                                          NetworkImage(widget.img.toString()),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: GestureDetector(
                            child: const Icon(
                              Icons.favorite_outlined,
                              color: kIconColorRed,
                            ),
                            onTap: () {
                              print("id ===> ${widget.id}");
                              ApiServices.addFavouriteProduct(
                                  productId: widget.id);
                            },
                          ),
                          // AutoSizeText(
                          //   "\$ ${widget.price}",
                          //   style: kBold(kIconColorGreen, 16.0),
                          // )
                        ),
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
                          height: 5,
                        ),
                        AutoSizeText(
                          "\$ ${widget.price}",
                          style: kBold(kIconColorGreen, 16.0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const IconTheme(
                          data: IconThemeData(
                            color: Colors.amber,
                            size: 20,
                          ),
                          child: StarDisplay(value: 3),
                        ),
                        const SizedBox(
                          height: 5,
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
                                //item =  int.parse(quantaty.text);
                                cart.addToCart(
                                  productId: widget.id,
                                  unitPrice: widget.price,
                                  productName: widget.name,
                                  quantity: item = 1,
                                  productDetailsObject: widget.img
                                );
                                _counter++;
                                print(_counter);
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return SimpleDialog(
                                //       children: <Widget>[
                                //         Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 8, vertical: 4),
                                //           child: MyTextField(
                                //               const Icon(
                                //                   Icons.add_shopping_cart),
                                //               textInputType:
                                //                   TextInputType.number,
                                //               labelText: getTranslated(context, "quantity").toString(),
                                //               obscure: false,
                                //               textEditingController: quantaty),
                                //         ),
                                //         Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 8),
                                //           child: MyButton(
                                //             lable: getTranslated(context, "ok").toString(),
                                //             onTap: () => {
                                //               setState(() {
                                //                 //item =  int.parse(quantaty.text);
                                //                 cart.addToCart(
                                //                   productId:
                                //                    widget.id,
                                //                   unitPrice: widget.price,
                                //                   productName:widget.name,
                                //                   quantity: item =
                                //                       int.parse(quantaty.text),
                                //                 );
                                //                 _counter++;
                                //                 print(_counter);
                                //               }),
                                //               Navigator.pop(context, true)
                                //             },
                                //           ),
                                //         )
                                //       ],
                                //     );
                                //   },
                                // );
                                //  unitprice= ProductsList[index].iteM_SALE_RATE;
                                item = item! + 1;
                                print(item.toString());
                                print(widget.price);
                                cart.cartItem.length == 0;
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
/*
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0,top: 5),
                child: Column(
                  children: [
                    if (cart.cartItem.isEmpty)
                      const Center(child: Text("Noting added in cart"))
                    else
                      Expanded(
                        flex: 5,
                        child: ListView.builder(
                          itemCount: cart.cartItem.length.toInt(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                              child: ListTile(contentPadding: EdgeInsets.all(0.0),
                                leading: Container(
                                  height: 145,
                                  width: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(image: NetworkImage(cart.cartItem[index].productDetails.toString()),fit: BoxFit.fill),
                                  ),
                                ),
                                title: Text(
                                    cart.cartItem[index].productName.toString()),
                                //CircleAvatar(//  backgroundImage: NetworkImage(asyncSnapshot.data[index].picture + asyncSnapshot.data[index].index.toString() + ".jpg"),),
                                subtitle: Text(
                                      " unit price: \$" +
                                      cart.cartItem[index].unitPrice.toString() +
                                      "\n total: \$" +
                                      (cart.cartItem[index].quantity *
                                              cart.cartItem[index].unitPrice)
                                          .toString(),
                                ),
                                trailing: Container(
                                  height: 30,
                                  width: 80,
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
                                        child: Container(
                                            height: 18,
                                            width: 18,
                                            decoration: const BoxDecoration(
                                                color: kIconColorRed,
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                              Icons.remove,
                                              color: whiteColor,
                                              size: 14,
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      AutoSizeText(cart.cartItem[index].quantity.toString()),
                                      const SizedBox(
                                        width: 10,
                                      ),
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
                                            height: 18,
                                            width: 18,
                                            decoration: const BoxDecoration(
                                                color: kIconColorGreen,
                                                shape: BoxShape.circle),
                                            child: const Icon(
                                              Icons.add,
                                              size: 14,
                                              color: whiteColor,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Column(
                          children: [
                            _container(
                                getTranslated(context, "sub_total").toString(),
                                cart.getTotalAmount().toString(),
                                12.0),
                            _container(
                                getTranslated(context, "discount").toString(),
                                0.00,
                                12.0),
                            _container(
                                getTranslated(context, "delivery_charges")
                                    .toString(),
                                0.00,
                                12.0),
                            _container(
                                getTranslated(context, "order_total").toString(),
                                cart.getTotalAmount().toString(),
                                14.0),
                          ],
                        ),
                      ),
                    ),
                    ElevatedBtn(
                      btnHeight: 45,
                      btnWidth: 300,
                      color: kIconColorRed,
                      btnTxtSize: 14,
                      text: getTranslated(context, "order_proceed").toString(),
                      circularSize: 8,
                      txtColor: whiteColor,
                      onPress: () async {
                        List products = [];
                        for (final i in cart.cartItem) {
                          var productMap = {
                            'product_id': i.productId,
                            'name': i.productName,
                            'unitPrice': i.unitPrice,
                            'qty': i.quantity,
                          };

                          products.add(productMap);
                        }
                         _apiServices.postProduct(
                           totalPrice: cart.getTotalAmount().toString(),
                        products:products) .then((value) {
                           if(value){
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order Posted Successfully")));
                           }else{
                             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Order Fail to Post ")));
                           }
                         }
                         );
                        //
                         setState(() {
                           _counter == 0;
                           cart.deleteAllCart();
                           cart.cartItem.length == 0;
                         });
                        // Navigator.push(context, MaterialPageRoute(builder: (builder)=>MyLocation()));
                      },
                      //  btnWidth: 200,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),

 */
          //   ],
          // ),
        ),
      ),
    );
  }

  Widget _container(
    titleText,
    price,
    textSize,
  ) {
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
