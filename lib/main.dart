import 'package:estore/localization/demo_localization.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/screens/walkthrough/intro_screens.dart';
import 'package:estore/services/apis_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bloc/category/category_cubit.dart';
import 'localization/language_constants.dart';

var token,firstName,lastName,email,password,phone;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
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
    // SharedPreferences.setMockInitialValues({});
    getPref();
    super.initState();
  }
  ThemeMode _themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: _locale == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : MaterialApp(
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
                    if (supportedLocale.languageCode == locale!.languageCode &&
                        supportedLocale.countryCode == locale.countryCode) {
                      return supportedLocale;
                    }
                  }
                  return supportedLocales.first;
                },
                home: email == null? IntroScreen(): BlocProvider(
                    create: (BuildContext context) =>
                        CategoryCubit(repository: _repository),
                    child:  MainScreen(index: 0,
                      // form: args.toString(),
                    ))
              ));
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  void getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    token = prefs.getString('token');
    firstName = prefs.getString('firstName');
    lastName = prefs.getString('lastName');
    password = prefs.getString('password');
    phone = prefs.getString('phone');
    print("email is in my app ====>  ${email}");
    print("token is in my app ====>  ${token}");
    print("firstName is in my app ====>  ${firstName}");
    print("lastName is in my app ====>  ${lastName}");
    print("password is in my app ====>  ${password}");
    print("phone is in my app ====>  ${phone}");
  }
}
