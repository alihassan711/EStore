/*
import 'dart:typed_data';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/onboarding/sign_in_screen.dart';
import 'package:estore/services/auth_services.dart';
import 'package:estore/utils/elevated_button.dart';
import 'package:estore/utils/text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  XFile file = XFile("");
  Uint8List? webImage;
  String countryd = "Country";
  String policy_holder = "State";
  String cityd = "City";
  final ImagePicker picker = ImagePicker();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool? _passwordVisible = false;
  bool imgError = false;

  bool _isPost = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    //getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     getTranslated(context, "register").toString(),
      //   ),
      //   centerTitle: true,
      //   actions: const [],
      // ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 12.0),
            child: SafeArea(
              child: Column(
                children: [
                  // GestureDetector(
                  //   onTap: () => showBottomSheet(),
                  //   child: webImage == null && file.path == ""
                  //       ? Center(
                  //     child: SizedBox(
                  //         height: 130,
                  //         width: 130,
                  //         child: Container(
                  //           decoration: const BoxDecoration(
                  //             //borderRadius: BorderRadius.circular(60),
                  //               shape: BoxShape.circle,
                  //               image: DecorationImage(
                  //                   image: ExactAssetImage(
                  //                     "assets/images/account.jpg",
                  //                   ),
                  //                   fit: BoxFit.fill)),
                  //         )),
                  //   )
                  //       : Center(
                  //       child: SizedBox(
                  //         height: 130,
                  //         width: 130,
                  //         child: (kIsWeb)
                  //             ? Container(
                  //           decoration: BoxDecoration(
                  //             // borderRadius: BorderRadius.circular(50),
                  //               shape: BoxShape.circle,
                  //               image: DecorationImage(
                  //                   image: MemoryImage(webImage!),
                  //                   fit: BoxFit.fill)),
                  //         )
                  //             :  Container(
                  //           // decoration: BoxDecoration(
                  //           //   // borderRadius: BorderRadius.circular(40),
                  //           //     shape: BoxShape.circle,
                  //           //     image: DecorationImage(
                  //           //         image: FileImage(File(file.path)),
                  //           //         fit: BoxFit.fill)),
                  //         ),
                  //       )),
                  // ),
                  // imgError
                  //     ? Text(
                  //   getTranslated(context, "image_require").toString(),
                  //   style: const TextStyle(color: kIconColorRed),
                  // )
                  //     : const SizedBox(),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 300,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(getTranslated(context, "first_name").toString(),
                              style: kBold(blackColor,16.0)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldCustom(
                            controller: firstName,
                            isPhone: false,
                            isEmail: false,
                            isPass: false,
                            valid: (val) {
                              if (val.isEmpty) {
                                return getTranslated(
                                    context, "first_name_required");
                              }
                              return null;
                            },
                            //labelText:getTranslated(context,"name"),
                            hintText: getTranslated(context, "first_name",),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(getTranslated(context, "last_name").toString(),
                              style: kBold(blackColor,16.0)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldCustom(
                            controller: lastName,
                            isPhone: false,
                            isEmail: false,
                            isPass: false,
                            valid: (val) {
                              if (val.isEmpty) {
                                return getTranslated(
                                    context, "last_name_required");
                              }
                              return null;
                            },
                            //labelText:getTranslated(context,"name"),
                            hintText: getTranslated(context, "last_name",),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(getTranslated(context, "phone").toString(),
                              style: kBold(blackColor,16.0)),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormFieldCustom(
                            controller: phone,
                            isPhone: true,
                            isEmail: false,
                            isPass: false,
                            valid: (val) {
                              if (val.isEmpty) {
                                return getTranslated(
                                    context, "phone_required");
                              }
                              return null;
                            },
                            //labelText:getTranslated(context,"name"),
                            hintText: getTranslated(context, "phone",),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(getTranslated(context, "email").toString(),
                              style:kBold(blackColor,14.0),),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormFieldCustom(
                            controller: email,
                            isPhone: false,
                            isEmail: true,
                            isPass: false,
                            valid: (val) {
                              if (val.isEmpty) {
                                return getTranslated(context, "required_email");
                              }
                              if (!RegExp(email_RegExp).hasMatch(val)) {
                                return getTranslated(context, "valid_email");
                              }
                              return null;
                            },
                            //labelText:getTranslated(context,"email"),
                            hintText: getTranslated(context, "email_hint"),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Text(getTranslated(context, "password").toString(),
                              style: kBold(blackColor, 16.0)),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormPassFieldCustom(
                            controller: password,
                            showPass: !_passwordVisible!,
                            valid: (val) {
                              if (val.isEmpty) {
                                return getTranslated(
                                    context, "required_password");
                              }
                              if (val.length < 6) {
                                return getTranslated(context, "valid_password");
                              }
                              return null;
                            },
                            icon: IconButton(
                              icon: Icon(
                                _passwordVisible!
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: blackColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible!;
                                });
                              },
                            ),
                            //labelText: getTranslated(context, "password"),
                            hintText: getTranslated(context, "password"),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          Text(
                              getTranslated(context, "confirm_password")
                                  .toString(),
                              style: kBold(blackColor, 16.0)),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormPassFieldCustom(
                            controller: confirmPassword,
                            showPass: !_passwordVisible!,
                            valid: (val) {
                              if (val.isEmpty) {
                                return getTranslated(
                                    context, "required_confirm_password");
                              }
                              if (password.text != confirmPassword.text) {
                                return getTranslated(
                                    context, "confirm_password_notmatch");
                              }
                              return null;
                            },
                            icon: IconButton(
                              icon: Icon(
                                _passwordVisible!
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: blackColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible!;
                                });
                              },
                            ),
                            //labelText: getTranslated(context, "password"),
                            hintText:
                            getTranslated(context, "confirm_password"),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          SizedBox(
                            height: 45,
                            width: MediaQuery.of(context).size.width,
                            child: _isPost
                                ? const Center(
                              child: CircularProgressIndicator(),
                            )
                                : ElevatedBtn(color: kIconColorGreen,
                              circularSize: 12.0,
                              onPress: () async {
                                //print("web image data ???? ${webImage!.length}");
                                if (_formKey.currentState!.validate()) {
                                  await AuthServices.registerUser(
                                    email: email.text,
                                    password: password.text,
                                  firstName: firstName.text,
                                  lastName: lastName.text,
                                    phone: phone.text,
                                  )  .then((value) {
                                    if(value){
                                      Navigator.pushReplacement(context,  MaterialPageRoute(
                                          builder: (_) => SignInScreen(
                                                // form: args.toString(),
                                              )));
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to register")));
                                    }
                                  }
                                  );
                                  setState(() {
                                    _isPost = true;
                                  });
                                  firstName.clear();
                                  lastName.clear();
                                  phone.clear();
                                  email.clear();
                                  password.clear();
                                  confirmPassword.clear();
                                  setState(() {
                                    _isPost = false;
                                  });

                                }
                              },
                              text: getTranslated(context, "register"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(
                  Icons.folder,
                ),
                title: const Text('Select Photo'),
                onTap: () async {
                  await uploadImage();
                  Navigator.pop(context);
                },
              ),
              kIsWeb
                  ? const SizedBox()
                  : const SizedBox(
                height: 10,
              ),
              kIsWeb
                  ? const SizedBox()
                  : ListTile(
                leading: const Icon(
                  Icons.camera,
                ),
                title: const Text('Take Photo'),
                onTap: () async {
                  await cameraImage();
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  uploadImage() async {
    // MOBILE
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = XFile(image.path);
        setState(() {
          file = selected;
          //  print("file  is :   ${_file}");
          // print("file path is :   ${_file.path}");
        });
      } else {
        Text("No file selected");
      }
    }
    // WEB
    else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          file = XFile("a");
          webImage = f;
        });
      } else {
        Text("No file selected for web");
      }
    } else {
      Text("image error");
    }
  }

  galleryImage() async {
    //print("Thats is the Mobile picker========");
    XFile? galleryImage = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (galleryImage != null) {
      image = galleryImage;
    }
    setState(() {
      imgError = false;
    });
  }

  // Future<MediaInfo> imagePicker() async {
  //   print("Thats is the Webb picker========");
  //   MediaInfo webimg = await ImagePickerWeb.getImageInfo;
  //   if (webimg != null) {
  //     webimg = webimg;
  //   }
  //   setState(() {
  //     imgError = false;
  //   });
  //   return webimg;
  // }

  cameraImage() async {
    XFile? galleryImage = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (galleryImage != null) {
      file = galleryImage;
    }
    setState(() {
      imgError = false;
    });
  }
}
*/
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/model/language.dart';
import 'package:estore/screens/onboarding/sign_in_screen.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/services/auth_services.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool? _passwordVisible = false;
  bool? _passwordVisiblec = false;
  //bool? _passwordVisible = false;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  ApiServices _repository = ApiServices();
  bool? loading = false;
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      loading = false;
    });
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
      body: Form(
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
                controller: firstName,
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                validator: (val) {
                  if (val!.isEmpty) {
                    return getTranslated(context, "first_name_required");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: focusBorder(),
                  border: border(),
                  errorBorder: errorBorder(),
                  hintText: getTranslated(context, "first_name").toString(),
                  prefixIcon: const Icon(
                    Icons.person,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextFormField(
                obscureText: false,
                controller: lastName,
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                validator: (val) {
                  if (val!.isEmpty) {
                    return getTranslated(context, "last_name_required");
                  }

                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: focusBorder(),
                  border: border(),
                  errorBorder: errorBorder(),
                  hintText: getTranslated(context, "last_name").toString(),
                  prefixIcon: const Icon(
                    Icons.person,
                    size: 20,
                    color: Color.fromRGBO(32, 64, 81, 1.0),
                  ),
                  // border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 13.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                controller: phone,
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                validator: (val) {
                  if (val!.isEmpty) {
                    return getTranslated(context, "phone_required");
                  }
                  if (!RegExp(phone_RegExp).hasMatch(val)) {
                    return getTranslated(context, "valid_phone");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: focusBorder(),
                  border: border(),
                  errorBorder: errorBorder(),
                  hintText: getTranslated(context, "phone").toString(),
                  prefixIcon: const Icon(
                    Icons.phone,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                controller: address,
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                validator: (val) {
                  if (val!.isEmpty) {
                    return getTranslated(context, "required_address");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: focusBorder(),
                  border: border(),
                  errorBorder: errorBorder(),
                  hintText: getTranslated(context, "address").toString(),
                  prefixIcon: const Icon(
                    Icons.account_balance_rounded,
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
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
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
                decoration: InputDecoration(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextFormField(
                obscureText: !_passwordVisible!,
                controller: password,
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                validator: (val) {
                  if (val!.isEmpty) {
                    return getTranslated(context, "required_password");
                  }
                  if (val.length < 5) {
                    return getTranslated(context, "valid_password");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: focusBorder(),
                  border: border(),
                  errorBorder: errorBorder(),
                  hintText: getTranslated(context, "password").toString(),
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 20,
                    color: Color.fromRGBO(32, 64, 81, 1.0),
                  ),
                  // border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 13.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible!
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20,
                      color: blackColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible!;
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: TextFormField(
                obscureText: !_passwordVisiblec!,
                controller: confirmPassword,
                onChanged: (String value) {},
                cursorColor: const Color.fromRGBO(32, 64, 81, 1.0),
                validator: (val) {
                  if (val!.isEmpty) {
                    return getTranslated(context, "required_confirm_password");
                  }
                  if (password.text != confirmPassword.text) {
                    return getTranslated(context, "confirm_password_notmatch");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  focusedBorder: focusBorder(),
                  border: border(),
                  errorBorder: errorBorder(),
                  hintText:
                      getTranslated(context, "confirm_password").toString(),
                  prefixIcon: const Icon(
                    Icons.lock,
                    size: 20,
                    color: Color.fromRGBO(32, 64, 81, 1.0),
                  ),
                  // border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 13.0),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisiblec!
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: 20,
                      color: blackColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisiblec = !_passwordVisiblec!;
                      });
                    },
                  ),
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
                          getTranslated(context, "register").toString(),
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
                            await AuthServices.registerUser(
                                    email: email.text,
                                    password: password.text,
                                    firstName: firstName.text,
                                    lastName: lastName.text,
                                    phone: phone.text,
                                    address: address.text)
                                .then((value) {
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
                                          "Failed to register",
                                          style: TextStyle(color: whiteColor),
                                        )));
                                setState(() {
                                  loading = false;
                                });
                              }
                            });
                            setState(() {
                              //_isPost = true;
                            });
                            firstName.clear();
                            lastName.clear();
                            phone.clear();
                            email.clear();
                            password.clear();
                            // confirmPassword.clear();
                            setState(() {
                              //  _isPost = false;
                            });
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                      ),
                    ))
                : Center(child: CircularProgressIndicator()),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
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
