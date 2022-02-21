import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/bloc/category/category_state.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/model/all_categories_model.dart';
import 'package:estore/model/product_model.dart';
import 'package:estore/screens/components/my_carousel.dart';
import 'package:estore/screens/dashboard/products/product_detail_screen.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices _repository = ApiServices();
  bool userSearch = false;
  List<ProductModel> _userSearchList = [];
  List<ProductModel> _list = [];

  late Future<List<CategoryModel>> category;

  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).getCategories();
    return SingleChildScrollView(
      // shrinkWrap: true,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const MyCarouselSlider(),
            /*
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
                          txt: getTranslated(context, "top_categories")
                              .toString(),
                          img: ImagesPath.category),
                      MyContainer(
                          txt: getTranslated(context, "brand").toString(),
                          img: ImagesPath.brand),
                      MyContainer(
                          txt: getTranslated(context, "top_sellers").toString(),
                          img: ImagesPath.top),
                      MyContainer(
                          txt: getTranslated(context, "today_deals").toString(),
                          img: ImagesPath.today),
                      MyContainer(
                          txt: getTranslated(context, "flash_side").toString(),
                          img: ImagesPath.flash),
                    ],
                  ),
                ],
              ),
            ),
            */
            const SizedBox(
              height: 10,
            ),
            // ListView.builder( // outer ListView
            //   shrinkWrap: true,
            //   itemCount: 4,
            //   itemBuilder: (_, index) {
            //     return Column(
            //       children: [
            //         Container(
            //           color: Colors.blue,
            //           alignment: Alignment.center,
            //           child: Text('Header $index'),
            //         ),
            //         ListView.builder( // inner ListView
            //           shrinkWrap: true, // 1st add
            //           physics: ClampingScrollPhysics(), // 2nd add
            //           itemCount: 10,
            //           itemBuilder: (_, index) => ListTile(title: Text('Item $index')),
            //         )
            //       ],
            //     );
            //   },
            // ),
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
                  return ListView.builder(    //outer builder
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: users.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 13.0,right: 13.0),
                              child: Row(
                                children: [
                                  //users[index].products![0].image.toString() != null?
                                  Container(
                                    height: 40,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                      users[index].products![0].image.toString()
                                    ))),
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
                            ),
                            // const SizedBox(
                            //   height: 1.0,
                            // ),
                            users[index].products!.length > 0 ?
                            SizedBox(
                              height: MediaQuery.of(context).size.height*0.25,
                              child: ListView.builder(    //inner builder
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true, // 1st add
                                  physics:
                                      const ClampingScrollPhysics(), // 2nd add
                                  itemCount:
                                      users[index].products!.length,
                                  itemBuilder:
                                      (BuildContext ctx, rdx) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,  MaterialPageRoute(
                                            builder: (_) => BlocProvider(
                                                create: (BuildContext context) =>
                                                    CategoryCubit(repository: _repository),
                                                child: ProductDetailScreen(
                                                  img: users[index].products![rdx].image.toString(),
                                                  price: users[index].products![rdx].breakingPrices![0].price,
                                                  description:users[index].products![rdx].description ,
                                                  name: users[index].products![rdx].name,
                                                  id: users[index].products![rdx].id,
                                                  // form: args.toString(),
                                                ))));
                                        /*
                                                ProductDetailScreen(
                                                  name: users[2]
                                                      .products![0]
                                                      .name
                                                      .toString(),
                                                  price: users[2]
                                                      .products![0]
                                                      .breakingPrices![
                                                          0]
                                                      .price
                                                      .toString(),
                                                  description: users[2]
                                                      .products![0]
                                                      .description
                                                      .toString(),
                                                  img: users[2]
                                                      .products![0]
                                                      .image
                                                      .toString(),
                                                )));
                                    */
                                      },
                                      child: MyProductContainerg(
                                        img: users[index]
                                            .products![rdx]
                                            .image
                                            .toString(),
                                        txt: users[index].products![rdx].name,
                                        price:
                                            "${getTranslated(context, 'price').toString()}: ${users[index].products![rdx].id}",
                                      ),
                                    );
                                  }),
                            )
                                : const SizedBox(child: Center(child: AutoSizeText("No Product Found"),),),
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
      _userSearchList = await _list
          .where((element) =>
              element.uniqname!.toLowerCase().startsWith(text.toLowerCase()))
          .toList();
    }
    setState(() {});
  }
}
