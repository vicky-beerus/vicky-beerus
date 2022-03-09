import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:flutter/material.dart';

class ReportComplaints extends StatefulWidget {
  const ReportComplaints({Key? key}) : super(key: key);

  @override
  _ReportComplaintsState createState() => _ReportComplaintsState();
}

class _ReportComplaintsState extends State<ReportComplaints> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(7),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Container(
                margin: EdgeInsets.all(2),
                height: h * 0.08,
                width: w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.withOpacity(0.7))),
              ),
              Positioned(
                top: h * 0.015,
                left: w * 0.05,
                child: CustomText(
                  text: "87% orders prepared in time",
                  color: Color(0xff707070),
                ),
              ),
              Positioned(
                bottom: h * 0.015,
                left: w * 0.05,
                child: CustomText(
                  text: "In time orders | Delayed orders",
                  color: Color(0xff707070),
                ),
              )
            ],
          );
        });
  }
}
