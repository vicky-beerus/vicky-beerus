import 'package:admintemplecity/COMMON_WIDGETS/costom_appbar.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/NEW_ORDER_PAGE/order_items_list.dart';
import 'package:flutter/material.dart';

class CustomerComplaints extends StatefulWidget {
  const CustomerComplaints({Key? key}) : super(key: key);

  @override
  _CustomerComplaintsState createState() => _CustomerComplaintsState();
}

class _CustomerComplaintsState extends State<CustomerComplaints> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.08),
        child: CustomAppBar(
          appTitle1: "Customer",
          appTitle2: " Complaints",
          leadingWant: true,
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.1,
                  width: w,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey.withOpacity(0.4)))),
                ),
                Positioned(
                  top: h * 0.02,
                  left: w * 0.05,
                  child: CustomText(
                    text: "Order ID : 7821",
                    color: Color(0xff707070),
                  ),
                ),
                Positioned(
                  top: h * 0.02,
                  right: w * 0.05,
                  child: CustomText(
                    text: "19 Feb 2022 | 8:40 pm",
                    color: Color(0xff707070),
                  ),
                ),
                Positioned(
                  bottom: h * 0.02,
                  left: w * 0.05,
                  child: CustomText(
                    text: "Reported by Tamilmaran",
                    color: Color(0xff707070),
                  ),
                ),
              ],
            ),
            Container(
              height: h * 0.08,
              width: w,
              padding: EdgeInsets.all(20),
              child: CustomText(
                text: "Items Reported",
                size: 16,
                color: Color(0xff707070),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: h * 0.06,
                  width: w,
                ),
                Positioned(
                  top: h * 0.015,
                  left: w * 0.05,
                  child: CustomText(
                    text: "2",
                    size: 16,
                    color: Color(0xff707070),
                  ),
                ),
                Positioned(
                    top: h * 0.02,
                    left: w * 0.12,
                    child: Icon(
                      Icons.clear,
                      color: Color(0xff707070),
                      size: 15,
                    )),
                Positioned(
                  top: h * 0.015,
                  left: w * 0.18,
                  child: CustomText(
                    text: "Veg Meals",
                    size: 16,
                    color: Color(0xff707070),
                  ),
                ),
              ],
            ),
            Container(
              height: h * 0.08,
              width: w,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
              child: CustomText(
                  color: Color(0xff707070),
                  text: "Package was not good. Food spilled inside the cover"),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: h * 0.05,
              width: w,
              child: CustomText(
                color: Color(0xff707070),
                text: "Image shared by Customer",
              ),
            ),
            Container(
              height: h * 0.2,
              width: w,
              child: Image.asset(
                "assets/foods/food.png",
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Custom_Button(
              height: h * 0.06,
              width: w * 0.9,
              color: Color(0xffFABB51),
              text: "Reply to Customer",
            )
          ],
        ),
      ),
    );
  }
}
