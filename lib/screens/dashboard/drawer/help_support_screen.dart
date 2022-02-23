import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:estore/localization/language_constants.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: whiteColor,
      appBar: AppBar(
        title: AutoSizeText(
            getTranslated(context, "help").toString(),
          style: kBold(kIconColorGreen, 20.0),
        ),
        // centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Column(
        children: [
          ListTile(
            title:
                AutoSizeText(getTranslated(context, "help_centre",).toString(),),
            leading: const Icon(Icons.help_outline),
          ),
          ListTile(
            title:
                AutoSizeText(getTranslated(context, "contact_us").toString()),
            leading: const Icon(Icons.contact_phone),
            subtitle: AutoSizeText(
                getTranslated(context, "question_need_help").toString()),
          ),
          ListTile(
            title: AutoSizeText(
                getTranslated(context, "terms_privacy").toString()),
            leading: const Icon(Icons.file_copy),
          ),
          ListTile(
            title: AutoSizeText(getTranslated(context, "app_info").toString()),
            leading: const Icon(Icons.error_outline),
          ),
        ],
      ),
    );
  }
}
