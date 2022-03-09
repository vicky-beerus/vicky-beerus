import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomAppBar extends StatefulWidget {
  String? appTitle1;
  String? appTitle2;
  Color? appBarColor;
  bool? leadingWant;
  List<Widget>? actions;

  CustomAppBar(
      {this.appTitle1,
      this.appTitle2,
      this.appBarColor,
      this.leadingWant,
      this.actions});
  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return AppBar(
      actions: widget.actions,
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor:
          widget.appBarColor == null ? Color(0xff362222) : widget.appBarColor,
      title: Container(
        height: h * 0.05,
        width: w * 0.7,
        child: Row(
          children: [
            Container(
              child: widget.leadingWant == true && widget.leadingWant != null
                  ? IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  : Container(
                      height: h * 0.02,
                      width: w * 0.04,
                    ),
            ),
            CustomText(
              text: "${widget.appTitle1}",
              size: 16,
              color: Color(0xffFABB51),
            ),
            Padding(
              padding: EdgeInsets.only(left: w * 0.01),
              child: CustomText(
                  text: "${widget.appTitle2}", color: Colors.white, size: 16),
            )
          ],
        ),
      ),
      // leading: IconButton(
      //   icon: Icon(
      //     Icons.arrow_back_ios,
      //     color: Colors.white,
      //   ),
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // )
    );
  }
}
