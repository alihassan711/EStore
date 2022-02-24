import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/bloc/category/category_state.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
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
import '../../utils/urls.dart';
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
                            users[index].products!.isEmpty
                                ? SizedBox()
                                : Row(
                                    children: [
                                      //users[index].products![0].image.toString() != null?
                                      Container(
                                        height: 40,
                                        width: 30,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    Urls.imageBaseUrl+users[index].banner.toString()
                                                        ))),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      users[index].products!.isEmpty
                                          ? SizedBox()
                                          : Container(
                                              child: Text(
                                                  users[index].name.toString(),
                                                  //  getTranslated(context, "featured_product").toString(),
                                                  style:
                                                      kBold(blackColor, 14.0)),
                                            ),
                                    ],
                                  ),

                            users[index].products!.isEmpty
                                ? SizedBox()
                                : SizedBox(
                                    height: 120,
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
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: HomeCategoriesImage(
                                                  img: users[index]
                                                      .products![rdx]
                                                      .image
                                                      .toString(),
                                                ),
                                              ));
                                        }),
                                  ),
                            users[index].products!.isEmpty
                                ? SizedBox()
                                : SizedBox(
                                height: 10
                            ),
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
