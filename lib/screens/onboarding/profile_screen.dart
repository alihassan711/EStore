import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/bloc/orderhistory/order_history_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/dashboard/drawer/history_screen.dart';
import 'package:estore/screens/onboarding/edit_profile.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/utils/urls.dart';
import 'package:estore/widgets/my_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/category/category_cubit.dart';
import '../dashboard/main_page.dart';
class UserProfile extends StatefulWidget {
   UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  ApiServices _repository = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //globalUserData.userProfile== null ||
          //     globalUserData.userProfile!.avatar.toString() == null?
          // CircleAvatar(
          //   radius: 50,
          //   backgroundImage: ExactAssetImage(ImagesPath.accountPicture),
          // ):
          CircleAvatar(
            radius: 50,
            backgroundImage: ExactAssetImage(ImagesPath.accountPicture),
          ),
          const SizedBox(height: 14,),
          AutoSizeText(globalUserData.userProfile == null? "name" : globalUserData.userProfile!.firstName.toString(),style: kBold(blackColor,12.0),),
          const  SizedBox(height: 8,),
          AutoSizeText(globalUserData.user == null ? "email" : globalUserData.user!.email.toString()),
          const  SizedBox(height: 14,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                  border:Border.all(color: kGrey),
                ),
                child: ElevatedBtn(
                  onPress: (){
                    print("image data ===> ${globalUserData.userProfile!.avatar.toString()}");
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfile( user: globalUserData,
                        callback: () {
                          setState(() {});
                        })));
                  },
                  text: getTranslated(context, "edit_profile").toString(),
                  color: whiteColor,
                  btnTxtSize: 12,
                  circularSize: 10.0,
                  txtColor: blackColor,
                  btnWidth: 150,
                  btnHeight: 40,
                ),
              ),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BlocProvider(
                              create: (BuildContext context) =>
                                  CategoryCubit(
                                      repository: _repository),
                              child: MainScreen(
                                index: 2,
                                // form: args.toString(),
                              ))));
                },
                child: Container(
                  height: 40,width: 60,
                  decoration: BoxDecoration(color: whiteColor,borderRadius: BorderRadius.circular(8.0),
                    border:Border.all(color: kGrey),
                  ),
                  child: Icon(Icons.favorite,color: kGrey,),),
              )
            ],
          ),
          const SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(cart.cartItem.length.toString(),style: kBold(blackColor, 14.0),),
                  const SizedBox(height: 5,),
                  Text(getTranslated(context, "in_your_cart").toString(),style: kNormalBlack(blackColor),),
                ],
              ),
              Column(
                children: [
                  Text(globalFavouriteModel.length.toString(),style: kBold(blackColor, 14.0),),
                  const SizedBox(height: 5,),
                  Text(getTranslated(context, "in_your_wish_list").toString(),style: kNormalBlack(blackColor),),
                ],
              ),
              Column(
                children: [
                  AutoSizeText(globalHistoryModel.length.toString(),style: kBold(blackColor, 14.0),),
                  const SizedBox(height: 5,),
                  AutoSizeText(getTranslated(context, "ordered").toString(),style: kNormalBlack(blackColor),),
                ],
              ),
            ],
          ),
          ClipRRect(
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
                      Navigator.push(context,  MaterialPageRoute(
                          builder: (_) => BlocProvider(
                              create: (BuildContext context) =>
                                  OrderHistoryCubit(repository: _repository),
                              child: const PurchaseHistory())));
                     },
                    child: MyProfileContainer(
                      txt:getTranslated(context, "order").toString(),
                      icon: const Icon(Icons.list,size:28,color:kIconColorRed ,),
                    ),
                  ),
                  InkWell(
                    onTap: (){print("Profile");},
                    child: MyProfileContainer(
                      txt:getTranslated(context, "profile").toString(),
                      icon:const Icon(Icons.person,size:28,color: kIconColorBlue,),
                    ),
                  ),
                  InkWell(
                    onTap: (){print("Address");},
                    child: MyProfileContainer(
                      txt: getTranslated(context, "address").toString(),
                      icon:const Icon(Icons.location_on,size:28,color: kIconColorYellow,),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider(
                                  create: (BuildContext context) =>
                                      CategoryCubit(
                                          repository: _repository),
                                  child: MainScreen(
                                    index: 1,
                                    // form: args.toString(),
                                  ))));
                      print("Message");},
                    child: MyProfileContainer(
                      txt: getTranslated(context, "notification").toString(),
                      icon:const Icon(Icons.notification_important,size:28,color: kIconColorGreen,),
                    ),
                  ),
                ],
              ),
            ),
          ),
         // SizedBox(height: 12,),
           ListTile(
             onTap: (){
               Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(
                       builder: (_) => BlocProvider(
                           create: (BuildContext context) =>
                               CategoryCubit(
                                   repository: _repository),
                           child: MainScreen(
                             index: 1,
                             // form: args.toString(),
                           ))));
             },
            title: AutoSizeText(getTranslated(context, "notification").toString(),style: kBold(blackColor,12.0),),
            leading: const CircleAvatar(
              radius: 17,
              backgroundColor: kIconColorYellow,
              child: Icon(Icons.notification_important,color: whiteColor,size: 20,),
            ),
          ),
           ListTile(
            title: AutoSizeText(getTranslated(context, "purchase_history").toString(),style: kBold(blackColor,12.0),),
            leading: const CircleAvatar(
              radius: 17,
              backgroundColor: kIconColorGreen,
              child: Icon(Icons.ballot,color: whiteColor,size: 20,),
            ),
             onTap: (){
               Navigator.pushReplacement(context,  MaterialPageRoute(
                   builder: (_) => BlocProvider(
                       create: (BuildContext context) =>
                           OrderHistoryCubit(repository: _repository),
                       child: const PurchaseHistory())));
             },
          ),
        ],
      ),
    );
  }
}