import 'package:flutter/material.dart';
import 'color.dart';

// white font style
TextStyle white24() {
  return const TextStyle(fontSize: 24, color: whiteColor);
}

TextStyle white20() {
  return const TextStyle(fontSize: 20, color: whiteColor);
}

TextStyle white18() {
  return const TextStyle(fontSize: 18, color: whiteColor);
}

TextStyle white16() {
  return const TextStyle(fontSize: 16, color: whiteColor);
}

TextStyle white14() {
  return const TextStyle(fontSize: 14, color: whiteColor);
}

TextStyle white12() {
  return const TextStyle(fontSize: 12, color: whiteColor);
}

// black font style
TextStyle black22() {
  return const TextStyle(fontSize: 22, color: blackColor);
}

TextStyle black20() {
  return const TextStyle(fontSize: 20, color: blackColor);
}

TextStyle black18() {
  return const TextStyle(fontSize: 18, color: blackColor);
}

TextStyle black16() {
  return const TextStyle(fontSize: 16, color: blackColor);
}

TextStyle black14() {
  return const TextStyle(fontSize: 14, color: blackColor);
}
TextStyle black14f5() {
  return const TextStyle(fontSize: 14, color: blackColor,fontWeight: FontWeight.w500);
}

TextStyle blue16() {
  return const TextStyle(
      fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold);
}

TextStyle red16() {
  return const TextStyle(
      fontSize: 20, color: redColor, fontWeight: FontWeight.bold);
}

TextStyle red12() {
  return const TextStyle(
      fontSize: 12, color: redColor, fontWeight: FontWeight.bold);
}

TextStyle blue14() {
  return const TextStyle(
      fontSize: 14, color: Colors.blue, fontWeight: FontWeight.bold);
}

TextStyle red14() {
  return const TextStyle(
      fontSize: 14, color: redColor, fontWeight: FontWeight.bold);
}

TextStyle green20() {
  return const TextStyle(
      fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold);
}

TextStyle black14bold() {
  return const TextStyle(
      fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold);
}

TextStyle black12() {
  return const TextStyle(fontSize: 12, color: blackColor);
}

TextStyle black40() {
  return const TextStyle(fontSize: 40, color: blackColor);
}

TextStyle blackbold22() {
  return const TextStyle(
      fontSize: 22, color: blackColor, fontWeight: FontWeight.bold);
}

// bottom navigation bar text style
TextStyle hint10() {
  return const TextStyle(fontSize: 10, color: hintTextColor);
}

TextStyle hint12() {
  return const TextStyle(fontSize: 12, color: hintTextColor);
}

TextStyle hint18() {
  return const TextStyle(fontSize: 18, color: hintTextColor);
}

TextStyle hint16() {
  return const TextStyle(fontSize: 16, color: hintTextColor);
}

TextStyle hint14() {
  return const TextStyle(fontSize: 14, color: hintTextColor);
}

TextStyle logo12() {
  return const TextStyle(fontSize: 12, color: logoColor);
}

TextStyle logo14() {
  return const TextStyle(fontSize: 14, color: logoColor);
}

ButtonStyle textButton14() {
  return TextButton.styleFrom(textStyle: const TextStyle(fontSize: 14));
}

TextStyle logo10() {
  return const TextStyle(fontSize: 10, color: logoColor);
}

TextStyle logo16() {
  return const TextStyle(fontSize: 16, color: logoColor);
}

// screen margin
EdgeInsetsGeometry screenMargin() =>
    const EdgeInsets.symmetric(horizontal: 15.0);

// text field border
InputBorder border() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: const BorderSide(color: hintTextColor, width: 1.0),
);
InputBorder borderDropDown() => OutlineInputBorder(
  borderRadius: BorderRadius.circular(10),
  borderSide: const BorderSide(color: hintTextColor, width: 1.0),
);
InputBorder focusBorderDropDown() => const OutlineInputBorder(
    borderSide: BorderSide(color: logoColor, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ));
InputBorder focusBorder() => const OutlineInputBorder(
    borderSide: BorderSide(color: logoColor, width: 2.0),
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ));

InputBorder errorBorder() => const OutlineInputBorder(
    borderSide: BorderSide(color: redColor, width: 1.0),
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ));
BoxDecoration greenGradientBackgroundDecoration() {
  return const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      stops: [0.1, 0.5, 0.7, 0.9],
      colors: [
        logoColor,
        logoColor,
        logoColor,
        logoColor,
      ],
    ),
  );
}
