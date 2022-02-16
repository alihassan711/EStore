import 'package:equatable/equatable.dart';
import 'package:estore/model/all_categories_model.dart';
import 'package:estore/model/product_model.dart';

abstract class CategoryState extends Equatable {}

class InitialState extends CategoryState {
  @override
  List<CategoryModel> get props => [];
 // List<ProductModel> get propss => [];
}

class LoadingState extends CategoryState {
  @override
  List<Object> get props => [];
  List<Object> get propss => [];
}

class LoadedState extends CategoryState {
  LoadedState(this.order,this.product);

  final List<CategoryModel> order;
  final List<ProductModel> product;

  @override
  List<Object> get props => [order];
  List<Object> get propss => [order];
}

class ErrorState extends CategoryState {
  @override
  List<Object> get props => [];
  List<Object> get propss => [];
}