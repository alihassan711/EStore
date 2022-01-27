import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/widgets/history_card.dart';
import 'package:flutter/material.dart';
class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({Key? key}) : super(key: key);
  @override
  _PurchaseHistoryState createState() => _PurchaseHistoryState();
}

class _PurchaseHistoryState extends State<PurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: AutoSizeText("Purchase History",style: kBold(kIconColorRed,20.0),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 12,
                itemBuilder: (BuildContext context, index){
                  return const HistoryCard();
                }
            ),
          )
        ],
      ),
    );
  }
}
