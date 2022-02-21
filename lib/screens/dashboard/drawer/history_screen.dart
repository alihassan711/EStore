import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/bloc/orderhistory/order_history_cubit.dart';
import 'package:estore/bloc/orderhistory/order_history_state.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/model/order_history_model.dart';
import 'package:estore/widgets/history_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({Key? key}) : super(key: key);
  @override
  _PurchaseHistoryState createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<OrderHistoryCubit>(context).getOrderHistory();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: AutoSizeText(
          getTranslated(context, "purchase_history").toString(),
          style: kBold(kIconColorRed, 20.0),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: BlocBuilder<OrderHistoryCubit, OrderHistoryState>(
        builder: (context, state) {
          if (state is InitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadingState) {
            return const Center(
              child: Text("Loading..."),
            );
          } else if (state is ErrorState) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else if (state is LoadedState) {
            final List<OrderHistoryModel> users = state.order;
            return ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, index) {
                  String date =  users[index].createdAt.toString();
                  final dateList = date.split(" ");
                  final createddate = dateList[0];
                  print("split " + dateList[0]);
                  return  HistoryCard(
                    name: users[index].customerName.toString(),
                    price: users[index].totalAmount.toString(),
                    createddate: createddate.toString(),
                  );
                });
          } else {
            return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Loading....',
                      style: TextStyle(
                          fontWeight: FontWeight.w100, fontSize: 20),
                    ),
                    Text(
                      'check your internet connection!....',
                      style: TextStyle(color: Colors.redAccent, fontSize: 10),
                    )
                  ],
                ));
          }
        },
      ),
    );
  }
}
