import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/screens/dashboard/drawer/history_screen.dart';
import 'package:estore/screens/dashboard/drawer/notification_screen.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/widgets/my_container.dart';
import 'package:flutter/material.dart';

import 'chat_screens/conversation_page.dart';
import 'drawer/my_order_screen.dart';
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
            circularSize: 10.0,
            txtColor: whiteColor,
            btnWidth: 175,
            btnHeight: 40,
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
            padding: const EdgeInsets.only(left: 12.0,right: 12.0,top: 10,bottom: 10),
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
                      blurRadius: 1.0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => const MyOrderScreen()));
                       },
                      child: MyProfileContainer(
                        txt: "Order",
                        icon: const Icon(Icons.list,size:28,color:kIconColorRed ,),
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
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => const ConversationPage()));
                        print("Message");},
                      child: MyProfileContainer(
                        txt: "Message",
                        icon:const Icon(Icons.message,size:28,color: kIconColorGreen,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
         // SizedBox(height: 12,),
           ListTile(
             onTap: (){
               Navigator.push(context,
                   MaterialPageRoute(builder: (ctx) => const NotificationScreen()));
             },
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
             onTap: (){
               Navigator.push(context,
                   MaterialPageRoute(builder: (ctx) => const PurchaseHistory()));
             },
          ),
        ],
      ),
    );
  }
}
