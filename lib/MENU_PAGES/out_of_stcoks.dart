import 'package:flutter/material.dart';

class OutOfStock extends StatefulWidget {
  @override
  _OutOfStockState createState() => _OutOfStockState();
}

class _OutOfStockState extends State<OutOfStock> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h * 0.3,
        width: w,
        color: Colors.amber,
      ),
    );
  }
}
