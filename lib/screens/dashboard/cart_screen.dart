import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/widgets/shoping_cart.dart';
import 'package:estore/screens/components/my_drawer.dart';
import '../../bloc/category/category_cubit.dart';
import '../../constants/image_path.dart';
import '../../model/all_categories_model.dart';
import '../../provider/cart.dart';
import '../../utils/no_notification.dart';
import '../../widgets/iconbtn.dart';
import 'main_page.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);

  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  ApiServices _apiServices = ApiServices();
  ApiServices _repository = ApiServices();

  final quantaty = TextEditingController();
  final Col = Colors.grey;
  int? item = 0, unitprice;
  double totalBill = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0.0,
          toolbarHeight: 60.0,
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
                                CategoryCubit(repository: _repository),
                            child: MainScreen(
                              index: 3,
                              // form: args.toString(),
                            ))));
              },
              color: blackColor,
            ),
            ShoppingCartWidget(
              onPress: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => BlocProvider(
                            create: (BuildContext context) =>
                                CategoryCubit(repository: _apiServices),
                            child: MainScreen(
                              index: 1,
                              // form: args.toString(),
                            ))));
              },
            ),
            SizedBox(
              width: 5.0,
            ),
          ],
          iconTheme: const IconThemeData(color: blackColor),
        ),
        drawer: MyDrawer(),
        body: Consumer<Cart>(builder: (context, cart, child) {
          calculateBill(cart.basketItems);
          return cart.basketItems.isEmpty
              ? Center(
                  child: Column(
                  children: [
                    Expanded(
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: NoNotificationContainer(
                        onPress: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BlocProvider(
                                      create: (BuildContext context) =>
                                          CategoryCubit(
                                              repository: _apiServices),
                                      child: MainScreen(
                                        index: 0,
                                        // form: args.toString(),
                                      ))));
                        },
                        icon: ImagesPath.emptyCart,
                        btnText: getTranslated(context, "continue_shopping")
                            .toString(),
                        txt: getTranslated(context, "your_cart_empty")
                            .toString(),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                  ],
                ))
              : Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: ListView.builder(
                        itemCount: cart.basketItems.length.toInt(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                                const EdgeInsets.only(top: 5.0, bottom: 5.0),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(0.0),
                              leading: Container(
                                height: 145,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  image: DecorationImage(
                                      image: NetworkImage(cart
                                          .basketItems[index].image
                                          .toString()),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              title:
                                  Text(cart.basketItems[index].name.toString()),
                              //CircleAvatar(//  backgroundImage: NetworkImage(asyncSnapshot.data[index].picture + asyncSnapshot.data[index].index.toString() + ".jpg"),),
                              subtitle: Text(
                                "unit price: \$" +
                                    cart.basketItems[index].breakingPrices![0]
                                        .price
                                        .toString() +
                                    "\ntotal price: \$" +
                                    (cart.basketItems[index].breakingPrices![0]
                                                .price! *
                                            cart.basketItems[index].qty)
                                        .toString(),
                              ),
                              trailing: Container(
                                height: 30,
                                width: 80,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (cart.basketItems[index].qty == 1) {
                                          cart.remove(cart.basketItems[index]);
                                        } else {
                                          cart.basketItems[index].qty -= 1;
                                          setState(() {});
                                        }
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
                                    AutoSizeText(
                                        cart.basketItems[index].qty.toString()),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        cart.basketItems[index].qty += 1;

                                        setState(() {});
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                        child: Column(
                          children: [
                            _container(
                                getTranslated(context, "sub_total").toString(),
                                totalBill.toString(),
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
                                getTranslated(context, "order_total")
                                    .toString(),
                                totalBill.toString(),
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
                        cart.basketItems.clear();
                        cart.clear();
                        totalBill == 0.0;
                        setState(() {});
                        // List products = [];
                        // for (final i in cart.basketItems) {
                        //   var productMap = {
                        //     'product_id': i.id,
                        //     'name': i.name,
                        //     'unitPrice': i.price,
                        //     'qty': i.qty,
                        //   };
                        //
                        //   products.add(productMap);
                        // }
                        // _apiServices
                        //     .postProduct(
                        //         totalPrice: totalBill.toString(),
                        //         products: products)
                        //     .then((value) {
                        //   cart.clear();
                        //   totalBill == 0.0;
                        //   setState(() {});
                        //   if (value) {
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //         content: Text("Order Posted Successfully")));
                        //   } else {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //         SnackBar(content: Text("Order Fail to Post ")));
                        //   }
                        // });
                        //

                        // Navigator.push(context, MaterialPageRoute(builder: (builder)=>MyLocation()));
                      },
                      //  btnWidth: 200,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                );
        }));
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

  void calculateBill(List<Product> product) {
    double billPrice = 0.0;
    for (int i = 0; i < product.length; i++) {
      billPrice += product[i].qty * product[i].breakingPrices![0].price!;
    }
    totalBill = billPrice;
  }
}
