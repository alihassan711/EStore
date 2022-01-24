// import 'package:estore/constants/color.dart';
// import 'package:estore/constants/text_style.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// class TextFormFieldTime extends StatelessWidget {
//   FormFieldValidator? valid;
//   IconButton? icon;
//   TextEditingController? controller;
//   String? labelText, hintText;
//   bool? isPhone, isEmail, isPass;
//
//   TextFormFieldTime(
//       {this.icon,
//         this.valid,
//         this.labelText,
//         this.hintText,
//         this.controller,
//         this.isPass,
//         this.isEmail,
//         this.isPhone});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//      // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//       maxLength: 12,
//       obscureText: false,
//       controller: controller,
//       cursorColor: logoColor,
//       validator: valid,
//       keyboardType: isEmail!
//           ? TextInputType.emailAddress
//           : isPhone!
//           ? TextInputType.phone
//           : TextInputType.name,
//       decoration: InputDecoration(
//           counter: SizedBox.shrink(),
//           suffixIcon: icon,
//           focusedBorder: focusBorder(),
//           border: border(),
//           errorBorder: errorBorder(),
//           labelText: labelText,
//           hintText: hintText,
//           labelStyle: black16(),
//           hintStyle: hint16()),
//       style: black16(),
//     );
//   }
// }
// class TextFormFieldCustom extends StatelessWidget {
//   FormFieldValidator? valid;
//   IconButton? icon;
//   TextEditingController? controller;
//   String? labelText, hintText;
//   bool? isPhone, isEmail, isPass;
//
//   TextFormFieldCustom(
//       {this.icon,
//         this.valid,
//         this.labelText,
//         this.hintText,
//         this.controller,
//         this.isPass,
//         this.isEmail,
//         this.isPhone});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       obscureText: false,
//       controller: controller,
//       cursorColor: logoColor,
//       validator: valid,
//       keyboardType: isEmail!
//           ? TextInputType.emailAddress
//           : isPhone!
//           ? TextInputType.phone
//           : TextInputType.name,
//       decoration: InputDecoration(
//           suffixIcon: icon,
//           focusedBorder: focusBorder(),
//           border: border(),
//           errorBorder: errorBorder(),
//           labelText: labelText,
//           hintText: hintText,
//           labelStyle: black16(),
//           hintStyle: hint16()),
//       style: black16(),
//     );
//   }
// }