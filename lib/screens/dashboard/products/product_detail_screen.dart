import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/components/my_drawer.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:estore/widgets/shoping_cart.dart';
import 'package:estore/widgets/star_display_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../model/all_categories_model.dart';
import '../../../provider/cart.dart';

class ProductDetailScreen extends StatefulWidget {
  Product product_model;

  ProductDetailScreen({required this.product_model, Key? key})
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
    return Consumer<Cart>(builder: (context, cart, child) {
      return Material(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
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
                                    CategoryCubit(repository: _apiServices),
                                child: MainScreen(
                                  index: 1,
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
                                  index: 3,
                                ))));
                  },
                ),
                SizedBox(
                  width: 5.0,
                )
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
                                    image: NetworkImage(
                                        widget.product_model.image.toString()),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 14,
                        child: GestureDetector(
                          onTap: () {
                            ApiServices.addFavouriteProduct(
                                    productId: widget.product_model.id)
                                .then((value) {
                              if (value) {
                                _apiServices
                                    .successToast("Product added as favourite");
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    _apiServices.failToast(
                                        "Failed to add as favourite"));
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.circular(5),
                            ),
                            height: 25,
                            width: 25,
                            child: Center(
                              child: const Icon(
                                Icons.favorite_outlined,
                                size: 18,
                                color: kIconColorRed,
                              ),
                            ),
                          ),
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
                        widget.product_model.name.toString(),
                        style: kBold(blackColor, 14.0),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AutoSizeText(
                        "\$ ${widget.product_model.breakingPrices![0].price}",
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
                        widget.product_model.description.toString(),
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
                            if (cart.basketItems
                                .contains(widget.product_model)) {
                            } else {
                              cart.add(widget.product_model);
                            }
                          },
                          txtColor: whiteColor,
                          text:
                              getTranslated(context, "Add_to_cart").toString(),
                          btnTxtSize: 14.0,
                          btnWidth: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //   ],
            // ),
          ),
        ),
      );
    });
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
