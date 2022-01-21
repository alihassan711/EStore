import 'dart:async';
import 'package:estore/constants/image_path.dart';
import 'package:estore/screens/dashboard/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  Timer? timer;
  bool? flag = false;
  String? userName = "";

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
        padding: EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Bushra Ansari"),
            accountEmail: Row(
              children: const [
                Text("bushra@xyz.com"),
                // Switch(value: attendence, onChanged: (value) {setState(){
                //   attendence =value;
                // }}),
              ],
            ),
            currentAccountPicture: CircleAvatar(
                radius: 50,
                backgroundImage: ExactAssetImage(ImagesPath.accountPicture),),
          ),
          ListTile(
            title:const Text("Orders"),
            leading:const Icon(Icons.shopping_cart),
            onTap: () => Navigator.pop(context),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: Text("Notification"),
            leading: Icon(Icons.notifications_active_outlined),
            onTap: () => Navigator.pushNamed(context, '/Dashboard'),
            //    onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: Text("History"),
            leading: Icon(Icons.info),
            onTap: () => Navigator.pushNamed(context, '/Notification'),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          const ListTile(
            title: Text("Application Preferences"),
          ),
          ListTile(
            title: Text("Help/Support"),
            leading: Icon(Icons.help),
            onTap: () => Navigator.pushNamed(context, '/LocationPage'),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings),
            //  onTap: () => Navigator.pushNamed(context, '/Settings'),
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) =>HomeScreen())),
          ),
          ListTile(
            title: Text("Language"),
            leading: Icon(Icons.language),
            onTap: () => Navigator.pushNamed(context, '/Help'),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
            title: const Text("Dark Mode"),
            leading: Icon(Icons.track_changes),
            onTap: () => Navigator.pushNamed(context, '/Help'),
            //   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
          ),
          ListTile(
              title: const Text("SignOut"),
              leading: Icon(Icons.logout),
              onTap: ()
              async {
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
