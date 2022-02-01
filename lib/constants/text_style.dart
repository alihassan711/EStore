import 'package:flutter/material.dart';
import 'color.dart';


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