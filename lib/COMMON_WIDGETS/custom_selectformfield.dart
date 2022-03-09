import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

class CustomSelectFormField extends StatefulWidget {
  double? height;
  double? width;
  TextStyle? style;
  EdgeInsetsGeometry? padding;
  TextEditingController? selectController;
  List<Map<String, dynamic>> items;
  CustomSelectFormField(
      {this.height,
      this.width,
      required this.items,
      this.style,
      this.padding,
      this.selectController});
  @override
  _CustomSelectFormFieldState createState() => _CustomSelectFormFieldState();
}

class _CustomSelectFormFieldState extends State<CustomSelectFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xff8D8989CC).withOpacity(0.4),
            )),
        child: SelectFormField(
          style: widget.style,
          items: widget.items,
          controller: widget.selectController,
          decoration: InputDecoration(
              contentPadding: widget.padding,
              border: InputBorder.none,
              suffixIcon: Icon(
                Icons.arrow_drop_down,
                color: Colors.grey,
              )),
        ));
  }
}
