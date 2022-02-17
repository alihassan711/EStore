import 'package:estore/bloc/favourite/favourite_state.dart';
import 'package:estore/services/apis_services.dart';
import 'package:bloc/bloc.dart';


class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit({this.repository}) : super(InitialState()) {
    getFavouriteProduct();
  }

  final ApiServices? repository;
  getFavouriteProduct() async {
    final orderHistory = await repository!.getFavouriteProducts();
    emit(LoadedState(orderHistory));
  }
}