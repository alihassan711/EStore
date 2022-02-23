import 'package:bloc/bloc.dart';
import 'package:estore/services/apis_services.dart';

import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit({this.repository}) : super(InitialState()) {
    getCategories();
  }

  final ApiServices? repository;

  getCategories() async {
    final category = await repository!.getAllCategories();
    final product = await repository!.getFavouriteProducts();
    final notifications = await repository!.getNotifications();
    emit(LoadedState(category, product, notifications));
  }
}
