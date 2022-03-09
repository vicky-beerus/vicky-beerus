import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/MORE/more_firstpage.dart';
import 'package:admintemplecity/REPORT/report_page.dart';
import 'package:admintemplecity/SHARED_PREFERANECE/get_shared.dart';
import 'package:flutter/services.dart';

import 'ORDER_PAGE/order_page.dart';
import 'package:admintemplecity/MENU_PAGES/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePageMain extends StatefulWidget {
  @override
  _HomePageMainState createState() => _HomePageMainState();
}

class _HomePageMainState extends State<HomePageMain> {
  int selectIndex = 0;
  @override
  void initState() {
    Provider.of<GetShared>(context, listen: false).getShared();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: CustomText(
                  text: "Are you want to Exit this App",
                ),
                actions: [
                  Custom_Button(
                    onTap: () {
                      SystemNavigator.pop();
                    },
                    height: h * 0.05,
                    width: w * 0.3,
                    text: "Yes",
                    color: Color(0xffFABB51),
                  )
                ],
              );
            });
        return Future.value(true);
      },
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: InkWell(
            onTap: () {
              print("adffafadfadfadfadfadfadfadffadf");
              print(Provider.of<GetShared>(context, listen: false).adminId);
              print("adffafadfadfadfadfadfadfadffadf");
            },
            child: Container(
              height: h,
              width: w,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  OrderPage(),
                  Menupage(),
                  ReportMainPage(),
                  MoreFirstPage(),
                ],
              ),
            ),
          ),
          bottomSheet: Container(
              height: h * 0.1,
              width: w,
              child: TabBar(
                  onTap: (index) {
                    setState(() {
                      selectIndex = index;
                    });
                  },
                  labelColor: Color(0xff362222),
                  isScrollable: false,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      icon: Image.asset("assets/bottom/food-tray.png"),
                      text: "Order",
                    ),
                    Tab(
                      icon: Image.asset("assets/bottom/centerlist.png"),
                      text: "Menu",
                    ),
                    Tab(
                      icon: Image.asset("assets/bottom/statistics.png"),
                      text: "Report",
                    ),
                    Tab(
                      icon: Image.asset("assets/bottom/brownlist.png"),
                      text: "More",
                    )
                  ])),
          // bottomNavigationBar: BottomNavigationBar(
          //   onTap: (value) {
          //     setState(() {
          //       selectIndex = value;
          //     });
          //   },
          //   items: <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //         icon: Image.asset("assets/bottom/food-tray.png"),
          //         label: "Home"),
          //     BottomNavigationBarItem(
          //         icon: Image.asset("assets/bottom/centerlist.png"),
          //         label: "Home"),
          //     BottomNavigationBarItem(
          //         icon: Image.asset("assets/bottom/statistics.png"),
          //         label: "Home"),
          //     BottomNavigationBarItem(
          //         icon: Image.asset("assets/bottom/brownlist.png"),
          //         label: "Home"),
          //   ],
          // )
        ),
      ),
    );
  }
}
