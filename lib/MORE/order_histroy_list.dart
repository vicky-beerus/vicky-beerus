import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/MORE/order_history_dishes.dart';
import 'package:flutter/material.dart';

class OrderHistoryList extends StatefulWidget {
  const OrderHistoryList({Key? key}) : super(key: key);

  @override
  _OrderHistoryListState createState() => _OrderHistoryListState();
}

class _OrderHistoryListState extends State<OrderHistoryList> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: h * 0.1,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(7)),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.4))),
                  ),
                  Positioned(
                    top: h * 0.03,
                    left: w * 0.05,
                    child: CustomText(
                      size: 16,
                      text: "OrderID:${7923}",
                    ),
                  ),
                  Positioned(
                    top: h * 0.07,
                    left: w * 0.05,
                    child: CustomText(
                      size: 10,
                      text: "05:15 PM | 08 FEB",
                    ),
                  ),
                  Positioned(
                    bottom: h * 0.025,
                    right: w * 0.05,
                    child: CustomText(
                      size: 10,
                      text: "Ordered by:TamilMaran",
                    ),
                  ),
                  Positioned(
                    top: h * 0.02,
                    right: w * 0.05,
                    child: Container(
                      height: h * 0.035,
                      width: w * 0.3,
                      color: Colors.green,
                      child: Center(
                        child: CustomText(
                          text: "Delivered",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                child: OrderHistoryDishes(),
              ),
            ],
          );
        });
  }
}
