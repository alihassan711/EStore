import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/services/apis_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/category/category_cubit.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  ApiServices _repository = ApiServices();
  final double height = 100;

  @override
  Widget build(BuildContext context) {
    var textHeading =
        TextStyle(color: kDeepBlue, fontSize: 20); // Text style for the name
    var textStyle =
        const TextStyle(color: kDeepBlue); // Text style for everything else

    double width =
        MediaQuery.of(context).size.width; // calculate the screen width
    return Material(
        child: Container(
      padding: EdgeInsets.only(right: 16),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BlocProvider(
                          create: (BuildContext context) =>
                              CategoryCubit(repository: _repository),
                          child: MainScreen(
                            index: 1,
                            // form: args.toString(),
                          ))));
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
