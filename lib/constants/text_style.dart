import 'package:flutter/material.dart';
import 'color.dart';

const String email_RegExp =
    "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:/.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*.[a-zA-Z0-9]";

TextStyle kSemiBold(Color color) {
  return  TextStyle(fontSize: 14, color: color,fontWeight: FontWeight.w500);
}
TextStyle kNormalBlack(Color color) {
  return  TextStyle(fontSize: 14, color: color,fontWeight: FontWeight.normal);
}
TextStyle kBold(Color color,size) {
  return  TextStyle(fontSize: size, color: color,fontWeight: FontWeight.bold);
}
EdgeInsetsGeometry screenMargin() =>
    const EdgeInsets.symmetric(horizontal: 15.0);

InputBorder focusBorder() =>  const OutlineInputBorder(
    borderSide: BorderSide(color: kIconColorGreen, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ));

InputBorder errorBorder() =>  const OutlineInputBorder(
    borderSide: BorderSide(color: kIconColorRed, width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ));

InputBorder border() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide:  const BorderSide(color: blackColor, width: 1.0),
);