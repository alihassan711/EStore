import 'dart:typed_data';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/widgets/my_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
      appBar:
      AppBar(
        title: AutoSizeText("Settings",style: kBold(kIconColorGreen,20.0),),
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
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText("Abdul Manan",style: kBold(blackColor, 16.0),),
                        SizedBox(height: 5,),
                        AutoSizeText("bushra12@gmail.com",style: kNormalBlack(blackColor),),
                      ],
                    ),
                    Spacer(),
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
                  margin: const EdgeInsets.only(bottom: 6.0,top: 6.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
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
                            Icon(Icons.person),
                            SizedBox(width: 12,),
                            AutoSizeText("Profile Settings",style: kBold(blackColor, 16.0),),
                            Spacer(),
                            AutoSizeText("Edit",style: kBold(blackColor, 16.0),)
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            AutoSizeText("Full name",style: kBold(blackColor,12.0),),
                            Spacer(),
                            AutoSizeText("Abdul Mana",style: kNormalBlack(blackColor),)
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            AutoSizeText("Email",style: kBold(blackColor, 12.0),),
                            Spacer(),
                            AutoSizeText("abdul23@xyz.com",style: kNormalBlack(blackColor),)
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            AutoSizeText("Phone",style: kBold(blackColor, 12.0),),
                            Spacer(),
                            AutoSizeText("+9123323442",style: kNormalBlack(blackColor),)
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            AutoSizeText("Address",style: kBold(blackColor, 12.0),),
                            Spacer(),
                            AutoSizeText("289 carporaings s1",style: kNormalBlack(blackColor),)
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            AutoSizeText("About",style: kBold(blackColor, 12.0),),
                            Spacer(),
                            AutoSizeText("contact the developers",style: kNormalBlack(blackColor),)
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
                  margin: const EdgeInsets.only(bottom: 6.0,top: 6.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
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
                            Icon(Icons.settings),
                            SizedBox(width: 12,),
                            AutoSizeText("App Settings",style: kBold(blackColor, 16.0),),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Icon(Icons.translate),
                            SizedBox(width: 12,),
                            AutoSizeText("Language",style: kBold(blackColor, 16.0),),
                            Spacer(),
                            AutoSizeText("English",style: kNormalBlack(blackColor),)
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(width: 12,),
                            AutoSizeText("Help & Support",style: kBold(blackColor, 16.0),),
                          ],
                        ),
                        SizedBox(height: 12,),
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
                leading: Icon(
                  Icons.folder,
                ),
                title: const Text('Select Photo'),
                onTap: () async {
                  await uploadImage();
                  Navigator.pop(context);
                },
              ),
              kIsWeb
                  ? SizedBox()
                  : SizedBox(
                height: 10,
              ),
              kIsWeb
                  ? SizedBox()
                  : ListTile(
                leading: Icon(
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
          _file = XFile("a");
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
