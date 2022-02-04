import 'package:estore/constants/color.dart';
import 'package:estore/constants/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TextFormPassFieldCustom extends StatelessWidget {
  FormFieldValidator? valid;
  IconButton? icon;
  TextEditingController? controller;
  String? labelText, hintText;
  bool? showPass;

  TextFormPassFieldCustom({
    this.icon,
    this.valid,
    this.labelText,
    this.hintText,
    this.controller,
    this.showPass,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: showPass!,
      controller: controller,
      cursorColor: kIconColorGreen,
      validator: valid,
      decoration: InputDecoration(
          suffixIcon: icon,
          focusedBorder: focusBorder(),
          border: border(),
          errorBorder: errorBorder(),
          labelText: labelText,
          hintText: hintText,
          labelStyle: kBold(blackColor, 16.0),
          hintStyle:  kBold(kGrey,14.0)),
      style:kBold(blackColor, 16.0),
    );
  }
}
class TextFormFieldTime extends StatelessWidget {
  FormFieldValidator? valid;
  IconButton? icon;
  TextEditingController? controller;
  String? labelText, hintText;
  bool? isPhone, isEmail, isPass;

  TextFormFieldTime(
      {this.icon,
        this.valid,
        this.labelText,
        this.hintText,
        this.controller,
        this.isPass,
        this.isEmail,
        this.isPhone});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
     // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      maxLength: 12,
      obscureText: false,
      controller: controller,
      cursorColor: kIconColorGreen,
      validator: valid,
      keyboardType: isEmail!
          ? TextInputType.emailAddress
          : isPhone!
          ? TextInputType.phone
          : TextInputType.name,
      decoration: InputDecoration(
          counter: SizedBox.shrink(),
          suffixIcon: icon,
          focusedBorder: focusBorder(),
          border: border(),
          errorBorder: errorBorder(),
          labelText: labelText,
          hintText: hintText,
          labelStyle: kBold(blackColor,16.0),
          hintStyle:kBold(blackColor,16.0),),
      style: kBold(blackColor,16.0),
    );
  }
}
class TextFormFieldCustom extends StatelessWidget {
  FormFieldValidator? valid;
  IconButton? icon;
  TextEditingController? controller;
  String? labelText, hintText;
  bool? isPhone, isEmail, isPass;

  TextFormFieldCustom(
      {this.icon,
        this.valid,
        this.labelText,
        this.hintText,
        this.controller,
        this.isPass,
        this.isEmail,
        this.isPhone});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      controller: controller,
      cursorColor: kIconColorGreen,
      validator: valid,
      keyboardType: isEmail!
          ? TextInputType.emailAddress
          : isPhone!
          ? TextInputType.phone
          : TextInputType.name,
      decoration: InputDecoration(
          suffixIcon: icon,
          focusedBorder: focusBorder(),
          border: border(),
          errorBorder: errorBorder(),
          labelText: labelText,
          hintText: hintText,
          labelStyle: kBold(blackColor,16.0),
          hintStyle:  kBold(kGrey,14.0)),
      style: kBold(blackColor,16.0),
    );
  }
}