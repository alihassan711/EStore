import 'package:auto_size_text/auto_size_text.dart';
import 'package:estore/constants/strings.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBlinkingButton extends StatefulWidget {
  Function()? onPress;
   MyBlinkingButton({this.onPress,Key? key}) : super(key: key);

  @override
  _MyBlinkingButtonState createState() => _MyBlinkingButtonState();
}

class _MyBlinkingButtonState extends State<MyBlinkingButton>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationController!.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animationController!,
      child: MaterialButton(
        onPressed: widget.onPress,
        child:  AutoSizeText(Constants.addNewProduct),
        color: Colors.green,
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
