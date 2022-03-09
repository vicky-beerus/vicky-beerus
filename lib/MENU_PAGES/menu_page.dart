import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_notification.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_textformfield.dart';
import 'package:admintemplecity/MENU_PAGES/all_items.dart';
import 'package:admintemplecity/MENU_PAGES/menu_expand_list.dart';
import 'package:admintemplecity/MENU_PAGES/out_of_stcoks.dart';
import 'package:admintemplecity/SERVICES/common_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Menupage extends StatefulWidget {
  @override
  _MenupageState createState() => _MenupageState();
}

// sjfhdjshdfjhsjfh
class _MenupageState extends State<Menupage> {
  bool isClick = false;
  int? isSelected;
  String? allItemCatId;
  String? allItemCatname;

  @override
  void initState() {
    Provider.of<CommonFunctions>(context, listen: false)
        .apiGet(incomingFeild: "c_list/getcategory");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Provider.of<CommonFunctions>(context, listen: true).getData == null
        ? Center(
            child: CircularProgressIndicator(color: const Color(0xff32666)))
        : WillPopScope(
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
              length: 2,
              child: Scaffold(
                body: Container(
                  height: h,
                  width: w,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: h * 0.3,
                            width: w,
                            color: Color(0xff362222),
                          ),
                          Positioned(
                            top: h * 0.07,
                            left: w * 0.05,
                            child: CustomFormField(
                              height: h * 0.055,
                              width: w * 0.75,
                              color: Colors.white,
                              suffix: Icon(
                                Icons.search,
                                color: Color(0xff362222),
                              ),
                            ),
                          ),
                          Positioned(
                              top: h * 0.07,
                              right: w * 0.05,
                              child: Custom_Notification(
                                notificationCount: "5",
                              )),
                          Positioned(
                            top: h * 0.14,
                            left: w * 0.025,
                            child: Container(
                              height: h * 0.06,
                              width: w * 0.95,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color(0xffFABB51),
                              ),
                              child: Center(
                                child: Container(
                                  height: h * 0.05,
                                  width: w * 0.9,
                                  color: Color(0xffFABB51),
                                  child: TabBar(
                                      onTap: (val) {
                                        setState(() {
                                          isClick = false;
                                        });
                                      },
                                      indicator: BoxDecoration(
                                          color: isClick == false
                                              ? Colors.white
                                              : Color(0xffFABB51),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      indicatorSize: TabBarIndicatorSize.tab,
                                      //indicatorWeight: h * 0.08,
                                      labelColor: Color(0xff362222),
                                      tabs: [
                                        Tab(
                                          text: "All Items",
                                        ),
                                        Tab(
                                          text: "Out of Stcoks",
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: h * 0.02,
                            child: Container(
                                height: h * 0.05,
                                width: w,
                                child: ListView.builder(
                                    padding: EdgeInsets.only(left: w * 0.01),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: Provider.of<CommonFunctions>(
                                            context,
                                            listen: true)
                                        .getData
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            // Provider.of<CommonFunctions>(
                                            //         context,
                                            //         listen: false)
                                            //     .changer(value: isClick);
                                            isClick = !isClick;
                                            isSelected = index;
                                            allItemCatname =
                                                "${Provider.of<CommonFunctions>(context, listen: false).getData[index]["category_name"]}";
                                            allItemCatId =
                                                "${Provider.of<CommonFunctions>(context, listen: false).getData[index]["category_id"]}";

                                            // boolList[index] = !boolList[index];
                                          });
                                        },
                                        child: Container(
                                          margin:
                                              EdgeInsets.only(left: w * 0.03),
                                          height: h * 0.04,
                                          width: w * 0.3,
                                          decoration: BoxDecoration(
                                            color: isSelected == index
                                                ? Colors.white
                                                : Color(0xff362222),
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Center(
                                              child: CustomText(
                                            size: 12,
                                            text:
                                                "${Provider.of<CommonFunctions>(context, listen: false).getData[index]["category_name"]}",
                                            color: isSelected == index
                                                ? Color(0xff362222)
                                                : Colors.white,
                                          )),
                                        ),
                                      );
                                    })),
                          )
                        ],
                      ),
                      Container(
                        height: h * 0.6,
                        width: w,
                        child: TabBarView(
                          children: isClick == true
                              ? [
                                  AllItems(
                                      categoryId: allItemCatId,
                                      categoryName: allItemCatname),
                                  OutOfStock()
                                ]
                              : [
                                  MenuExpandList(
                                      catId: allItemCatId,
                                      catname: allItemCatname),
                                  OutOfStock()
                                ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

//   changeBool({index}){
// setState(() {
//   isClick  =! isClick[index];
// });
//   }
}
