import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/bloc/category/category_state.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/model/all_categories_model.dart';
import 'package:estore/screens/components/my_carousel.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/screens/dashboard/products/product_detail_screen.dart';
import 'package:estore/services/apis_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/widgets/shoping_cart.dart';
import 'package:estore/screens/components/my_drawer.dart';
import '../../widgets/home_product _image.dart';
import '../../widgets/iconbtn.dart';
import '../components/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices _repository = ApiServices();
  ApiServices _apiServices = ApiServices();

  bool userSearch = false;
  List<CategoryModel> _userSearchList = [];
  List<CategoryModel> _list = [];

  late Future<List<CategoryModel>> category;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).getCategories();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar:
      AppBar(
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
      body: SingleChildScrollView(
        // shrinkWrap: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyCarouselSlider(),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CategoryCubit, CategoryState>(
              builder: (context, state) {
                if (state is InitialState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadingState) {
                  return const Center(
                    child: Text("Loading..."),
                  );
                } else if (state is ErrorState) {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                } else if (state is LoadedState) {
                  final List<CategoryModel> users = state.order;
                  return ListView.builder(
                      //outer builder
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                //users[index].products![0].image.toString() != null?
                                Container(
                                  height: 40,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(users[index]
                                              .products![0]
                                              .image
                                              .toString()))),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Text(users[index].name.toString(),
                                      //  getTranslated(context, "featured_product").toString(),
                                      style: kBold(blackColor, 14.0)),
                                ),
                              ],
                            ),
                            // const SizedBox(
                            //   height: 1.0,
                            // ),
                            users[index].products!.length > 0
                                ? SizedBox(
                                    height: 156,
                                    child: ListView.builder(
                                        //inner builder
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        // 1st add
                                        physics: const ClampingScrollPhysics(),
                                        // 2nd add
                                        itemCount:
                                            users[index].products!.length,
                                        itemBuilder: (BuildContext ctx, rdx) {
                                          return GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            BlocProvider(
                                                                create: (BuildContext
                                                                        context) =>
                                                                    CategoryCubit(
                                                                        repository:
                                                                            _repository),
                                                                child:
                                                                    ProductDetailScreen(
                                                                  product_model:
                                                                      users[index]
                                                                              .products![
                                                                          rdx],

                                                                  // form: args.toString(),
                                                                ))));
                                              },
                                              child: HomeCategoriesImage(
                                                img: users[index]
                                                    .products![rdx]
                                                    .image
                                                    .toString(),
                                              )
                                              // MyProductContainerg(
                                              //   img: users[index]
                                              //       .products![rdx]
                                              //       .image
                                              //       .toString(),
                                              //   txt: users[index].products![rdx].name,
                                              //   price:
                                              //       "${getTranslated(context, 'price').toString()}: ${users[index].products![rdx].breakingPrices![0].price}",
                                              // ),
                                              );
                                        }),
                                  )
                                : const SizedBox(
                                    child: Center(
                                      child: AutoSizeText("No Product Found"),
                                    ),
                                  ),
                            // GestureDetector(
                            //   onTap: () {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 ProductDetailScreen(
                            //                   name: users[2]
                            //                       .products![0]
                            //                       .name
                            //                       .toString(),
                            //                   price: users[2]
                            //                       .products![0]
                            //                       .breakingPrices![0]
                            //                       .price
                            //                       .toString(),
                            //                   description: users[2]
                            //                       .products![0]
                            //                       .description
                            //                       .toString(),
                            //                   img: users[2]
                            //                       .products![0]
                            //                       .image
                            //                       .toString(),
                            //                 )));
                            //   },
                            //   child: MyProductContainerg(
                            //     img: users[2].products![0].image.toString(),
                            //     txt: users[2].products![0].name,
                            //     price:
                            //         "${getTranslated(context, 'price').toString()}: ${users[2].products![0].breakingPrices![0].price}",
                            //   ),
                            // ),
                          ],
                        );
                      });
                } else {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Loading....',
                        style: TextStyle(
                            fontWeight: FontWeight.w100, fontSize: 20),
                      ),
                      Text(
                        'check your internet connection!....',
                        style: TextStyle(color: Colors.redAccent, fontSize: 10),
                      )
                    ],
                  ));
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  onSearchTextChanged(String text) async {
    if (text.length == 0) {
      userSearch = false;
    } else {
      userSearch = true;
      // _userSearchList = await _list
      //     .where((element) =>
      //         element.uniqname!.toLowerCase().startsWith(text.toLowerCase()))
      //     .toList();
    }
    setState(() {});
  }
}
