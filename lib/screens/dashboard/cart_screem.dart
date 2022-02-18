import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:flutter/material.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({Key? key}) : super(key: key);
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  ApiServices _apiServices = ApiServices();
  final quantaty = TextEditingController();
  final Col = Colors.grey;
  int _counter = 0;
  int? item = 0, unitprice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 5),
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
                    child: ListTile(
                      contentPadding: EdgeInsets.all(0.0),
                      leading: Container(
                        height: 145,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                              image: NetworkImage(cart
                                  .cartItem[index].productDetails
                                  .toString()),
                              fit: BoxFit.fill),
                        ),
                      ),
                      title: Text(cart.cartItem[index].productName.toString()),
                      //CircleAvatar(//  backgroundImage: NetworkImage(asyncSnapshot.data[index].picture + asyncSnapshot.data[index].index.toString() + ".jpg"),),
                      subtitle: Text(
                        " unit price: \$" +
                            cart.cartItem[index].unitPrice.toString() +
                            "\n total price: \$" +
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
                            AutoSizeText(
                                cart.cartItem[index].quantity.toString()),
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
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Column(
                children: [
                  _container(getTranslated(context, "sub_total").toString(),
                      cart.getTotalAmount().toString(), 12.0),
                  _container(getTranslated(context, "discount").toString(),
                      0.00, 12.0),
                  _container(
                      getTranslated(context, "delivery_charges").toString(),
                      0.00,
                      12.0),
                  _container(getTranslated(context, "order_total").toString(),
                      cart.getTotalAmount().toString(), 14.0),
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
              _apiServices
                  .postProduct(
                      totalPrice: cart.getTotalAmount().toString(),
                      products: products)
                  .then((value) {
                if (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Order Posted Successfully")));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Order Fail to Post ")));
                }
              });
              //
              setState(() {
                cart.cartItem.length == 0;
                _counter == 0;
                cart.deleteAllCart();

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
    ));
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
