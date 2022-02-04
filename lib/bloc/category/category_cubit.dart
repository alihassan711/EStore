// import 'package:estore/services/apis_services.dart';
// import 'package:bloc/bloc.dart';
//
// import 'category_state.dart';
//
//
// class CategoryCubit extends Cubit<CategoryState> {
//   CategoryCubit({required this.repository}) : super(InitialState()) {
//     getOffer();
//   }
//   final ApiServices repository;
//   getOffer() async {
//     final order = await repository.getOffer();
//     emit(LoadedState(order));
//   }
// //