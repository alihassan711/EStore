import 'dart:io';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/strings.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/model/user_log_in_model.dart';
import 'package:estore/services/apis_services.dart';
import 'package:estore/services/auth_services.dart';
import 'package:estore/widgets/get_started_btn.dart';
import 'package:estore/widgets/loader_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../localization/language_constants.dart';

class EditProfile extends StatefulWidget {
  final UserLogInModel user;
  VoidCallback callback;
  EditProfile({Key? key, required this.user, required this.callback})
      : super(key: key);
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
 // TextEditingController rmailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var email;
  var password;
  bool _loader = false;
  // late bool emailVerified, phoneVerified;
  final ImagePicker _picker = ImagePicker();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  dynamic image;
  // final UserAccountProvider userAccountProvider =
  // Get.put(UserAccountProvider());
  int count = 0;
  @override
  void initState() {
    image = "";
    firstNameController.text = widget.user.userProfile!.firstName ?? "";
    lastNameController.text = widget.user.userProfile!.lastName ?? "";
    phoneController.text = widget.user.userProfile!.phone ?? "";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          // height: Get.height,
          // width: Get.width,
          margin: screenMargin(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: defaultMargin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          },
                        child: const SizedBox(
                            height: 15,
                            width: 20,
                            child: Icon(Icons.arrow_back_ios)),
                      ),
                      Text(getTranslated(context, "edit_profile").toString(),
                          style: kBold(blackColor, 16.0)),
                      const SizedBox(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultMargin,
                ),
                InkWell(
                  onTap: () => showBottomSheet(),
                  child: image != ""
                      ? image.toString().startsWith("http")
                          ? Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: kIconColorGreen.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(image),
                                      fit: BoxFit.cover)))
                          : Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: kIconColorGreen.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: FileImage(
                                        File(
                                          image!,
                                        ),
                                      ),
                                      fit: BoxFit.cover)))
                      : Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              color: kIconColorGreen.withOpacity(0.7),
                              shape: BoxShape.circle),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Image.asset(ImagesPath.watch),
                            //image.asset(ImagesPath.accountPicture),
                          ),
                        ),
                ),
                Form(
                  key: _key,
                  child: Column(
                    children: [
                      // const SizedBox(height: 20.0),
                      // TextFormField(
                      //   controller: email,
                      //   readOnly: true,
                      //   enabled: false,
                      //   decoration: InputDecoration(
                      //       hintText: widget.user.user!.email,
                      //       contentPadding:
                      //       const EdgeInsets.only(left: 10, right: 10),
                      //       focusedBorder: focusBorder(),
                      //       border: border(),
                      //       hintStyle: kSemiBold(blackColor),
                      //
                      //       errorBorder: errorBorder()),
                      //   validator: (val) {
                      //     if (val!.isEmpty) {
                      //       return getTranslated(context, "required_email");
                      //     }
                      //     if (!RegExp(email_RegExp).hasMatch(val)) {
                      //       return getTranslated(context, "valid_email");
                      //     }
                      //     return null;
                      //   },
                      // ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        controller: firstNameController,
                        style: kSemiBold(blackColor),
                        decoration: InputDecoration(
                            hintText: "First Name",
                            contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                            focusedBorder: focusBorder(),
                            border: border(),
                            errorBorder: errorBorder()),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return getTranslated(context, "first_name_required");
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        style: kSemiBold(blackColor),
                        controller: lastNameController,
                        decoration: InputDecoration(
                            hintText: "Last Name",
                            contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                            focusedBorder: focusBorder(),
                            border: border(),
                            errorBorder: errorBorder()),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return getTranslated(context, "last_name_required");
                          }

                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        style: kSemiBold(blackColor),
                        controller: phoneController,
                        decoration: InputDecoration(
                            hintText: "phone",
                            contentPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                            focusedBorder: focusBorder(),
                            border: border(),
                            errorBorder: errorBorder()),
                        validator: (val) {
                          if (val!.isEmpty) {
                            return getTranslated(context, "phone_required");
                          }
                          if (!RegExp(phone_RegExp).hasMatch(val)) {
                            return getTranslated(context, "valid_phone");
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: defaultMargin * 2),
                    ],
                  ),
                ),
                _loader
                    ? const Loader()
                    : GetStartedBtn(
                        onPress: () async {
                          if (image != ""&&_key.currentState!.validate()) {
                            setState(() {
                              _loader = true;
                            });
                            ApiServices.updateProfile(
                              lastName: lastNameController.text,
                              firstName: firstNameController.text,
                              phone: phoneController.text,
                              picture: image,
                            );
                            AuthServices.logInUser(
                                email: email, password: password);
                            print("email  =====> $email");
                            print("password  =====> $password");
                            // await FirebaseServices.updateUser(
                            //     widget.user.data!.id!,
                            //     firstNameController.text.toString(),
                            //     lastNameController.text.toString(),
                            //     image)
                            //     .then((value) =>
                            //     userAccountProvider.getUserInfo(
                            //         userAccountProvider.userInfo.data!.uid!));
                            // setState(() {
                            //   widget.callback();
                            // });
                            Navigator.pop(context);
                            setState(() {
                              _loader = false;
                            });
                          } else {
                            ApiServices.showSnackBar(context, "Pick an Image");
                          }
                        },
                        width: MediaQuery.of(context).size.width,
                        height: 45,
                        text: getTranslated(context, 'save').toString() == null
                            ? "save"
                            : getTranslated(context, 'save').toString(),
                        borderRadius: 5,
                        textStyle: kBold(whiteColor, 14.0),
                        btnColor: kIconColorGreen,
                      ),
              ],
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
                leading: SvgPicture.asset(ImagesPath.gallery),
                title: const Text('Select Photo'),
                onTap: () async {
                  await galleryImage();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(ImagesPath.camera),
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
  cameraImage() async {
    XFile? cameraImage = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (image != null) {
      image = cameraImage!.path;
    }
    setState(() {});
  }

  galleryImage() async {
    XFile? galleryImage = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (galleryImage != null) {
      image = galleryImage.path;
    }
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void getPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    password = prefs.getString('password');
    print("email is in my app ====>  ${email}");
  }
}
