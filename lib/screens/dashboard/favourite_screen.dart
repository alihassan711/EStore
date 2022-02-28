import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/bloc/category/category_state.dart';
import 'package:estore/model/favourite_model.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/screens/dashboard/products/product_detail_screen.dart';
import 'package:estore/widgets/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:estore/widgets/shoping_cart.dart';
import 'package:estore/screens/components/my_drawer.dart';
import '../../constants/color.dart';
import '../../constants/image_path.dart';
import '../../constants/strings.dart';
import '../../localization/language_constants.dart';
import '../../services/apis_services.dart';
import '../../utils/no_notification.dart';
import '../../widgets/iconbtn.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}
class _FavouriteScreenState extends State<FavouriteScreen> {
  ApiServices _repository = ApiServices();
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
                              CategoryCubit(repository: _repository),
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin,vertical: defaultMargin),
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
              final List<FavouriteModel> users = state.favProduct;
              return users.isEmpty?Column(
                children: [
                  Expanded(child: SizedBox()),
                  Expanded(
                    child: NoNotificationContainer(
                      onPress: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => BlocProvider(
                                    create: (BuildContext context) =>
                                        CategoryCubit(repository: _repository),
                                    child: MainScreen(
                                      index: 0,
                                      // form: args.toString(),
                                    ))));
                      },
                      icon: ImagesPath.favourite,
                      btnText:  getTranslated(context, "continue_shopping").toString(),
                      txt: getTranslated(context, "no_fav_found").toString(),
                    ),
                  ),
                  Expanded(child: SizedBox()),
                ],
              ):
              ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, index) {
                    return users[index].productData!=null?
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0,bottom: 5.0),
                      child: FavouriteCard(
                        onpressCard: (){
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) =>
                          //             BlocProvider(
                          //                 create: (BuildContext
                          //                 context) =>
                          //                     CategoryCubit(
                          //                         repository:
                          //                         _repository),
                          //                 child:
                          //                 ProductDetailScreen(
                          //                   product_model:
                          //                   users[index].productData![0],
                          //                   // form: args.toString(),
                          //                 ))));
                        },
                        img: users[index].productData!.image.toString(),
                        itemPrice:
                            users[index].productData!.breakingPrices![0].price,
                        titleText: users[index].productData!.name.toString(),
                        brandName: users[index]
                            .productData!
                            .breakingPrices![0]
                            .shopName
                            .toString(),
                        onPress: () {
                          ApiServices.removeFavouriteProduct(
                                  productId: users[index].productId)
                              .then((value) {
                            if (value) {
                              BlocProvider.of<CategoryCubit>(context).getCategories();
                              _repository
                                  .successToast("Product removed from favourite");

                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  _repository.failToast(
                                      "Failed to removed from favourite"));
                            }
                          });
                        },
                        //onPress: ,
                      ),
                    ):SizedBox();
                  });
            } else {
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Loading....',
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 20),
                  ),
                  Text(
                    'check your internet connection!....',
                    style: TextStyle(color: Colors.redAccent, fontSize: 10),
                  )
                ],
              ));
            }
          },
          /*
          ListView.builder(
              itemCount: 20,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                  child: FavouriteCard(
                    img: ImagesPath.burger,
                    itemPrice: itemPrice,
                    titleText: "Chickn Burger",
                    brandName: "Mcdonald",
                  ),
                );
              }),

               */
        ),
      ),
    );
  }
}
