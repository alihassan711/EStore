import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height = 100;
  @override
  Widget build(BuildContext context) {
    var textHeading =
        TextStyle(color: kDeepBlue, fontSize: 20); // Text style for the name
    var textStyle =
        TextStyle(color: kDeepBlue); // Text style for everything else

    double width =
        MediaQuery.of(context).size.width; // calculate the screen width
    return Material(
        child: Container(
      padding: EdgeInsets.only(right: 16),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainScreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          CircleAvatar(
            backgroundImage: ExactAssetImage(ImagesPath.accountPicture),
            maxRadius: 20,
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(
                  "Muhammad Asif",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "Online",
                  style: TextStyle(color: kIconColorYellow, fontSize: 13),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.settings,
            color: Colors.black54,
          ),
        ],
      ),
    ));
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
