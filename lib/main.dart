import 'dart:io';

import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/localization/demo_localization.dart';
import 'package:estore/provider/cart.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/screens/walkthrough/intro_screens.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/services/auth_services.dart';
import 'package:estore/utils/urls.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'localization/language_constants.dart';

String UserToken = "";
String deviceToken = "";

void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() async {
  _enablePlatformOverrideForDesktop();
  // FlutterNativeSplash.removeAfter(initialization);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  FirebaseMessaging.instance.getToken().then((value) {
    deviceToken = value.toString();
  });
  var initializationSettingsAndroid =
      AndroidInitializationSettings('flutter_devs');
  var initializationSettingsIOs = IOSInitializationSettings();
  var initSetttings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

  FlutterLocalNotificationsPlugin()
      .initialize(initSetttings, onSelectNotification: onSelectNotification);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(ChangeNotifierProvider(
    create: (context) => Cart(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  ApiServices _repository = ApiServices();
  Locale? _locale;
  var email;
  bool _loader = true;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    getPref();
    super.initState();
  }

  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return _loader
        ? Container()
        : OverlaySupport.global(
            child: _locale == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : MaterialApp(
                    //initialBinding:  NetworkBinding(),
                    debugShowCheckedModeBanner: false,
                    theme: ThemeData(),
                    darkTheme: ThemeData.dark(),
                    themeMode: _themeMode,
                    title: "Flutter Localization Demo",
                    locale: _locale,
                    supportedLocales: const [
                      Locale("en", "US"),
                      Locale("ur", "PK"),
                      Locale("ar", "SA"),
                    ],
                    localizationsDelegates: const [
                      DemoLocalization.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (var supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode ==
                                locale!.languageCode &&
                            supportedLocale.countryCode == locale.countryCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    home: UserToken.isEmpty || UserToken == ""
                        ? IntroScreen()
                        : BlocProvider(
                            create: (BuildContext context) =>
                                CategoryCubit(repository: _repository),
                            child: MainScreen(
                              index: 0,
                              // form: args.toString(),
                            ))));
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  void getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserToken = prefs.getString('token') ?? "";
    print("user token is: $UserToken");
    print("device token is: $deviceToken");
    if (UserToken.isNotEmpty || UserToken != "") {
      AuthServices.getUserProfile(UserToken);
    }

    setState(() {
      _loader = false;
    });
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.data}');

  showNotification(message.data["timetable_id"], message.data["course"],
      message.data["message"]);
}

showNotification(String timetable_id, String course, String message) async {
  var android = AndroidNotificationDetails('id', 'channel ',
      priority: Priority.high, importance: Importance.max);
  var iOS = IOSNotificationDetails();
  var platform = new NotificationDetails(android: android, iOS: iOS);
  await FlutterLocalNotificationsPlugin()
      .show(0, '$course', '$message', platform, payload: '$timetable_id');
}

void onSelectNotification(String? payload) {
  print("navigate to notification page");
}
