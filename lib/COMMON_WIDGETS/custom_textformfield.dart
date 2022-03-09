import "package:flutter/material.dart";

class CustomFormField extends StatefulWidget {
  double? height;
  double? width;
  Color? color;
  TextEditingController? controller;
  Widget? prefix;
  Widget? suffix;
  String? hintText;

  bool? obScureTexts;
  CustomFormField(
      {this.height,
      this.width,
      this.color,
      this.controller,
      this.suffix,
      this.prefix,
      this.hintText,
      this.obScureTexts});
  @override
  _CustomFormFieldState createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: widget.color, borderRadius: BorderRadius.circular(7)),
      child: TextFormField(
        obscureText: widget.obScureTexts == false || widget.obScureTexts == null
            ? false
            : true,
        controller: widget.controller,
        decoration: InputDecoration(
            contentPadding: widget.suffix == null
                ? EdgeInsets.only(left: 9, top: 0.03)
                : EdgeInsets.only(left: 9, top: 9),
            prefixIcon: widget.prefix,
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                fontFamily: "Poppins", color: Colors.grey, fontSize: 14),
            suffixIcon: widget.suffix),
      ),
    );
  }
}
