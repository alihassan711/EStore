import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: CircleAvatar(
            radius: 90,
            backgroundImage: ExactAssetImage("asset/images/nointernet.png"),
          ),
        ),
        SizedBox(
          height: 14,
        ),
        Text(
          "No Internet !!",
          style: TextStyle(fontSize: 14, color: Colors.red),
        ),
      ],
    ));
  }
}
