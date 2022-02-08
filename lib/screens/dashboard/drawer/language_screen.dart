import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/image_path.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:estore/model/language.dart';
import 'package:estore/widgets/iconbtn.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  Language? language;
  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    MyApp.setLocale(context, _locale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
            getTranslated(context, "languages").toString(),
          style: kBold(kIconColorGreen, 20.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconBtn(
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: blackColor,
            ),
            onPress: () {},
            color: blackColor,
          ),
          /*
          Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,size: 25,
                //color: blackColor,
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
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ),
          */
        ],
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.translate,
                    size: 30,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(
                        getTranslated(context, "app_language").toString(),
                        style: kBold(blackColor, 16.0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AutoSizeText(
                        getTranslated(context, "select_own_language").toString(),
                        style: kNormalBlack(blackColor),
                      )
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            GestureDetector(
              onTap: (){
                print("Urdu");
              },
              child: Card(
                elevation: 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: whiteColor,
                        radius: 30,
                        backgroundImage: ExactAssetImage(
                          ImagesPath.pak,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        children: [
                          AutoSizeText(
                            getTranslated(context, "urdu").toString(),
                            style: kBold(blackColor, 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AutoSizeText(
                            getTranslated(context, "urdu").toString(),
                            style: kNormalBlack(blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("Arabic");
              },
              child: Card(
                elevation: 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: whiteColor,
                        radius: 30,
                        backgroundImage: ExactAssetImage(
                          ImagesPath.saudia,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        children: [
                          AutoSizeText(
                            getTranslated(context, "arabic").toString(),
                            style: kBold(blackColor, 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AutoSizeText(
                            "اَلْعَرَبِيَّة",
                            style: kNormalBlack(blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                print("english");
              },
              child: Card(
                elevation: 1.0,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: whiteColor,
                        radius: 30,
                        backgroundImage: ExactAssetImage(
                          ImagesPath.usa,
                        ),
                      ),
                      const SizedBox(
                        width: 14,
                      ),
                      Column(
                        children: [
                          AutoSizeText(
                            getTranslated(context, "english").toString(),
                            style: kBold(blackColor, 16.0),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          AutoSizeText(
                            getTranslated(context, "english").toString(),
                            style: kNormalBlack(blackColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
