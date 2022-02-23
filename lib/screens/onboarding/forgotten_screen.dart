import 'dart:async';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity/connectivity.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/model/language.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/screens/onboarding/sign_in_screen.dart';
import 'package:estore/screens/onboarding/sign_up_screen.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
 // bool? _passwordVisible = false;
  bool? loading = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
 // TextEditingController password = TextEditingController();
  ApiServices _repository = ApiServices();

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  ApiServices apiServices = ApiServices();

  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  ApiServices _apiServices = ApiServices();

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    setState(() {
      loading = false;
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // final GetXNetworkManager _networkManager = Get.find<GetXNetworkManager>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromRGBO(59, 105, 120, 1.0),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: whiteColor,
              ),
              onChanged: (Language? language) {
                _changeLanguage(language!);
                print(language.name);
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        e.flag,
                        style: const TextStyle(fontSize: 30.0),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ),
        ],
      ),
      body:
      // _networkManager.connectionType == 0 ? const NoInternetWidget()
      //     :
      Form(
        key: _key,
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                    clipper: WaveClipper2(),
                    child: Container(
                      child: Column(),
                      width: MediaQuery.of(context).size.width,
                      height: 260,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(132, 169, 172, 1.0)),
                    )),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 35,
                        ),
                        const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 60.0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          getTranslated(context, "shop_here").toString(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 30.0),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(59, 105, 120, 1.0)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextFormField(
                controller: email,
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                validator: (val) {
                  if (val!.isEmpty) {
                    return getTranslated(context, "required_email");
                  }
                  if (!RegExp(email_RegExp).hasMatch(val)) {
                    return getTranslated(context, "valid_email");
                  }
                  return null;
                },
                style: kNormalBlack(kBlackLight),
                decoration: InputDecoration(
                  hintStyle: kNormalBlack(kBlackLight),
                  enabledBorder: border(),
                  focusedBorder: focusBorder(),
                  border: border(),
                  errorBorder: errorBorder(),
                  hintText: getTranslated(context, "email").toString(),
                  prefixIcon: const Icon(
                    Icons.email,
                    size: 20,
                    color: Color.fromRGBO(32, 64, 81, 1.0),
                  ),
                  //border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 13.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            loading == false
                ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromRGBO(32, 64, 81, 1.0),
                  ),
                  child: TextButton(
                    child: Text(
                      getTranslated(context, "sign_in").toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18.0),
                    ),
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        await AuthServices.resetPassword(
                          email: email.text,
                        ).then((value) {
                          if (value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignInScreen(
                                      // form: args.toString(),
                                    )));
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                backgroundColor: kIconColorRed,
                                content: Text(
                                  "Invalid email",
                                  style: TextStyle(color: whiteColor),
                                )));
                            setState(() {
                              loading = false;
                            });
                          }
                        });
                      }
                      setState(() {
                        loading = false;
                      });
                    },
                  ),
                ))
                : Center(child: CircularProgressIndicator()),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        setState(() => _connectionStatus = result.toString());
        print(_connectionStatus);
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.49, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
