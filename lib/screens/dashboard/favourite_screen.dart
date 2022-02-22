import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/bloc/category/category_state.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/model/favourite_model.dart';
import 'package:estore/widgets/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/apis_services.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);
  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  int itemPrice = 0;
  int totalItems = 0;
  double? subTotal = 0;
  double? disCount = 0;
  double? deliveryCharges = 0;
  double? orderTotal = 0;
ApiServices _apiServices =ApiServices();
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CategoryCubit>(context).getCategories();
    return BlocBuilder<CategoryCubit, CategoryState>(
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
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, bottom: 5.0, right: 10.0, left: 10.0),
                    child: FavouriteCard(
                      img: users[index].productData!.image.toString(),
                      itemPrice: users[index].productData!.breakingPrices![0].price,
                      titleText: users[index].productData!.name.toString(),
                      brandName: users[index].productData!.breakingPrices![0].shopName.toString(),
                      onPress: (){
                        ApiServices.removeFavouriteProduct(
                            productId: users[index].productId).then((value) {
                          if (value) {
                            _apiServices.successToast("Product removed from favourite");
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                _apiServices.failToast("Failed to removed from favourite"));
                          }
                        });
                      },
                      //onPress: ,
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
    );
  }
}
