import 'package:admintemplecity/COMMON_WIDGETS/costom_appbar.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_checkcircle.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:flutter/material.dart';

class BusyInKitchen extends StatefulWidget {
  const BusyInKitchen({Key? key}) : super(key: key);

  @override
  _BusyInKitchenState createState() => _BusyInKitchenState();
}

class _BusyInKitchenState extends State<BusyInKitchen> {
  bool timeIncrease = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.08),
        child: CustomAppBar(
          appTitle1: "Busy in ",
          appTitle2: "Kitchen",
          leadingWant: true,
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.1,
              width: w,
              padding: EdgeInsets.only(left: w * 0.05),
              color: Color(0xffEBE8E8),
              child: Center(
                child: CustomText(
                  text:
                      "When Kitchen is busy and you need more time to manage orders",
                ),
              ),
            ),
            SizedBox(height: h * 0.01),
            Container(
              height: h * 0.08,
              width: w,
              padding: EdgeInsets.only(left: w * 0.05, top: h * 0.025),
              child: CustomText(
                text: "How this helps you",
                color: Color(0xff6D6B6B),
                size: 18,
              ),
            ),
            Container(
              height: h * 0.03,
              width: w,
              padding: EdgeInsets.only(left: w * 0.05),
              child: CustomText(
                text: "1. Get more time to prepare food",
                color: Color(0xff6D6B6B),
              ),
            ),
            Container(
              height: h * 0.05,
              width: w,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
              padding: EdgeInsets.only(left: w * 0.05),
              child: CustomText(
                text: "2. Show exact time for delivery to customers",
                color: Color(0xff6D6B6B),
              ),
            ),
            Container(
              height: h * 0.05,
              width: w,
              padding: EdgeInsets.only(left: w * 0.05, top: h * 0.02),
              child: CustomText(
                text: "Increase food preparation time for the next",
                color: Color(0xff6D6B6B),
              ),
            ),
            timeIncreaseContainer(h, w, text: "30 mins", ontap: () {
              setState(() {
                timeIncrease = !timeIncrease;
              });
            }, bools: timeIncrease),
            timeIncreaseContainer(h, w, text: "50 mins", ontap: () {
              setState(() {
                timeIncrease = !timeIncrease;
              });
            }, bools: timeIncrease),
            timeIncreaseContainer(h, w, text: "1 hour", ontap: () {
              setState(() {
                timeIncrease = !timeIncrease;
              });
            }, bools: timeIncrease),
            timeIncreaseContainer(h, w, text: "1 hour 30 mins", ontap: () {
              setState(() {
                timeIncrease = !timeIncrease;
              });
            }, bools: timeIncrease),
            SizedBox(
              height: h * 0.05,
            ),
            Custom_Button(
              height: h * 0.06,
              width: w * 0.9,
              text: "Proceed",
              color: Color(0xffFABB51),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  Container timeIncreaseContainer(double h, double w, {bools, ontap, text}) {
    return Container(
      height: h * 0.06,
      width: w,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: w * 0.05),
            child: CheckCircle(
              height: h * 0.035,
              width: w * 0.07,
              changer: bools,
              onTap: ontap,
            ),
          ),
          SizedBox(
            height: h * 0.06,
            width: w * 0.015,
          ),
          Container(
            height: h * 0.06,
            width: w * 0.4,
            alignment: Alignment.centerLeft,
            child: CustomText(
              text: text,
            ),
          )
        ],
      ),
    );
  }
}
