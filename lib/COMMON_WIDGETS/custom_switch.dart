import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class CustomSwitch extends StatefulWidget {
  double height;
  double width;
  bool? value;

  Function(bool?) onChange;

  Color? givenColor;

  CustomSwitch({
    required this.width,
    required this.height,
    this.value,
    required this.onChange,
    this.givenColor,
  });
  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return FlutterSwitch(
      height: widget.height,
      width: widget.width,
      value: widget.value == false ? false : true,
      onToggle: widget.onChange,
      activeColor: Colors.green,
    );
  }
}
