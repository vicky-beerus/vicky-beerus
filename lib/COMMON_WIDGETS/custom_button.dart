import 'package:flutter/material.dart';

import 'custom_text.dart';

class Custom_Button extends StatefulWidget {
  double? height;
  double? width;
  String? text;
  GestureTapCallback? onTap;
  BorderRadius? borderRadius;
  Color? color;
  Custom_Button(
      {this.width,
      this.height,
      this.onTap,
      this.text,
      this.color,
      this.borderRadius});
  @override
  _Custom_ButtonState createState() => _Custom_ButtonState();
}

class _Custom_ButtonState extends State<Custom_Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: widget.color == null ? Color(0xff362222) : widget.color,
          borderRadius: widget.borderRadius == null
              ? BorderRadius.circular(10)
              : widget.borderRadius,
          gradient: widget.color == null
              ? LinearGradient(
                  colors: <Color>[Color(0xff362222), Color(0xff362222)])
              : null),
      child: TextButton(
          onPressed: widget.onTap,
          child: CustomText(
            text: "${widget.text}",
            color: Colors.white,
          )),
    );
  }
}
