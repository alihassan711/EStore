import 'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  Widget widget;
  var labelText;
  bool obscure;
  final TextEditingController textEditingController;
  final TextInputType? textInputType;
  bool? enabled;

  //bool numpad;

  MyTextField(
      this.widget, {
        this.labelText,
        required this.obscure,
        required this.textEditingController,
        this.textInputType,
        this.enabled,
      });

  // String hintText;
  // String labelText;
  // MyTextField({required this.hintText});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
        child: Container(
          color: Color(0xfff5f5f5),
          child: TextFormField(
            //  keyboardType: keayboradtype,
            obscureText: obscure,
            controller: textEditingController,
            keyboardType: textInputType,
            enabled: enabled,
            style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: labelText,
                prefixIcon: widget,
                labelStyle: TextStyle(fontSize: 15)),
            //onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}