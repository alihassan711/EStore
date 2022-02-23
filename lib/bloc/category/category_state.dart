import 'package:equatable/equatable.dart';
import 'package:estore/model/all_categories_model.dart';
import 'package:estore/model/favourite_model.dart';
import 'package:estore/model/notifications_model.dart';

abstract class CategoryState extends Equatable {}

class InitialState extends CategoryState {
  @override
  List<CategoryModel> get props => [];

  List<FavouriteModel> get propss => [];

  List<NotifcationsModel> get propsss => [];
}

class LoadingState extends CategoryState {
  @override
  List<Object> get props => [];

  List<Object> get propss => [];
}

class LoadedState extends CategoryState {
  LoadedState(this.order, this.favProduct, this.notifications);

  final List<CategoryModel> order;
  final List<FavouriteModel> favProduct;
  final List<NotifcationsModel> notifications;

  @override
  List<Object> get props => [order];

  List<Object> get propss => [order];
}

class ErrorState extends CategoryState {
  @override
  List<Object> get props => [];

  List<Object> get propss => [];
}
