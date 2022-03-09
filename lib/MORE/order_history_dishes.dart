import 'package:admintemplecity/MENU_PAGES/EDIT_DISH/edit_pages.dart';
import 'package:flutter/material.dart';

import '../COMMON_WIDGETS/custom_text.dart';

class OrderHistoryDishes extends StatefulWidget {
  const OrderHistoryDishes({Key? key}) : super(key: key);

  @override
  _OrderHistoryDishesState createState() => _OrderHistoryDishesState();
}

class _OrderHistoryDishesState extends State<OrderHistoryDishes> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ListView.builder(
        padding: EdgeInsets.only(right: 8, left: 8),
        itemCount: 7,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int orderDishIndex) {
          return Stack(
            children: [
              Container(
                height: h * 0.06,
                width: w * 0.95,
                decoration: 7 == orderDishIndex - 1
                    ? BoxDecoration(
                        border: Border(
                            left:
                                BorderSide(color: Colors.grey.withOpacity(0.4)),
                            bottom:
                                BorderSide(color: Colors.grey.withOpacity(0.4)),
                            right: BorderSide(
                                color: Colors.grey.withOpacity(0.4))))
                    : BoxDecoration(
                        border: Border(
                            left:
                                BorderSide(color: Colors.grey.withOpacity(0.4)),
                            right: BorderSide(
                                color: Colors.grey.withOpacity(0.4)))),
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
                  text: "₹ 120",
                  size: 16,
                  color: Color(0xff707070),
                ),
              )
            ],
          );
        });
  }
}
