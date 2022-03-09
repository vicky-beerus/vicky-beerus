import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:flutter/material.dart';

class EmptyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Container(
      height: h * 0.65,
      width: w,
      child: Column(
        children: [
          Container(
            height: h * 0.15,
            width: w,
          ),
          Container(
              height: h * 0.2,
              width: w,
              child: Center(
                child: Container(
                  height: h * 0.2,
                  width: w * 0.5,
                  child: Image.asset(
                    "assets/homepage/dish.png",
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Container(
              height: h * 0.06,
              width: w,
              child: Center(
                child: CustomText(
                  text: "You are Online",
                  color: Color(0xff959595),
                ),
              )),
          Container(
            alignment: Alignment.topCenter,
            height: h * 0.06,
            width: w,
            child: CustomText(
              size: 18,
              text: "Waiting for new Orders",
              color: Color(0xff959595),
            ),
          )
        ],
      ),
    );
  }
}
