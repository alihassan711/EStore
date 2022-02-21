import 'package:estore/constants/color.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/onboarding/phone_auth_form.dart';
import 'package:estore/screens/onboarding/sign_up_screen.dart';
import 'package:estore/services/firebase_services.dart';
import 'package:estore/widgets/social_btns.com.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

class SignInButtons extends StatelessWidget {
   SignInButtons({Key? key}) : super(key: key);
final FireBaseServices _fireBaseServices = FireBaseServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  // title: Text('Social Buttons Example'),
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 300,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomWidgets.socialButtonRect(
                getTranslated(context, "facebook_sign_in").toString(), facebookColor, FontAwesomeIcons.facebookF,
                    onTap: () {
                 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PhoneAuthForm()));
                      Fluttertoast.showToast(msg: 'I am facebook',backgroundColor: facebookColor);
                    }),
                SizedBox(height: 14,),
                CustomWidgets.socialButtonRect(
                    getTranslated(context, "google_sign_in").toString(), googleColor, FontAwesomeIcons.googlePlusG,
                    onTap: () {
                     _fireBaseServices.signup(context);
                      Fluttertoast.showToast(msg: 'I am google',backgroundColor: googleColor);
                    }),
                SizedBox(height: 14,),
                CustomWidgets.socialButtonRect(
                    getTranslated(context, "email_sign_in").toString(), linkedinColor, Icons.email,
                    onTap: () {
                      FireBaseServices.signUpWithEmailPassword();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const SignUpScreen()));
                      Fluttertoast.showToast(msg: 'With email and password',backgroundColor: linkedinColor);
                    }),
                SizedBox(height: 14,),
                CustomWidgets.socialButtonRect(
                    getTranslated(context, "apple_sign_in").toString(), githubColor, FontAwesomeIcons.apple,
                    onTap: () {
                      Fluttertoast.showToast(msg: 'I am Apple',backgroundColor: githubColor);
                    }),
                SizedBox(height: 14,),
                CustomWidgets.socialButtonRect(
                    getTranslated(context, "phone_sign_in").toString(), phoneColor, FontAwesomeIcons.phoneAlt,
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PhoneAuthForm()));
                      Fluttertoast.showToast(msg: 'I am Phone',backgroundColor: phoneColor);
                    }),
                SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomWidgets.socialButtonCircle(
                        facebookColor, FontAwesomeIcons.facebookF,
                        iconColor: Colors.white, onTap: () {
                      Fluttertoast.showToast(msg: 'I am circle facebook',backgroundColor: facebookColor);
                    }),
                    CustomWidgets.socialButtonCircle(
                        googleColor, FontAwesomeIcons.googlePlusG,
                        iconColor: Colors.white, onTap: () {
                      _fireBaseServices.signup(context);
                      Fluttertoast.showToast(msg: 'I am circle google',backgroundColor: googleColor);
                    }),
                    CustomWidgets.socialButtonCircle(
                        phoneColor, FontAwesomeIcons.phone,
                        iconColor: Colors.white, onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PhoneAuthForm()));
                      Fluttertoast.showToast(msg: 'I am circle phone',backgroundColor: phoneColor);
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}