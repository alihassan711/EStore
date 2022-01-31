import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/widgets/my_container.dart';
import 'package:flutter/material.dart';
class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: ExactAssetImage(ImagesPath.accountPicture),
          ),
          const SizedBox(height: 14,),
          AutoSizeText("Bushra Ansari",style: kBold(blackColor,12.0),),
          const  SizedBox(height: 8,),
          AutoSizeText("bushraansari12@gmail.com",style: kNormalBlack(blackColor),),
          const  SizedBox(height: 14,),
          ElevatedBtn(
            onPress: (){

            },
            text: "Check Balance",
            color: kIconColorGreen,
            btnTxtSize: 12,
            circularSize: 14.0,
            txtColor: whiteColor,
          ),
          const SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("72",style: kBold(blackColor, 14.0),),
                  const SizedBox(height: 5,),
                  Text("In yor cart",style: kNormalBlack(blackColor),),
                ],
              ),
              Column(
                children: [
                  Text("12",style: kBold(blackColor, 14.0),),
                  const SizedBox(height: 5,),
                  Text("In yor wish list",style: kNormalBlack(blackColor),),
                ],
              ),
              Column(
                children: [
                  AutoSizeText("14",style: kBold(blackColor, 14.0),),
                  const SizedBox(height: 5,),
                  AutoSizeText("Ordered",style: kNormalBlack(blackColor),),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0,right: 14.0,top: 12,bottom: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
               // height: 100.0,
                margin: const EdgeInsets.only(bottom: 6.0,top: 6.0), //Same as `blurRadius` i guess
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){print("Order");},
                      child: MyProfileContainer(
                        txt: "Order",
                        icon: const Icon(Icons.list,size:28,color:kIconColorGreen ,),
                      ),
                    ),
                    InkWell(
                      onTap: (){print("Profile");},
                      child: MyProfileContainer(
                        txt: "Profile",
                        icon:const Icon(Icons.person,size:28,color: kIconColorBlue,),
                      ),
                    ),
                    InkWell(
                      onTap: (){print("Address");},
                      child: MyProfileContainer(
                        txt: "Address",
                        icon:const Icon(Icons.location_on,size:28,color: kIconColorYellow,),
                      ),
                    ),
                    InkWell(
                      onTap: (){print("Message");},
                      child: MyProfileContainer(
                        txt: "Message",
                        icon:const Icon(Icons.message,size:28,color: kIconColorRed,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
         // SizedBox(height: 12,),
           ListTile(
            title: AutoSizeText("Notifications",style: kBold(blackColor,12.0),),
            leading: const CircleAvatar(
              radius: 17,
              backgroundColor: kIconColorYellow,
              child: Icon(Icons.notification_important,color: whiteColor,size: 20,),
            ),
          ),
           ListTile(
            title: AutoSizeText("Purchase History",style: kBold(blackColor,12.0),),
            leading: const CircleAvatar(
              radius: 17,
              backgroundColor: kIconColorGreen,
              child: Icon(Icons.ballot,color: whiteColor,size: 20,),
            ),
          ),
        ],
      ),
    );
  }
}
