import 'package:estore/constants/image_path.dart';
import 'package:flutter/material.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: ExactAssetImage(ImagesPath.nointernet))),
      // Column(mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Center(
      //       child: CircleAvatar(
      //         radius: 90,
      //         backgroundImage: ExactAssetImage(ImagesPath.nointernet),
      //       ),
      //     ),
      //     SizedBox(height: 14,),
      //     AutoSizeText("No Internet !!",style: TextStyle(
      //         fontSize: 14,color: Colors.red
      //     ),),
      //   ],
      // ),
    ));
  }
}
