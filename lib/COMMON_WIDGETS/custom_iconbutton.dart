import 'package:flutter/material.dart';

class CustomIconButton extends StatefulWidget {
  Icon? icon;
  Color? color;
  GestureTapCallback? onpressed;
  CustomIconButton({this.icon, this.color, this.onpressed});
  @override
  _CustomIconButtonState createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onpressed,
      child: Container(
        height: h * 0.045,
        width: w * 0.09,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: widget.color == null ? Color(0xffFABB51) : widget.color),
        child: Center(
          child: widget.icon == null
              ? Icon(
                  Icons.add,
                  color: Colors.white,
                )
              : widget.icon,
        ),
      ),
    );

    // IconButton(
    //   onPressed: widget.onpressed,
    //   icon: widget.icon == null
    //       ? Icon(
    //           Icons.add_circle,
    //           color: widget.color == null ? Color(0xffFABB51) : widget.color,
    //         )
    //       : widget.icon);
  }
}
