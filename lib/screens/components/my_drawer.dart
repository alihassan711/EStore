import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/screens/dashboard/drawer/history_screen.dart';
import 'package:estore/screens/dashboard/drawer/language_screen.dart';
import 'package:estore/screens/dashboard/drawer/my_order_screen.dart';
import 'package:estore/screens/dashboard/drawer/notification_screen.dart';
import 'package:estore/screens/dashboard/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
          SizedBox(
            height: 200,
            child: UserAccountsDrawerHeader(
              accountName:
                  AutoSizeText("Bushra Ansari", style: kSemiBold(whiteColor)),
              accountEmail: Row(
                children: const [
                  AutoSizeText("bushra@xyz.com"),
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
          ),
          ListTile(
              title: AutoSizeText("Orders", style: kSemiBold(blackColor)),
              leading: const Icon(Icons.add_shopping_cart),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyOrderScreen()));
              }
              //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
              ),
          ListTile(
            title: AutoSizeText("Notification", style: kSemiBold(blackColor)),
            leading: const Icon(Icons.notifications_active_outlined),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => NotificationScreen())),
            //    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: AutoSizeText("History", style: kSemiBold(blackColor)),
            leading: const Icon(Icons.history),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => PurchaseHistory())),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: AutoSizeText("Application Preferences",
                style: kBold(blackColor, 16.0)),
          ),
          ListTile(
            title: AutoSizeText("Help/Support", style: kSemiBold(blackColor)),
            leading: const Icon(Icons.help_outline),
            onTap: () => Navigator.pushNamed(context, '/LocationPage'),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: AutoSizeText("Settings", style: kSemiBold(blackColor)),
            leading: const Icon(Icons.settings),
            //  onTap: () => Navigator.pushNamed(context, '/Settings'),
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => SettingsScreen())),
          ),
          ListTile(
            title: AutoSizeText("Language", style: kSemiBold(blackColor)),
            leading: const Icon(Icons.language),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LanguageScreen())),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
              title: AutoSizeText("Dark Mode", style: kSemiBold(blackColor)),
              leading: const Icon(Icons.track_changes),
              onTap: () {
                setState(() {
                  _isdark = !_isdark!;
                });
                MyApp.of(context)!
                    .changeTheme(_isdark! ? ThemeMode.light : ThemeMode.dark);
              }
              //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
              ),
          ListTile(
              title: AutoSizeText("SignOut", style: kSemiBold(blackColor)),
              leading: const Icon(Icons.logout),
              onTap: () async {
                // SharedPreferences prefs = await SharedPreferences.getInstance();
                // prefs.remove('email');
                // prefs.remove('password');
                // prefs.clear();
                // ProgressDialog pd = ProgressDialog(context: context);
                // pd.show(
                //     max: 100,
                //     msg: 'Logging  Out...',
                //    // progressType: ProgressType.valuable,
                //     backgroundColor: Colors.white,
                //     progressValueColor: Theme.of(context).primaryColor,
                //     progressBgColor: Colors.white70,
                //     msgColor: Theme.of(context).primaryColor,
                //     valueColor: Colors.white);
                //
                // await Future.delayed(const Duration(milliseconds: 3500), () {});
                // //exit(0);
                // pd.close();
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) {
                //       return SignIn();
                //     }));
              })
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
