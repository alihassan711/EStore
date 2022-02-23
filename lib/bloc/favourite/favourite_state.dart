import 'package:equatable/equatable.dart';
import 'package:estore/model/favourite_model.dart';

abstract class FavouriteState extends Equatable {}

class InitialState extends FavouriteState {
  @override
  List<FavouriteModel> get props => [];
}

class LoadingState extends FavouriteState {
  @override
  List<Object> get props => [];
}

class LoadedState extends FavouriteState {
  LoadedState(
    this.order,
  );

  final List<FavouriteModel> order;

  @override
  List<Object> get props => [order];
}

class ErrorState extends FavouriteState {
  @override
  List<Object> get props => [];
}
