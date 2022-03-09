import 'package:admintemplecity/ADMIN_HOMEPAGE/homepage_main.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_textformfield.dart';
import 'package:admintemplecity/SERVICES/baseurl.dart';
import 'package:admintemplecity/SHARED_PREFERANECE/shared_preferance.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class AdminSignIn extends StatefulWidget {
  @override
  _AdminSignInState createState() => _AdminSignInState();
}

class _AdminSignInState extends State<AdminSignIn> {
  bool password = true;
  bool circleLoad = false;
  TextEditingController adminIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Color(0xffFABB51),
      ),
      body: ModalProgressHUD(
        inAsyncCall: circleLoad,
        child: Stack(
          children: [
            Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color(0xffFABB51),
                      Color(0xffF8BF5F),
                      //Color(0xffF2C883),
                    ]),
              ),
              child: Column(
                children: [
                  Container(
                    height: h * 0.08,
                    width: w,
                    child: Image.asset("assets/screens/whitelogo.png"),
                  ),
                  Container(
                    height: h * 0.1,
                    width: w,
                    // color: Colors.red,
                    child: Center(
                      child: CustomText(
                        size: 20,
                        text: "Admin Login",
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        height: h * 0.17,
                        width: w,
                      ),
                      Positioned(
                        top: 0,
                        left: w * 0.05,
                        child: CustomFormField(
                          controller: adminIdController,
                          height: h * 0.065,
                          width: w * 0.9,
                          color: Colors.white,
                          hintText: "User ID",
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: w * 0.05,
                        child: CustomFormField(
                          obScureTexts: password,
                          controller: passwordController,
                          height: h * 0.065,
                          width: w * 0.9,
                          color: Colors.white,
                          hintText: "Password",
                          suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  password = !password;
                                });
                              },
                              icon: password == true
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: Color(0xff362222),
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: Color(0xffFABB51),
                                    )),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: h * 0.12,
                    width: w,
                    child: Center(
                      child: Custom_Button(
                        onTap: () async {
                          setState(() {
                            circleLoad = true;
                          });
                          await adminLogin();
                        },
                        height: h * 0.065,
                        width: w * 0.7,
                        text: "Login",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.35,
                width: w,
                child: Image.asset(
                  "assets/screens/siginbg.png",
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future adminLogin() async {
    print("------------login------------");

    print("adminId: ${adminIdController.text.toString()}");
    print("password:${passwordController.text.toString()}");
    // https://www.cviacserver.tk/templecity/admin/adminlogin
    var baseUrl = BaseUrl().baseUrl;
    var url = Uri.parse("${baseUrl}admin/adminlogin");
    print(url);
    var response = await http.post(url, body: {
      "adminId": adminIdController.text.toString(),
      "password": passwordController.text.toString()
    });
    print(response.body);
    var decodeDetail = json.decode(response.body);
    var adminId = decodeDetail["admin"][0]["admin_id"].toString();
    var adminName = decodeDetail["admin"][0]["admin_name"];
    var branch = decodeDetail["admin"][0]["branch"];
    print(adminId);
    if (decodeDetail["status"] == 200) {
      setState(() {
        circleLoad = false;
      });
      List<String> adminDetail = [adminId, adminName, branch];
      Shared().shared().then((value) async {
        await value.setStringList("admin", adminDetail);
      });

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePageMain()));
    } else {
      print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk");
    }
  }
}
