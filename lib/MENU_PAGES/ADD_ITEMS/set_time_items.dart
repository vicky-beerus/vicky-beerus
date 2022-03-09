import 'package:admintemplecity/COMMON_WIDGETS/costom_appbar.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_selectformfield.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:flutter/material.dart';

class SetTimeItem extends StatefulWidget {
  @override
  _SetTimeItemState createState() => _SetTimeItemState();
}

class _SetTimeItemState extends State<SetTimeItem> {
  final List<Map<String, dynamic>> itemsTimes2 = [
    {
      'value': 'AM',
      'label': 'AM',
    },
    {
      'value': 'PM',
      'label': 'PM',
    },
  ];

  List<Widget> slotList = [];
  final List<Map<String, dynamic>> itemsTime = [
    {
      'value': '1:00',
      'label': '1:00',
    },
    {
      'value': '2:00',
      'label': '2:00',
    },
    {
      'value': '3:00',
      'label': '3:00',
    },
    {
      'value': '4:00',
      'label': '4:00',
    },
    {
      'value': '5:00',
      'label': '5:00',
    },
    {
      'value': '6:00',
      'label': '6:00',
    },
    {
      'value': '7:00',
      'label': '7:00',
    },
    {
      'value': '8:00',
      'label': '8:00',
    },
    {
      'value': '9:00',
      'label': '9:00',
    },
    {
      'value': '10:00',
      'label': '10:00',
    },
    {
      'value': '11:00',
      'label': '11:00',
    },
    {
      'value': '12:00',
      'label': '12:00',
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
            appTitle1: 'Set',
            appTitle2: "Time",
            leadingWant: true,
          ),
        ),
        body: Container(
          height: h,
          width: w,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.02,
                ),
                Container(
                  height: h * 0.06,
                  width: w,
                  color: const Color(0xffEBE8E8),
                  child: Center(
                    child: CustomText(
                      text: "Add and Modify Category timings here",
                      color: const Color(0xff707070),
                    ),
                  ),
                ),
                slotStack(
                  h: h,
                  w: w,
                ),
                Column(
                  children: slotList,
                )
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          height: h * 0.1,
          width: w,
          child: Center(
            child: Custom_Button(
              height: h * 0.06,
              width: w * 0.9,
              text: "Save",
              color: Color(0xffFABB51),
            ),
          ),
        ));
  }

  Stack slotStack({h, w}) {
    return Stack(
      children: [
        Container(
          height: h * 0.2,
          width: w,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: h * 0.005,
                      color: Color(0xff707070).withOpacity(0.2)))),
        ),
        Positioned(
            top: h * 0.01,
            left: w * 0.05,
            child: CustomText(text: "Slot 1", color: Color(0xff707070))),
        Positioned(
            top: h * 0.05,
            left: w * 0.05,
            child: Image.asset("assets/icons/greyclock.png")),
        Positioned(
            top: h * 0.052,
            left: w * 0.15,
            child: CustomText(
              text: "Start time",
              color: Color(0xff707070),
              size: 14,
            )),
        Positioned(
            bottom: h * 0.06,
            left: w * 0.05,
            child: Image.asset("assets/icons/greyclock.png")),
        Positioned(
            bottom: h * 0.062,
            left: w * 0.15,
            child: CustomText(
                size: 14, text: "Start time", color: Color(0xff707070))),
        Positioned(
          top: h * 0.05,
          right: w * 0.3,
          child: CustomSelectFormField(
            items: itemsTime,
            style: TextStyle(fontSize: 12),
            height: h * 0.03,
            width: w * 0.25,
            padding: EdgeInsets.only(bottom: h * 0.02, left: w * 0.01),
          ),
        ),
        Positioned(
          top: h * 0.11,
          right: w * 0.3,
          child: CustomSelectFormField(
            style: TextStyle(fontSize: 12),
            items: itemsTime,
            height: h * 0.03,
            width: w * 0.25,
            padding: EdgeInsets.only(bottom: h * 0.02, left: w * 0.01),
          ),
        ),
        Positioned(
          top: h * 0.11,
          right: w * 0.03,
          child: CustomSelectFormField(
            items: itemsTimes2,
            height: h * 0.03,
            padding: EdgeInsets.only(
              left: w * 0.01,
              bottom: h * 0.02,
            ),
            style: TextStyle(fontSize: 12),
            width: w * 0.25,
          ),
        ),
        Positioned(
          top: h * 0.05,
          right: w * 0.03,
          child: CustomSelectFormField(
            items: itemsTimes2,
            height: h * 0.03,
            padding: EdgeInsets.only(
              left: w * 0.01,
              bottom: h * 0.02,
            ),
            style: TextStyle(fontSize: 12),
            width: w * 0.25,
          ),
        ),
        Positioned(
            bottom: 0,
            child: InkWell(
              onTap: () {
                setState(() {
                  // slotList.clear();
                  if (slotList.length <= 5) {
                    slotList.add(slotStack(
                      h: h,
                      w: w,
                    ));
                  }
                });
              },
              child: Container(
                height: h * 0.05,
                width: w * 0.4,
                child: Row(
                  children: [
                    Container(
                      height: h * 0.05,
                      width: w * 0.1,
                      alignment: Alignment.centerRight,
                      child: const Icon(
                        Icons.add,
                        color: Color(0xff3A86DE),
                      ),
                    ),
                    Container(
                      height: h * 0.05,
                      width: w * 0.3,
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        text: "Add Slot",
                        color: const Color(0xff3A86DE),
                      ),
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
