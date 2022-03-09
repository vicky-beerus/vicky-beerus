import 'package:admintemplecity/COMMON_WIDGETS/costom_appbar.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_switch.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/MORE/busy_in_kitchen.dart';
import 'package:admintemplecity/MORE/customer_complaints.dart';
import 'package:admintemplecity/MORE/order_history.dart';
import 'package:admintemplecity/MORE/scudle_off_time_page.dart';
import 'package:flutter/material.dart';

class MoreFirstPage extends StatefulWidget {
  const MoreFirstPage({Key? key}) : super(key: key);

  @override
  _MoreFirstPageState createState() => _MoreFirstPageState();
}

class _MoreFirstPageState extends State<MoreFirstPage> {
  bool receivingOrders = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.08),
        child: CustomAppBar(
          leadingWant: true,
          appTitle1: "Settings",
          appTitle2: "",
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
              ))),
              child: Row(
                children: [
                  Container(height: h * 0.1, width: w * 0.05),
                  Container(
                    height: h * 0.1,
                    width: w * 0.6,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        text: "Receiving Orders",
                        color: Color(0xff707070),
                        size: 20,
                      ),
                    ),
                  ),
                  Container(height: h * 0.1, width: w * 0.1),
                  Container(
                    height: h * 0.1,
                    width: w * 0.2,
                    child: CustomSwitch(
                        width: w * 0.15,
                        height: h * 0.04,
                        value: receivingOrders,
                        onChange: (val) {
                          setState(() {
                            receivingOrders = !receivingOrders;
                          });
                        }),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h * 0.025,
            ),
            Container(
              height: h * 0.4,
              width: w * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border: Border.all(color: Colors.grey.withOpacity(0.4))),
              child: Column(
                children: [
                  moreContainer(h, w, ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BusyInKitchen()));
                  },
                      image: Image.asset("assets/more/cookingtime.png"),
                      mainText: "Busy in Kitchen",
                      subText: "off"),
                  moreContainer(h, w,
                      image: Image.asset("assets/icons/greyclock.png"),
                      mainText: "Schedule Off time", ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScheduleOffTime()));
                  }, subText: ""),
                  moreContainer(
                    h,
                    w,
                    image: Image.asset("assets/more/foodtray.png"),
                    mainText: "Order History",
                    subText: "",
                    ontap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderHistory()));
                    },
                  ),
                  moreContainer(h, w,
                      image: Image.asset("assets/more/report.png"),
                      mainText: "Customer Compliants", ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomerComplaints()));
                  }, subText: ""),
                  moreContainer(h, w,
                      image: Image.asset("assets/more/logout.png"),
                      mainText: "Logout",
                      subText: "",
                      pos: 1)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  moreContainer(double h, double w, {image, mainText, subText, pos, ontap}) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: pos == 1 ? h * 0.075 : h * 0.08,
        width: w * 0.95,
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: pos == null
                        ? Colors.grey.withOpacity(0.4)
                        : Colors.white))),
        child: Row(
          children: [
            Container(
              height: h * 0.08,
              width: w * 0.11,
              child: image,
            ),
            Container(
                height: h * 0.08,
                width: w * 0.55,
                alignment: Alignment.centerLeft,
                child: CustomText(
                  text: mainText,
                  size: 18,
                  color: Color(0xff707070),
                )),
            Container(
              height: h * 0.08,
              width: w * 0.27,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: h * 0.08,
                    width: w * 0.15,
                    alignment: Alignment.centerRight,
                    child: CustomText(
                      text: subText,
                      size: 18,
                      color: Color(0xff707070),
                    ),
                  ),
                  Container(
                    height: h * 0.08,
                    width: w * 0.1,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff707070),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
