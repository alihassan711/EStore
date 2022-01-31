import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AutoSizeText(
          "Help",
          style: kBold(kIconColorGreen, 20.0),
        ),
       // centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: blackColor),
      ),
      body: Column(
        children: const [
          ListTile(
            title: AutoSizeText("Help Centre"),
            leading: Icon(Icons.help_outline),
          ),
          ListTile(
            title: AutoSizeText("Contact us"),
            leading: Icon(Icons.contact_phone),
            subtitle: AutoSizeText("Questions? Need help?"),
          ),
          ListTile(
            title: AutoSizeText("Terms and privacy policy"),
            leading: Icon(Icons.file_copy),
          ),
          ListTile(
            title: AutoSizeText("App info"),
            leading: Icon(Icons.error_outline),
          ),
        ],
      ),
    );
  }
}
