import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:flutter/material.dart';

class ReportItems extends StatefulWidget {
  const ReportItems({Key? key}) : super(key: key);

  @override
  _ReportItemsState createState() => _ReportItemsState();
}

class _ReportItemsState extends State<ReportItems> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              height: h * 0.08,
              width: w,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: w * 0.05, top: h * 0.02),
                      height: h * 0.08,
                      width: w * 0.395,
                      color: Color(0xff362222),
                      child: CustomText(
                        text: "Dosa",
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: w * 0.05, top: h * 0.02),
                      height: h * 0.08,
                      width: w * 0.295,
                      color: Color(0xff362222),
                      child: CustomText(
                        text: "Dosa",
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: w * 0.05, top: h * 0.02),
                      height: h * 0.08,
                      width: w * 0.295,
                      color: Color(0xff362222),
                      child: CustomText(
                        text: "Dosa",
                        color: Colors.white,
                      ),
                    ),
                  ]));
        });
  }
}
