import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/screens/dashboard/drawer/help_support_screen.dart';
import 'package:estore/screens/dashboard/drawer/language_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/urls.dart';
import '../../onboarding/edit_profile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  XFile _file = XFile("");
  Uint8List? webImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: AutoSizeText(
          getTranslated(context, "settings").toString(),
          style: kBold(kIconColorGreen, 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          globalUserData.userProfile!.firstName.toString() ==
                                  null
                              ? "name"
                              : globalUserData.userProfile!.firstName
                                  .toString(),
                          style: kBold(blackColor, 16.0),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AutoSizeText(
                          globalUserData.user!.email.toString() == null
                              ? "email"
                              : globalUserData.user!.email.toString(),
                          style: kNormalBlack(blackColor),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => showBottomSheet(),
                      child: Container(
                          height: 70,
                          width: 70,
                          child: Container(
                            decoration: BoxDecoration(
                                //borderRadius: BorderRadius.circular(60),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: ExactAssetImage(
                                      ImagesPath.accountPicture,
                                    ),
                                    fit: BoxFit.cover)),
                          )),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  // height: 100.0,
                  margin: const EdgeInsets.only(
                      bottom: 6.0, top: 6.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Icon(Icons.person),
                            const SizedBox(
                              width: 12,
                            ),
                            AutoSizeText(
                              getTranslated(context, "profile_settings")
                                  .toString(),
                              style: kBold(blackColor, 14.0),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditProfile(
                                            user: globalUserData,
                                            callback: () {
                                              setState(() {});
                                            })));
                              },
                              child: AutoSizeText(
                                getTranslated(context, "edit").toString(),
                                style: kBold(blackColor, 14.0),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              globalUserData.userProfile!.firstName
                                          .toString() ==
                                      null
                                  ? "name"
                                  : globalUserData.userProfile!.firstName
                                      .toString(),
                              style: kBold(blackColor, 12.0),
                            ),
                            const Spacer(),
                            AutoSizeText(
                              globalUserData.userProfile!.firstName.toString(),
                              style: kNormalBlack(blackColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              getTranslated(context, "email").toString() == null
                                  ? "email"
                                  : getTranslated(context, "email").toString(),
                              style: kBold(blackColor, 12.0),
                            ),
                            const Spacer(),
                            AutoSizeText(
                              globalUserData.user!.email.toString() == null
                                  ? "email"
                                  : globalUserData.user!.email.toString(),
                              style: kNormalBlack(blackColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              getTranslated(context, "phone").toString(),
                              style: kBold(blackColor, 12.0),
                            ),
                            const Spacer(),
                            AutoSizeText(
                              globalUserData.userProfile!.phone.toString() ==
                                      null
                                  ? "phone"
                                  : globalUserData.userProfile!.phone
                                      .toString(),
                              style: kNormalBlack(blackColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              getTranslated(context, "address").toString(),
                              style: kBold(blackColor, 12.0),
                            ),
                            const Spacer(),
                            AutoSizeText(
                              globalUserData.user!.address.toString() == null
                                  ? "address"
                                  : globalUserData.user!.address.toString(),
                              style: kNormalBlack(blackColor),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            AutoSizeText(
                              getTranslated(context, "about").toString(),
                              style: kBold(blackColor, 12.0),
                            ),
                            const Spacer(),
                            AutoSizeText(
                              "contact the developers",
                              style: kNormalBlack(blackColor),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 12,),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                  // height: 100.0,
                  margin: const EdgeInsets.only(
                      bottom: 6.0, top: 6.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.settings),
                            const SizedBox(
                              width: 12,
                            ),
                            AutoSizeText(
                              getTranslated(context, "app_settings").toString(),
                              style: kBold(blackColor, 13.0),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LanguageScreen()));
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.translate),
                              const SizedBox(
                                width: 12,
                              ),
                              AutoSizeText(
                                getTranslated(context, "language").toString(),
                                style: kBold(blackColor, 13.0),
                              ),
                              const Spacer(),
                              AutoSizeText(
                                getTranslated(context, "use_language")
                                    .toString(),
                                style: kNormalBlack(blackColor),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HelpScreen()));
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.person),
                              const SizedBox(
                                width: 12,
                              ),
                              AutoSizeText(
                                getTranslated(context, "help_support")
                                    .toString(),
                                style: kBold(blackColor, 13.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
                  ? SizedBox()
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
          _file = selected;
          //  print("file  is :   ${_file}");
          // print("file path is :   ${_file.path}");
        });
      } else {
        const Text("No file selected");
      }
    }
    // WEB
    else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          _file = XFile("a");
          webImage = f;
        });
      } else {
        const Text("No file selected for web");
      }
    } else {
      const Text("image error");
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
      //imgError = false;
    });
  }

  cameraImage() async {
    XFile? galleryImage = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (galleryImage != null) {
      _file = galleryImage;
    }
    setState(() {
      // imgError = false;
    });
  }
}
