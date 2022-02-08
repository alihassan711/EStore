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
import 'package:estore/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            // const SizedBox(
            //   height: 8,
            // ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: AutoSizeText(
                  getTranslated(context, "featured_categories").toString(),
                  style: kBold(blackColor, 14.0)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 165,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: BlocBuilder<CategoryCubit, CategoryState>(
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
                    final List users = state.order;
                    return ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: users.length,
                        itemBuilder: (BuildContext context, index) {
                          return MyProductContainer(
                            txt: users[index].name.toString(),
                            id: users[index].id.toString(),
                            // "Jewelery &\n Watches",
                            img: ImagesPath.jewelery,
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
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 10),
                        )
                      ],
                    ));
                  }
                },
              ),
              /*
              ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryData.length,
                  itemBuilder: (BuildContext context, index) {
                    return MyProductContainer(
                      txt: categoryData[index].name.toString(),
                     id: categoryData[index].id.toString(),
                     // "Jewelery &\n Watches",
                      img: ImagesPath.jewelery,
                    );
                  }),
              */
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Text(getTranslated(context, "featured_product").toString(),
                  style: kBold(blackColor, 14.0)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(12)),
              child: BlocBuilder<CategoryCubit, CategoryState>(
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
                    final List users = state.product;
                    return GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height * 0.94),
                        ),
                        itemCount: users.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           ProductDetailScreen(name: users[index].name.toString(),price: users[index].price.toString(),description:users[index].description.toString(),)));
                            },
                            child: MyProductContainerg(
                              // txt:snapshot.data.name,
                              //"Categories",
                              img:ImagesPath.watch,
                              //users[index].image.toString(),
                              txt: users[index].name.toString(),
                              price: "${getTranslated(context, 'price').toString()}: ${users[index].price.toString()}",
                              // price: snapshot.data.price,
                            ),
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
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 10),
                        )
                      ],
                    ));
                  }
                },
              ),
              /*
              ListView.builder(
                  shrinkWrap: true,
                  // physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryData.length,
                  itemBuilder: (BuildContext context, index) {
                    return MyProductContainer(
                      txt: categoryData[index].name.toString(),
                     id: categoryData[index].id.toString(),
                     // "Jewelery &\n Watches",
                      img: ImagesPath.jewelery,
                    );
                  }),
              */
            ),
            /*
            Container(
              // height: MediaQuery.of(context).size.height*0.35,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: FutureBuilder(
                future: _apiServices.getAllProducts(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    if(snapshot.hasData){
                return
                  GridView.builder(
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
                        txt: "pacific_cube",
                       // price: snapshot.data.price,
                      );
                    });}
    //print(snapshot.data[0]['ret_view_array']['products']['id']);
                return const CircularProgressIndicator();
                }
              ),
            ),
            */
          ],
        ),
      ),
    );
  }
  // List<CategoryModel> categoryData = [];
  //
  // void fetch_category_products() async {
  //   try {
  //     setState(() {
  //       //isLoading = true;
  //     });
  //     categoryData = await _apiServices.getAllCategories();
  //     print("Category Data===> ${categoryData[0].id}");
  //   } finally {
  //     setState(() {
  //      // isLoading = false;
  //     });
  //   }
  // }
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
