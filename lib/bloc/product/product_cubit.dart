// import 'package:estore/bloc/product/product_state.dart';
// import 'package:estore/services/apis_services.dart';
// import 'package:bloc/bloc.dart';
//
//
// class ProductCubit extends Cubit<ProductState> {
//   ProductCubit({required this.repository}) : super(InitialState()) {
//     getOffer();
//   }
//   final ApiServices repository;
//   getOffer() async {
//     final order = await repository.getAllProducts();
//     emit(LoadedState(order));
//   }
// }