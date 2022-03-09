import 'dart:async';

import 'package:admintemplecity/ADMIN_HOMEPAGE/homepage_main.dart';
import 'package:admintemplecity/ADMIN_SINGIN/admin_signin.dart';
import 'package:admintemplecity/SHARED_PREFERANECE/get_shared.dart';
import 'package:admintemplecity/SHARED_PREFERANECE/shared_preferance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var enteryKey;

  @override
  void initState() {
    super.initState();
    pageEntry();
  }

  pageEntry() async {
    await Shared().shared().then((value) {
      enteryKey = value.getStringList('admin');
    });
    if (enteryKey != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePageMain())));
    } else {
      print(enteryKey);
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminSignIn())));
    }
  }

  // pageMove() async {
  //   //var move = await Provider.of<GetShared>(context, listen: true).adminId;
  //   print(Provider.of<GetShared>(context, listen: false).adminId);
  //   print("ggggggg");
  //
  // }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/screens/splashbg.png"),
                fit: BoxFit.fill)),
        child: Center(
          child: Container(
            height: h * 0.35,
            width: w * 0.75,
            child: Image.asset(
              "assets/screens/logo.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
