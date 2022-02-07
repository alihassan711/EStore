import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/bloc/category/category_cubit.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/model/language.dart';
import 'package:estore/screens/dashboard/home_screen.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/screens/onboarding/signup_btns_screen.dart';
import 'package:estore/services/apis_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../main.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  ApiServices _repository = ApiServices();
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

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
      body: ListView(
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
            child: Material(
              elevation: 2.0,
              borderRadius: const BorderRadius.all(Radius.circular(30.0)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                decoration: InputDecoration(
                  hintText: getTranslated(context, "email").toString(),
                  prefixIcon: const Material(
                    elevation: 0,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    child: Icon(
                      Icons.email,
                      color: Color.fromRGBO(32, 64, 81, 1.0),
                    ),
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 13.0),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
              child: TextField(
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                decoration: InputDecoration(
                    hintText: getTranslated(context, "password").toString(),
                    prefixIcon: const Material(
                      elevation: 0,
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      child: Icon(
                        Icons.lock,
                        color: Color.fromRGBO(32, 64, 81, 1.0),
                      ),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 13.0)),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
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
                  onPressed: () {
                    Navigator.pushReplacement(context,  MaterialPageRoute(
                        builder: (_) => BlocProvider(
                            create: (BuildContext context) =>
                                CategoryCubit(repository: _repository),
                            child: const MainScreen(
                              // form: args.toString(),
                            ))))
                   ;
                  },
                ),
              )),
          const SizedBox(height: 5),
          Center(
            child: Container(
              child: TextButton(
                child: Text(
                  getTranslated(context, "forget_password").toString(),
                  style: const TextStyle(
                    color: kIconColorRed,
                  ),
                ),
                //  textColor: Colors.white,
                onPressed: () {},
              ),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          TextButton(
              onPressed:() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  SignInButtons()));
              },
              child: AutoSizeText(
                getTranslated(context, "create_newAccount").toString(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.normal),
              ),
          ),
          // InkWell(
          //   onTap: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => const SignInButtons()));
          //   },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Text(
          //         getTranslated(context, "create_newAccount").toString(),
          //         style: const TextStyle(
          //             color: Colors.black,
          //             fontSize: 12,
          //             fontWeight: FontWeight.normal),
          //       ),
          //       Text(getTranslated(context, "sign_up").toString(),
          //           style: const TextStyle(
          //               color: Color.fromRGBO(32, 64, 81, 1.0),
          //               fontWeight: FontWeight.w500,
          //               fontSize: 12,
          //               decoration: TextDecoration.underline)),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
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
