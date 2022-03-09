import 'package:admintemplecity/COMMON_WIDGETS/costom_appbar.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/NEW_ORDER_PAGE/order_items_list.dart';
import 'package:admintemplecity/NEW_ORDER_PAGE/report_complaints.dart';
import 'package:admintemplecity/REPORT/report_items.dart';
import 'package:flutter/material.dart';

class ReportMainPage extends StatefulWidget {
  const ReportMainPage({Key? key}) : super(key: key);

  @override
  _ReportMainPageState createState() => _ReportMainPageState();
}

class _ReportMainPageState extends State<ReportMainPage> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.08),
        child: CustomAppBar(
          appTitle1: "Business",
          appTitle2: "Insights",
          leadingWant: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * 0.08,
              width: w,
              child: Row(
                children: [
                  Container(
                    height: h * 0.08,
                    width: w * 0.5,
                    padding: EdgeInsets.only(top: h * 0.025, left: w * 0.05),
                    child: CustomText(
                      text: "Delivered Orders",
                      color: Color(0xff707070),
                      size: 20,
                    ),
                  ),
                  SizedBox(
                    width: w * 0.2,
                  ),
                  Container(
                    height: h * 0.08,
                    width: w * 0.3,
                    child: Center(
                      child: CustomText(
                        text: "see more >",
                        color: Color(0xff275A93),
                      ),
                    ),
                  )
                ],
              ),
            ),
            detailCard(h, w, color: Color(0xffE6AC4C)),
            Container(
              height: h * 0.08,
              width: w,
              child: Row(
                children: [
                  Container(
                    height: h * 0.08,
                    width: w * 0.7,
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.04,
                          width: w * 0.7,
                          padding:
                              EdgeInsets.only(left: w * 0.05, top: h * 0.01),
                          child: CustomText(
                            text: "Delivered Orders",
                            size: 16,
                            color: Color(0xff707070),
                          ),
                        ),
                        Container(
                          height: h * 0.04,
                          width: w * 0.7,
                          padding:
                              EdgeInsets.only(left: w * 0.05, top: h * 0.01),
                          child: CustomText(
                            text: "Last sales from orders rejected by you",
                            color: Color(0xff707070),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: h * 0.08,
                    width: w * 0.3,
                    child: Center(
                      child: CustomText(
                        text: "see more >",
                        color: Color(0xff275A93),
                      ),
                    ),
                  )
                ],
              ),
            ),
            detailCard(h, w, color: Color(0xff4A3838), textColor: Colors.white),
            reportCotainer(h, w,
                title: "Fast selling dishes in your menu",
                date: "19-25 May 2022"),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.08,
              width: w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: w * 0.05, top: h * 0.02),
                    height: h * 0.08,
                    width: w * 0.395,
                    color: Color(0xffE6AC4C),
                    child: CustomText(
                      text: "Menu items",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: w * 0.03, top: h * 0.02),
                    height: h * 0.08,
                    width: w * 0.295,
                    color: Color(0xffE6AC4C),
                    child: CustomText(
                      text: "Revenue \ncomtribution",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: w * 0.03, top: h * 0.02),
                    height: h * 0.08,
                    width: w * 0.295,
                    color: Color(0xffE6AC4C),
                    child: CustomText(
                      text: "Quantity sold",
                    ),
                  ),
                ],
              ),
            ),
            ReportItems(),
            Container(
              height: h * 0.08,
              width: w,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.7)))),
            ),
            reportCotainer(h, w,
                title: "Customer complaints", date: "19-25 May 2022"),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.08,
              width: w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: w * 0.05, top: h * 0.02),
                    height: h * 0.08,
                    width: w * 0.395,
                    color: Color(0xffE6AC4C),
                    child: CustomText(
                      text: "Menu items",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: w * 0.03, top: h * 0.02),
                    height: h * 0.08,
                    width: w * 0.295,
                    color: Color(0xffE6AC4C),
                    child: CustomText(
                      text: "Revenue \ncomtribution",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: w * 0.03, top: h * 0.02),
                    height: h * 0.08,
                    width: w * 0.295,
                    color: Color(0xffE6AC4C),
                    child: CustomText(
                      text: "Quantity sold",
                    ),
                  ),
                ],
              ),
            ),
            ReportItems(),
            Container(
              height: h * 0.08,
              width: w,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
            ),
            Container(
              height: h * 0.08,
              width: w,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey.withOpacity(0.7)))),
            ),
            reportCotainer(h, w,
                title: "Customer complaints", date: "19-25 May 2022"),
            Container(
              height: h * 0.15,
              width: w,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Container(
                    height: h * 0.06,
                    width: w * 0.9,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Color(0xffE6AC4C),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(10))),
                    child: CustomText(
                      text: "1 Order with customer complaints",
                    ),
                  ),
                  Container(
                      height: h * 0.06,
                      width: w * 0.9,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xff362222),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(10))),
                      child: Row(
                        children: [
                          CustomText(
                            color: Colors.white,
                            text: "Poor packing or leakage",
                          ),
                          SizedBox(
                            width: w * 0.2,
                          ),
                          CustomText(
                            color: Colors.white,
                            text: "1 orders",
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                          )
                        ],
                      )),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            reportCotainer(h, w,
                title: "Customer complaints", date: "19-25 May 2022"),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.05,
              width: w,
              padding: EdgeInsets.all(10),
              child: CustomText(
                text: "Delivered orders 119",
                color: Color(0xff707070),
              ),
            ),
            ReportComplaints(),
            SizedBox(
              height: h * 0.1,
            ),
          ],
        ),
      ),
    );
  }

  Container reportCotainer(double h, double w, {title, date, ontap}) {
    return Container(
      height: h * 0.08,
      width: w,
      child: Row(
        children: [
          Container(
            height: h * 0.08,
            width: w * 0.7,
            child: Column(
              children: [
                Container(
                  height: h * 0.04,
                  width: w * 0.7,
                  padding: EdgeInsets.only(left: w * 0.05, top: h * 0.01),
                  child: CustomText(
                    text: title,
                    size: 16,
                    color: Color(0xff707070),
                  ),
                ),
                Container(
                    height: h * 0.04,
                    width: w * 0.7,
                    padding: EdgeInsets.only(left: w * 0.05, top: h * 0.01),
                    child: Row(
                      children: [
                        CustomText(
                          text: "Details from",
                          color: Color(0xff707070),
                        ),
                        InkWell(
                          onTap: ontap,
                          child: Container(
                              child: Row(
                            children: [
                              CustomText(
                                text: date,
                                color: Color(0xff275A93),
                              ),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Color(0xff275A93),
                              )
                            ],
                          )),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Stack detailCard(
    double h,
    double w, {
    color,
    textColor,
  }) {
    return Stack(
      children: [
        Container(
          height: h * 0.3,
          width: w,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
        ),
        Positioned(
          top: h * 0.03,
          left: w * 0.05,
          child: Container(
            height: h * 0.1,
            width: w * 0.9,
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
          ),
        ),
        Positioned(
          top: h * 0.04,
          left: w * 0.07,
          child: CustomText(
            text: "Yesterday",
            color: textColor,
          ),
        ),
        Positioned(
          top: h * 0.07,
          left: w * 0.07,
          child: CustomText(
            text: "₹2,468",
            color: textColor,
            size: 16,
          ),
        ),
        Positioned(
          top: h * 0.1,
          left: w * 0.07,
          child: CustomText(
            text: "9 Orders",
            color: textColor,
          ),
        ),
        Positioned(
          bottom: h * 0.068,
          left: w * 0.05,
          child: Container(
            height: h * 0.1,
            width: w * 0.448,
            decoration: BoxDecoration(
                color: color,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(10))),
          ),
        ),
        Positioned(
          top: h * 0.15,
          left: w * 0.07,
          child: CustomText(
            text: "Last Week: 19-25 May",
            size: 12,
            color: textColor,
          ),
        ),
        Positioned(
          top: h * 0.18,
          left: w * 0.07,
          child: CustomText(
            text: "₹ 2,468",
            size: 16,
            color: textColor,
          ),
        ),
        Positioned(
          top: h * 0.21,
          left: w * 0.07,
          child: CustomText(
            text: "9 Orders",
            color: textColor,
          ),
        ),
        Positioned(
          bottom: h * 0.068,
          right: w * 0.05,
          child: Container(
            height: h * 0.1,
            width: w * 0.448,
            decoration: BoxDecoration(
                color: color,
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(10))),
          ),
        ),
        Positioned(
          top: h * 0.15,
          right: w * 0.15,
          child: CustomText(
            text: "Last Week: 19-25 May",
            size: 12,
            color: textColor,
          ),
        ),
        Positioned(
          top: h * 0.18,
          left: w * 0.52,
          child: CustomText(
            text: "₹ 2,468",
            size: 16,
            color: textColor,
          ),
        ),
        Positioned(
          top: h * 0.21,
          left: w * 0.52,
          child: CustomText(
            text: "9 Orders",
            color: textColor,
          ),
        ),
      ],
    );
  }
}
