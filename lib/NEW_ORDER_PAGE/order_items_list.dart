import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:flutter/material.dart';

class OrderItemList extends StatefulWidget {
  const OrderItemList({Key? key}) : super(key: key);

  @override
  _OrderItemListState createState() => _OrderItemListState();
}

class _OrderItemListState extends State<OrderItemList> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (BuildContext context, int itemIndex) {
          return Stack(
            children: [
              Container(
                height: h * 0.06,
                width: w,
              ),
              Positioned(
                top: h * 0.015,
                left: w * 0.05,
                child: CustomText(
                  text: "2",
                  size: 16,
                  color: Color(0xff707070),
                ),
              ),
              Positioned(
                  top: h * 0.02,
                  left: w * 0.12,
                  child: Icon(
                    Icons.clear,
                    color: Color(0xff707070),
                    size: 15,
                  )),
              Positioned(
                top: h * 0.015,
                left: w * 0.18,
                child: CustomText(
                  text: "Veg Meals",
                  size: 16,
                  color: Color(0xff707070),
                ),
              ),
              Positioned(
                top: h * 0.015,
                right: w * 0.05,
                child: CustomText(
                  text: "Rs 120",
                  size: 16,
                  color: Color(0xff707070),
                ),
              )
            ],
          );
        });
  }
}
