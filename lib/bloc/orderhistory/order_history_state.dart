import 'package:equatable/equatable.dart';
import 'package:estore/model/order_history_model.dart';

abstract class OrderHistoryState extends Equatable {}

class InitialState extends OrderHistoryState {
  @override
  List<OrderHistoryModel> get props => [];
}

class LoadingState extends OrderHistoryState {
  @override
  List<Object> get props => [];
}

class LoadedState extends OrderHistoryState {
  LoadedState(
    this.order,
  );

  final List<OrderHistoryModel> order;

  @override
  List<Object> get props => [order];
}

class ErrorState extends OrderHistoryState {
  @override
  List<Object> get props => [];
}
