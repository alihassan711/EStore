//
//
// import 'package:equatable/equatable.dart';
//
// abstract class CategoryState extends Equatable {}
//
// class InitialState extends CategoryState {
//   @override
//   List<Offer> get props => [];
// }
//
// class LoadingState extends CategoryState {
//   @override
//   List<Object> get props => [];
// }
//
// class LoadedState extends CategoryState {
//   LoadedState(this.order);
//
//   final List<Offer> order;
//
//   @override
//   List<Object> get props => [order];
// }
//
// class ErrorState extends CategoryState {
//   @override
//   List<Object> get props => [];
// }