import 'package:estore/constants/color.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/dashboard/main_page.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhoneAuthForm extends StatefulWidget {
  PhoneAuthForm({Key? key}) : super(key: key);

  @override
  _PhoneAuthFormState createState() => _PhoneAuthFormState();
}

class _PhoneAuthFormState extends State<PhoneAuthForm> {
  Future<void> phoneSignIn({required String phoneNumber}) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ===========>>> code");
    print("verification completed ===========>>>  ${authCredential.smsCode}");
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      this.otpCode.text = authCredential.smsCode!;
    });
    if (authCredential.smsCode != null) {
      try{
        UserCredential credential =
        await user!.linkWithCredential(authCredential);
      }on FirebaseAuthException catch(e){
        if(e.code == 'provider-already-linked'){
          await _auth.signInWithCredential(authCredential);
        }
      }
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MainScreen(index: 0,)));
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      showMessage("The phone number entered is invalid!");
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    this.verificationId = verificationId;
    print("that is code ===> ${forceResendingToken}");
    print("code sent  ==${verificationId}");
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        }).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();

  OutlineInputBorder border = const OutlineInputBorder(
      borderSide: BorderSide(color: blackColor, width: 3.0));

  bool isLoading = false;

  String? verificationId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        // appBar: AppBar(
        //   elevation: 0.0,
        //   backgroundColor: Colors.transparent,
        //   title: const Text("Verify OTP"
        //   ),
        //   backwardsCompatibility: false,
        //   systemOverlayStyle: const SystemUiOverlayStyle(
        //       statusBarColor: Colors.blue),),
        // backgroundColor: whiteColor,
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneNumber,
                      decoration: InputDecoration(
                        labelText: "Enter Phone",
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                        border: border,
                      )),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: otpCode,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Otp",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      border: border,
                      suffixIcon: const Padding(
                        child: FaIcon(
                          FontAwesomeIcons.eye,
                          size: 15,
                        ),
                        padding: EdgeInsets.only(top: 15, left: 15),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.only(bottom: size.height * 0.10)),
                !isLoading
                    ?
                ElevatedBtn(
                  btnWidth: 270,
                  btnTxtSize: 16.0,
                  text: getTranslated(context, "sign_in").toString(),
                  txtColor: whiteColor,
                  btnHeight: 45,
                  circularSize: 12.0,
                  color: phoneColor,
                  onPress: ()async{
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                       // isLoading = true;
                      });
                      await phoneSignIn(phoneNumber: phoneNumber.text);
                    }
                  },
                )
                // SizedBox(
                //   width: size.width * 0.8,
                //   child: OutlinedButton(
                //     onPressed: () async {
                //       //FirebaseService service = new FirebaseService();
                //       if (_formKey.currentState!.validate()) {
                //         await phoneSignIn(phoneNumber: phoneNumber.text);
                //         setState(() {
                //           isLoading = true;
                //         });
                //       }
                //     },
                //     child: Text(getTranslated(context, "sign_in").toString(),style: kBold(kIconColorGreen,14.0),),
                //     style: ButtonStyle(
                //         foregroundColor: MaterialStateProperty.all<Color>(
                //             kIconColorGreen),
                //         backgroundColor: MaterialStateProperty.all<Color>(
                //             blackColor),
                //         side: MaterialStateProperty.all<BorderSide>(
                //             BorderSide.none)),
                //   ),
                // )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        ));
  }
}