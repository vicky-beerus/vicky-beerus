import 'package:admintemplecity/COMMON_WIDGETS/custom_textformfield.dart';
import 'package:flutter/material.dart';

import '../COMMON_WIDGETS/costom_appbar.dart';
import '../COMMON_WIDGETS/custom_button.dart';
import '../COMMON_WIDGETS/custom_selectformfield.dart';
import '../COMMON_WIDGETS/custom_text.dart';
import 'package:intl/intl.dart';
import 'package:date_time_picker/date_time_picker.dart';

class ScheduleOffTime extends StatefulWidget {
  const ScheduleOffTime({Key? key}) : super(key: key);

  @override
  _ScheduleOffTimeState createState() => _ScheduleOffTimeState();
}

class _ScheduleOffTimeState extends State<ScheduleOffTime> {
  TextEditingController stratDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  var myFormat = DateFormat("yyyy -MM - dd");
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

  Future datePicking() async {
    var date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date == null) return;
    if (date != null) {
      setState(() {
        stratDateController.text = "${myFormat.format(date)}";
      });
      print(stratDateController.text);
    }
  }

  Future datePicking2() async {
    var date2 = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));

    if (date2 == null) return;
    if (date2 != null) {
      setState(() {
        endDateController.text = "${myFormat.format(date2)}";
      });
      print(endDateController.text);
    }
  }

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
                    text: "Will not receive any orders during selected time",
                    color: const Color(0xff707070),
                  ),
                ),
              ),
              slotStack(
                h: h,
                w: w,
              ),
              SizedBox(
                height: h * 0.05,
              ),
              Custom_Button(
                height: h * 0.06,
                width: w * 0.9,
                text: "Proceed",
                color: Color(0xffFABB51),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack slotStack({h, w}) {
    return Stack(
      children: [
        Container(
          height: h * 0.3,
          width: w,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: h * 0.005,
                      color: Color(0xff707070).withOpacity(0.2)))),
        ),
        Positioned(
            top: h * 0.025,
            left: w * 0.05,
            child: CustomText(
              text: "Start Date",
              color: Color(0xff707070),
              size: 14,
            )),
        Positioned(
            top: h * 0.055,
            left: w * 0.05,
            child: Container(
              height: h * 0.06,
              width: w * 0.4,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.4))),
              child: CustomFormField(
                controller: stratDateController,
                suffix: IconButton(
                  onPressed: () {
                    datePicking();
                  },
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ),
                height: h * 0.06,
                width: w * 0.4,
              ),
            )),
        Positioned(
            top: h * 0.17,
            left: w * 0.05,
            child: CustomText(
              text: "End Date",
              color: Color(0xff707070),
              size: 14,
            )),
        Positioned(
            top: h * 0.2,
            left: w * 0.05,
            child: Container(
              height: h * 0.06,
              width: w * 0.4,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.4))),
              child: CustomFormField(
                controller: endDateController,
                suffix: IconButton(
                  onPressed: () {
                    datePicking2();
                  },
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ),
                height: h * 0.06,
                width: w * 0.4,
              ),
            )),
        Positioned(
            top: h * 0.025,
            right: w * 0.35,
            child: CustomText(
              text: "Set Time",
              color: Color(0xff707070),
              size: 14,
            )),
        Positioned(
          top: h * 0.2,
          right: w * 0.25,
          child: CustomSelectFormField(
            items: itemsTime,
            style: TextStyle(fontSize: 12),
            height: h * 0.06,
            width: w * 0.25,
            padding: EdgeInsets.only(top: h * 0.015, left: w * 0.02),
          ),
        ),
        Positioned(
          top: h * 0.055,
          right: w * 0.03,
          child: CustomSelectFormField(
            style: TextStyle(fontSize: 12),
            items: itemsTimes2,
            height: h * 0.06,
            width: w * 0.2,
            padding: EdgeInsets.only(top: h * 0.01, left: w * 0.01),
          ),
        ),
        Positioned(
            top: h * 0.17,
            right: w * 0.35,
            child: CustomText(
              text: "Set Time",
              color: Color(0xff707070),
              size: 14,
            )),
        Positioned(
          top: h * 0.055,
          right: w * 0.25,
          child: CustomSelectFormField(
            items: itemsTime,
            style: TextStyle(fontSize: 12),
            height: h * 0.06,
            width: w * 0.25,
            padding: EdgeInsets.only(top: h * 0.015, left: w * 0.02),
          ),
        ),
        Positioned(
          top: h * 0.2,
          right: w * 0.03,
          child: CustomSelectFormField(
            style: TextStyle(fontSize: 12),
            items: itemsTimes2,
            height: h * 0.06,
            width: w * 0.2,
            padding: EdgeInsets.only(top: h * 0.01, left: w * 0.01),
          ),
        ),
      ],
    );
  }
}
