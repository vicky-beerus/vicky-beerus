import 'package:admintemplecity/COMMON_WIDGETS/costom_appbar.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'order_items_list.dart';

class NewOrdersRecived extends StatefulWidget {
  const NewOrdersRecived({Key? key}) : super(key: key);

  @override
  _NewOrdersRecivedState createState() => _NewOrdersRecivedState();
}

class _NewOrdersRecivedState extends State<NewOrdersRecived> {
  // List order1 = ["Idly","Dosa","Chappahti","Poori","vada"];
  // List order2 = ["veg soup","Butter Naan","Veg Meals"];
  int min = 0;

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.08),
        child: CustomAppBar(
          appTitle1: "New",
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ))
          ],
          leadingWant: false,
          appTitle2: "Orders Received",
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  buildStack(h, w,
                      id: 1,
                      text1: "Order ID : 7821",
                      text2: "Ordered by Tamilmaran",
                      text3: "8:40 pm"),
                  Container(
                    height: h * 0.05,
                    width: w,
                    padding: EdgeInsets.only(left: w * 0.05, top: h * 0.01),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.grey.withOpacity(0.4),
                                width: h * 0.002))),
                    child: CustomText(
                      text: "Items Ordered",
                      color: Color(0xff707070),
                      weight: FontWeight.bold,
                    ),
                  ),
                  OrderItemList(),
                  buildStack(h, w,
                      id: 2,
                      text1: "Grand Total",
                      text2: "Paid via Razorpay",
                      text3: "Rs 460"),
                  Stack(
                    children: [
                      Container(
                        height: h * 0.2,
                        width: w,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    style: BorderStyle.solid,
                                    color: Colors.grey.withOpacity(0.4),
                                    width: h * 0.005))),
                      ),
                      Positioned(
                        top: 0,
                        left: w * 0.05,
                        child: CustomText(
                          text: "Preparation Time",
                          color: Colors.grey,
                        ),
                      ),
                      Positioned(
                          top: h * 0.05,
                          left: w * 0.05,
                          child: InkWell(
                            onTap: () {
                              if (min > 1) {
                                setState(() {
                                  min--;
                                });
                              }
                            },
                            child: Container(
                                height: h * 0.04,
                                width: w * 0.1,
                                color: Color(0xff9FB3BF),
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                          )),
                      Positioned(
                        top: h * 0.05,
                        left: w * 0.155,
                        child: Container(
                          height: h * 0.04,
                          width: w * 0.2,
                          color: Color(0xff9FB3BF),
                          child: Center(
                            child: CustomText(
                              text: "${min} min",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: h * 0.05,
                          left: w * 0.36,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                min++;
                              });
                            },
                            child: Container(
                                height: h * 0.04,
                                width: w * 0.1,
                                color: Color(0xff9FB3BF),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )),
                          )),
                      Positioned(
                        bottom: h * 0.02,
                        left: w * 0.05,
                        child: Custom_Button(
                          height: h * 0.06,
                          width: w * 0.42,
                          borderRadius: BorderRadius.circular(0),
                          color: Color(0xff30AC5E),
                          text: "Accept Order",
                        ),
                      ),
                      Positioned(
                        bottom: h * 0.02,
                        right: w * 0.05,
                        child: Custom_Button(
                          height: h * 0.06,
                          width: w * 0.42,
                          borderRadius: BorderRadius.circular(0),
                          color: Color(0xffCE461B),
                          text: "Reject Order",
                        ),
                      )
                    ],
                  )
                ],
              );
            }),
      ),
    );
  }

  Stack buildStack(double h, double w, {text1, text2, text3, id}) {
    return Stack(
      children: [
        Container(
          height: h * 0.1,
          width: w,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      style: BorderStyle.solid,
                      color:
                          id == 2 ? Colors.white : Colors.grey.withOpacity(0.4),
                      width: h * 0.002))),
        ),
        Positioned(
          top: h * 0.015,
          left: w * 0.05,
          child: CustomText(
            text: text1,
            size: 17,
            color: Color(0xff707070),
          ),
        ),
        Positioned(
          bottom: h * 0.025,
          left: w * 0.05,
          child: CustomText(
            size: 12,
            text: text2,
            color: Color(0xff707070),
          ),
        ),
        Positioned(
          top: h * 0.02,
          right: w * 0.05,
          child: CustomText(
            size: id == 2 ? 16 : 14,
            text: text3,
            color: Color(0xff707070),
          ),
        ),
      ],
    );
  }
}
