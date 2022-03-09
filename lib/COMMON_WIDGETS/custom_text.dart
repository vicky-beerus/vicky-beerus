import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  String? text;
  Color? color;
  FontStyle? fontStyle;
  double? size;
  FontWeight? weight;
  CustomText({this.text, this.color, this.fontStyle, this.size, this.weight});
  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "${widget.text}",
      style: TextStyle(
          color: widget.color == null ? Color(0xff362222) : widget.color,
          fontFamily: "Montserrat",
          fontStyle: widget.fontStyle,
          fontSize: widget.size,
          fontWeight: widget.weight),
    );
  }
}
