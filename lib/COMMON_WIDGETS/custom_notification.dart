import 'package:flutter/material.dart';

import 'custom_text.dart';

class Custom_Notification extends StatefulWidget {
  String? notificationCount;
  GestureTapCallback? onTap;
  Custom_Notification({this.notificationCount, this.onTap});
  @override
  _Custom_NotificationState createState() => _Custom_NotificationState();
}

class _Custom_NotificationState extends State<Custom_Notification> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            height: h * 0.05,
            width: w * 0.1,
            //color: Colors.blue,
            child: Center(
              child: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          Positioned(
            right: w * 0.008,
            top: h * 0.01,
            child: Container(
              padding: EdgeInsets.all(1),
              height: h * 0.02,
              width: w * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffFABB51),
              ),
              child: Center(
                child: CustomText(
                  color: Colors.white,
                  text: "${widget.notificationCount}",
                  size: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
