import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:overlay_support/overlay_support.dart';

class FireBaseServices{
  static var user_not_found = "user-not-found";
  static var wrong_password = "wrong-password";
  static var user_not_found_c = "User Not Found";
  static var wrong_password_c = "Wrong Password";
  static var email_already_used = "email-already-in-use";
  static var email_already_used_c = "Email all ready in used";
  static var no_net = "network-request-failed";
  static var no_net_c = "network-request-failed";

  static FirebaseAuth auth = FirebaseAuth.instance;
  static var stamp = Timestamp.now();
  static Future<Map<String, dynamic>?> signUpWithEmailPassword() async {
    try {
      late Map<String, dynamic> data;
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: "email@xyz.com", password: "password")
          .then((user) async {
        await FirebaseFirestore.instance
            .collection("User")
            .doc(user.user!.uid)
            .get()
            .then((value) {
          //  print("***${value.data()}");
          // print("run Time type :  ${value.data().runtimeType}");
          data = value.data()!;
          return value.data();
        });
        return data;
      });
      return data;
    } on FirebaseAuthException catch (e) {
      // print("E code     = ==== ${e.code}");
      showSimpleNotification(
        e.code == user_not_found
            ? Text(
          user_not_found_c,
          style: kBold(whiteColor, 14.0),
        )
            : e.code == wrong_password
            ? Text(
          wrong_password_c,
          style: kBold(whiteColor, 14.0),
        )
            : e.code == email_already_used
            ? Text(
          email_already_used_c,
          style: kBold(whiteColor, 14.0),
        )
            : e.code == no_net
            ? Text(
          no_net_c,
          style: kBold(whiteColor, 14.0),
        )
            : Text(
          " Failed ${e.code}",
          style: kBold(whiteColor, 14.0),
        ),
        position: NotificationPosition.bottom,
        background: kIconColorRed,
      );
      //showSnackBar(context, "Login Failed ${e.code}");
    }
  }

  Future<void> signup(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      // Getting users credential
      UserCredential result = await auth.signInWithCredential(authCredential);
      User? user = result.user;
      if (result != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen(index: 0,)));
      } // if result not null we simply call the MaterialpageRoute,
      // for go to the HomePage screen
    }
  }
/*
  _verifyPhoneNumber(BuildContext context) async {
    String phoneNumber = "+923447203621";
        //"+1" + phoneNumController.text.toString();
    await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 5),
        verificationCompleted: (authCredential) => _verificationComplete(authCredential, context),
        verificationFailed: (authException) => _verificationFailed(authException, context),
        codeAutoRetrievalTimeout: (verificationId) => _codeAutoRetrievalTimeout(verificationId),
        // called when the SMS code is sent
        codeSent: (verificationId, [code]) => _smsCodeSent(verificationId, [code]));
  }

  /// will get an AuthCredential object that will help with logging into Firebase.
  _verificationComplete(AuthCredential authCredential, BuildContext context) {
    FirebaseAuth.instance.signInWithCredential(authCredential).then((authResult) {
      final snackBar = SnackBar(content: Text("Success!!! UUID is: " + authResult.user!.uid));
      Scaffold.of(context).showSnackBar(snackBar);
    });
  }

  _smsCodeSent(String verificationId, List<int> code) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }

  _verificationFailed(AuthException authException, BuildContext context) {
    final snackBar = SnackBar(content: Text("Exception!! message:" + authException.message.toString()));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  _codeAutoRetrievalTimeout(String verificationId) {
    // set the verification code so that we can use it to log the user in
    _smsVerificationCode = verificationId;
  }
*/


}