import 'package:admintemplecity/COMMON_WIDGETS/costom_appbar.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_checkcircle.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_selectformfield.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/MORE/order_histroy_list.dart';
import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  bool filterBool = false;
  final List<Map<String, dynamic>> selectEvent = [
    {
      'value': 'Yesterday',
      'label': 'Yesterday',
    },
    {
      'value': 'Last 2 days',
      'label': 'Last 2 days',
    },
    {
      'value': 'Last Week',
      'label': 'Last Week',
    },
    {
      'value': 'Custom date',
      'label': 'Custom date',
    },
  ];
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.08),
        child: CustomAppBar(
          appTitle1: "Order",
          appTitle2: "History",
          leadingWant: true,
        ),
      ),
      body: Container(
        height: h,
        width: w,
        child: Column(
          children: [
            Container(
              height: h * 0.1,
              width: w,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.4),
                          width: h * 0.005))),
              child: Row(
                children: [
                  SizedBox(
                    height: h * 0.08,
                    width: w * 0.05,
                  ),
                  Container(
                    child: CustomSelectFormField(
                      style: TextStyle(fontSize: 15),
                      height: h * 0.06,
                      width: w * 0.4,
                      items: selectEvent,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.08,
                    width: w * 0.25,
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10))),
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: h * 0.7,
                              width: w,
                              child: Column(
                                children: [
                                  Container(
                                    height: h * 0.06,
                                    width: w,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey
                                                    .withOpacity(0.4)))),
                                    child: CustomText(
                                      text: "Filter Order History",
                                      color: Color(0xff707070),
                                    ),
                                  ),
                                  filterContainer(h, w, text: "Preparing",
                                      ontap: () {
                                    setState(() {
                                      filterBool = !filterBool;
                                    });
                                  }, changer: filterBool),
                                  filterContainer(h, w, text: "Ready",
                                      ontap: () {
                                    setState(() {
                                      filterBool = !filterBool;
                                    });
                                  }, changer: filterBool),
                                  filterContainer(h, w, text: "Picked Up",
                                      ontap: () {
                                    setState(() {
                                      filterBool = !filterBool;
                                    });
                                  }, changer: filterBool),
                                  filterContainer(h, w, text: "Picked Up",
                                      ontap: () {
                                    setState(() {
                                      filterBool = !filterBool;
                                    });
                                  }, changer: filterBool),
                                  filterContainer(h, w, text: "Cancelled",
                                      ontap: () {
                                    setState(() {
                                      filterBool = !filterBool;
                                    });
                                  }, changer: filterBool),
                                  filterContainer(h, w, text: "Cancelled by Us",
                                      ontap: () {
                                    setState(() {
                                      filterBool = !filterBool;
                                    });
                                  }, changer: filterBool),
                                  filterContainer(h, w,
                                      text: "All Cancelled Ordered", ontap: () {
                                    setState(() {
                                      filterBool = !filterBool;
                                    });
                                  }, changer: filterBool),
                                  filterContainer(h, w, text: "Not Accepted",
                                      ontap: () {
                                    setState(() {
                                      filterBool = !filterBool;
                                    });
                                  }, changer: filterBool),
                                  Container(
                                    height: h * 0.08,
                                    width: w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Custom_Button(
                                          height: h * 0.05,
                                          width: w * 0.45,
                                          text: "Apply",
                                          color: Color(0xffFABB51),
                                        ),
                                        Custom_Button(
                                          height: h * 0.05,
                                          width: w * 0.45,
                                          text: "Clear",
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.25,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xff707070).withOpacity(0.4))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                            text: "Filters",
                            color: Color(0xff707070),
                          ),
                          Icon(Icons.menu_open, color: Color(0xff707070))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: h * 0.78,
              width: w,
              child: OrderHistoryList(),
            )
          ],
        ),
      ),
    );
  }

  Container filterContainer(double h, double w, {text, ontap, changer}) {
    return Container(
      height: h * 0.05,
      width: w,
      child: Row(
        children: [
          SizedBox(
            width: w * 0.02,
          ),
          CheckCircle(
            height: h * 0.04,
            width: w * 0.08,
            onTap: ontap,
            changer: changer,
          ),
          SizedBox(
            width: w * 0.02,
          ),
          CustomText(
            text: text,
            size: 16,
            color: Color(0xff707070),
          )
        ],
      ),
    );
  }
}
