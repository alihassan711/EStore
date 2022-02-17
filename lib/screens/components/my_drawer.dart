import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/bloc/orderhistory/order_history_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/dashboard/drawer/help_support_screen.dart';
import 'package:estore/screens/dashboard/drawer/history_screen.dart';
import 'package:estore/screens/dashboard/drawer/language_screen.dart';
import 'package:estore/screens/dashboard/drawer/my_order_screen.dart';
import 'package:estore/screens/dashboard/drawer/notification_screen.dart';
import 'package:estore/screens/dashboard/drawer/settings_screen.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  ApiServices _repository = ApiServices();
  Timer? timer;
  bool? flag = false;
  String? userName = "";
  bool? _isdark = false;
  SharedPreferences? _preferences;
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        _preferences = prefs;
        userName = prefs.getString('email');
        print("name is : $userName");
        // portNoController = TextEditingController(text: prefs.getString('port'));
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: kIconColorGreen,
            ),
            accountName:
                AutoSizeText(globalUserData.userProfile == null? "name" : globalUserData.userProfile!.firstName.toString(), style: kSemiBold(whiteColor)),
            accountEmail: Row(
              children:  [
                AutoSizeText(globalUserData.user == null ? "email" : globalUserData.user!.email.toString()),
                // Switch(value: attendence, onChanged: (value) {setState(){
                //   attendence =value;
                // }}),
              ],
            ),
            currentAccountPicture: CircleAvatar(
              radius: 50,
              backgroundImage: ExactAssetImage(ImagesPath.accountPicture),
            ),
          ),
          ListTile(
              title: AutoSizeText(getTranslated(context, "order").toString(), style: kSemiBold(blackColor)),
              leading: const Icon(Icons.add_shopping_cart),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrderScreen()));
              }
              //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
              ),
          ListTile(
            title: AutoSizeText(getTranslated(context, "notification").toString(), style: kSemiBold(blackColor)),
            leading: const Icon(Icons.notifications_active_outlined),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationScreen())),
            //    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: AutoSizeText(getTranslated(context, "history").toString(), style: kSemiBold(blackColor)),
            leading: const Icon(Icons.history),
            onTap: () =>  Navigator.push(context,  MaterialPageRoute(
                builder: (_) => BlocProvider(
                    create: (BuildContext context) =>
                        OrderHistoryCubit(repository: _repository),
                    child: const PurchaseHistory()))),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: AutoSizeText(getTranslated(context, "application_preferences").toString(),
                style: kBold(blackColor, 16.0)),
          ),
          ListTile(
            title: AutoSizeText(getTranslated(context, "help_support").toString(), style: kSemiBold(blackColor)),
            leading: const Icon(Icons.help_outline),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HelpScreen())),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: AutoSizeText(getTranslated(context, "settings").toString(), style: kSemiBold(blackColor)),
            leading: const Icon(Icons.settings),
            //  onTap: () => Navigator.pushNamed(context, '/Settings'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsScreen())),
          ),
          ListTile(
            title: AutoSizeText(getTranslated(context, "language").toString(), style: kSemiBold(blackColor)),
            leading: const Icon(Icons.language),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LanguageScreen())),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
              title:
                 AutoSizeText(getTranslated(context, "dark_mode").toString(), style: kSemiBold(blackColor)),
              leading: const Icon(Icons.track_changes),
              onTap: () {
                setState(() {
                  _isdark = !_isdark!;
                });
                MyApp.of(context)!
                    .changeTheme(_isdark! ? ThemeMode.dark : ThemeMode.light );
              }
              //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
              ),
          ListTile(
              title: AutoSizeText(getTranslated(context, "sign_out").toString(), style: kSemiBold(blackColor)),
              leading: const Icon(Icons.logout),
              onTap: () async {
                SharedPreferences
                    .getInstance()
                    .then((_pref) {
                  _pref.clear();
                });
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('email');
                prefs.remove('password');
                prefs.remove('token');
                prefs.remove('firstName');
                prefs.remove('phone');
                prefs.remove('lastName');
                prefs.clear();
              }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    ///
    super.dispose();
  }
}
