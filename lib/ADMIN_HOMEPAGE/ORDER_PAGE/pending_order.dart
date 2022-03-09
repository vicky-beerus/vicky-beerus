import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';

import 'package:flutter/material.dart';

import '../../NEW_ORDER_PAGE/order_items_list.dart';

class BendingOrderList extends StatefulWidget {
  const BendingOrderList({Key? key}) : super(key: key);

  @override
  _BendingOrderListState createState() => _BendingOrderListState();
}

class _BendingOrderListState extends State<BendingOrderList> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: h * 0.1,
                    width: w,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.4)))),
                  ),
                  Positioned(
                    top: h * 0.012,
                    left: w * 0.05,
                    child: CustomText(
                      text: "Order ID : 7821",
                      color: Color(0xff707070),
                      size: 18,
                    ),
                  ),
                  Positioned(
                    top: h * 0.02,
                    right: w * 0.05,
                    child: CustomText(
                      text: "8:40 PM",
                      color: Color(0xff707070),
                      size: 16,
                    ),
                  ),
                  Positioned(
                    bottom: h * 0.01,
                    left: w * 0.05,
                    child: buildContainer(h, w,
                        text: "Preparing", color: Color(0xff3A86DE)),
                  ),
                  Positioned(
                      bottom: h * 0.015,
                      left: w * 0.32,
                      child: CustomText(
                        text: "Ordered By TamilMaran",
                        color: Color(0xff707070),
                      ))
                ],
              ),
              Container(
                height: h * 0.06,
                width: w,
                padding: EdgeInsets.only(top: h * 0.015, left: w * 0.05),
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(color: Colors.grey.withOpacity(0.4)))),
                child: CustomText(
                  text: "Items Ordered",
                  color: Color(0xff707070),
                  size: 16,
                ),
              ),
              OrderItemList(),
              Stack(
                children: [
                  Container(
                      height: h * 0.25,
                      width: w,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Colors.grey.withOpacity(0.4)),
                              bottom: BorderSide(
                                  color: Colors.grey.withOpacity(0.4),
                                  width: h * 0.01)))),
                  Positioned(
                    top: h * 0.01,
                    left: w * 0.05,
                    child: CustomText(
                      text: "Grand Total",
                      color: Color(0xff707070),
                      size: 18,
                    ),
                  ),
                  Positioned(
                      top: h * 0.01,
                      left: w * 0.32,
                      child: buildContainer(h, w,
                          text: "PAID", color: Color(0xffA2B9C6))),
                  Positioned(
                    top: h * 0.01,
                    right: w * 0.05,
                    child: CustomText(
                      text: "₹460",
                      color: Color(0xff707070),
                      size: 18,
                    ),
                  ),
                  Positioned(
                    top: h * 0.07,
                    left: w * 0.05,
                    child: Custom_Button(
                      height: h * 0.06,
                      width: w * 0.9,
                      color: Color(0xff7F98A7),
                      text: "Assigning a delivery partner soon",
                    ),
                  ),
                  Positioned(
                    bottom: h * 0.035,
                    left: w * 0.1,
                    child: Container(
                      height: h * 0.06,
                      width: w * 0.8,
                      color: Color(0xffFABB51),
                      child: Center(
                        child: CustomText(
                          text: "Order Ready (14:24)",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          );
        });
  }

  Container buildContainer(double h, double w, {text, color}) {
    return Container(
      height: h * 0.03,
      width: w * 0.25,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(2)),
      child: Center(
        child: CustomText(
          text: text,
          color: Colors.white,
          size: 12,
        ),
      ),
    );
  }
}
