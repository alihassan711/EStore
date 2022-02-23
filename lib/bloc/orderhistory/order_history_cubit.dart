import 'package:bloc/bloc.dart';
import 'package:estore/bloc/orderhistory/order_history_state.dart';
import 'package:estore/services/apis_services.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit({this.repository}) : super(InitialState()) {
    getOrderHistory();
  }

  final ApiServices? repository;

  getOrderHistory() async {
    final orderHistory = await repository!.getOrderHistory();
    emit(LoadedState(orderHistory));
  }
}
