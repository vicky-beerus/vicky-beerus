import 'package:admintemplecity/ADMIN_HOMEPAGE/ORDER_PAGE/pending_order.dart';
import 'package:admintemplecity/ADMIN_HOMEPAGE/empty_order.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_notification.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_textformfield.dart';
import 'package:admintemplecity/NEW_ORDER_PAGE/new_orders_pages.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int changeInt = 0;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: h * 0.25,
                  width: w,
                  decoration: BoxDecoration(
                      color: Color(0xff362222),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(15))),
                ),
                Positioned(
                  top: h * 0.07,
                  left: w * 0.05,
                  child: CustomFormField(
                    height: h * 0.055,
                    width: w * 0.75,
                    color: Colors.white,
                    suffix: Icon(
                      Icons.search,
                      color: Color(0xff362222),
                    ),
                  ),
                ),
                Positioned(
                    top: h * 0.07,
                    right: w * 0.05,
                    child: Custom_Notification(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewOrdersRecived()));
                      },
                      notificationCount: "5",
                    )),
                Positioned(
                    bottom: h * 0.04,
                    left: w * 0.05,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          changeInt = 1;
                        });
                      },
                      child: Container(
                          height: h * 0.05,
                          width: w / 3.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Center(
                            child: CustomText(
                              text: "pending(${0})",
                            ),
                          )),
                    )),
                Positioned(
                    bottom: h * 0.04,
                    left: w * 0.36,
                    child: Container(
                      height: h * 0.05,
                      width: w / 3.5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Center(
                        child: CustomText(
                          text: "Order Ready(${0})",
                          size: 12,
                        ),
                      ),
                    )),
                Positioned(
                    bottom: h * 0.04,
                    right: w * 0.05,
                    child: Container(
                        height: h * 0.05,
                        width: w / 3.5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Center(
                          child: CustomText(
                            text: "Picked Up(${0})",
                          ),
                        )))
              ],
            ),
            Container(
              height: h * 0.65,
              width: w,
              child: changeInt == 1 ? BendingOrderList() : EmptyOrder(),
            )
          ],
        ),
      ),
    );
  }
}
