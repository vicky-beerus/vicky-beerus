import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_iconbutton.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_switch.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/MENU_PAGES/ADD_ITEMS/add_item.dart';
import 'package:admintemplecity/MENU_PAGES/CATEGORY/add_category.dart';
import 'package:admintemplecity/MENU_PAGES/all_items_dishes.dart';
import 'package:admintemplecity/SERVICES/common_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';

import 'CATEGORY/set_time.dart';

class AllItems extends StatefulWidget {
  String? categoryName;
  String? categoryId;
  AllItems({this.categoryId, this.categoryName});
  @override
  _AllItemsState createState() => _AllItemsState();
}

class _AllItemsState extends State<AllItems>
    with SingleTickerProviderStateMixin {
  bool first = false;
  bool showfloatBubble = false;
  List singleCategory = [];

  Animation<double>? animation;
  AnimationController? animationController;
  @override
  void initState() {
    setState(() {
      singleCategory.add(widget.categoryName);
    });
    // http://www.cviacserver.tk/templecity/c_list/getcategory
    // Provider.of<CommonFunctions>(context, listen: false)
    //     .apiGet(incomingFeild: "c_list/getcategory");

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    // ignore: unused_local_variable
    final curvedAnimation =
        CurvedAnimation(parent: animationController!, curve: Curves.easeInOut);
    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () {
        setState(() {});
        return Future.value();
      },
      child: Scaffold(
        body: Provider.of<CommonFunctions>(context, listen: true).getData ==
                null
            ? CircularProgressIndicator.adaptive(
                backgroundColor: Color(0xff362222),
              )
            : ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: singleCategory.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        height: h * 0.07,
                        width: w,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Color(0xffA5A5A5)))),
                        child: Row(
                          children: [
                            Container(
                              height: h * 0.07,
                              width: w * 0.7,
                              padding: EdgeInsets.only(left: w * 0.05),
                              alignment: Alignment.centerLeft,
                              child: CustomText(
                                text: "${singleCategory[0]}",
                                size: 20,
                              ),
                            ),
                            Container(
                              height: h * 0.07,
                              width: w * 0.2,
                              // color: Colors.red,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CustomSwitch(
                                  height: h * 0.035,
                                  width: w * 0.13,
                                  value: first,
                                  givenColor: Colors.grey,
                                  onChange: (val) {
                                    setState(() {
                                      first = !first;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Container(
                              height: h * 0.07,
                              width: w * 0.1,
                              child: Center(
                                  child: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          setState(() {
                                            showfloatBubble = true;
                                          });
                                        });
                                        showBottomSheet(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.vertical(
                                                        top: Radius.circular(
                                                            10))),
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                height: h * 0.4,
                                                width: w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    10))),
                                                child: Column(
                                                  children: [
                                                    bottomContainer(h, w,
                                                        text: CustomText(
                                                          size: 20,
                                                          text:
                                                              "${widget.categoryName}",
                                                        ),
                                                        icon: InkWell(
                                                          onTap: () {
                                                            Navigator.pop(
                                                                context);
                                                            setState(() {
                                                              showfloatBubble =
                                                                  !showfloatBubble;
                                                            });
                                                          },
                                                          child: Icon(
                                                            Icons.clear,
                                                            color: Colors.grey,
                                                          ),
                                                        )),
                                                    bottomContainer(
                                                      h,
                                                      w,
                                                      ontap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        SetTime()));
                                                      },
                                                      text: CustomText(
                                                        color:
                                                            Color(0xff6D6B6B),
                                                        size: 15,
                                                        text:
                                                            "Edit Category timings",
                                                      ),
                                                    ),
                                                    bottomContainer(
                                                      h,
                                                      w,
                                                      text: CustomText(
                                                        color:
                                                            Color(0xff6D6B6B),
                                                        size: 15,
                                                        text:
                                                            "Edit Category name",
                                                      ),
                                                    ),
                                                    bottomContainer(
                                                      h,
                                                      w,
                                                      text: CustomText(
                                                        color:
                                                            Color(0xff6D6B6B),
                                                        size: 15,
                                                        text: "Delete item",
                                                      ),
                                                    ),
                                                    bottomContainer(
                                                      h,
                                                      w,
                                                      text: CustomText(
                                                        color:
                                                            Color(0xff6D6B6B),
                                                        size: 15,
                                                        text: "Delete Category",
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            });
                                      },
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: Colors.grey,
                                      ))),
                            )
                          ],
                        ),
                      ),
                      AllItemsDishList(
                          categoryId: int.parse(widget.categoryId.toString())),
                    ],
                  );
                }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: showfloatBubble == true
            ? null
            : FloatingActionBubble(
                onPress: () => animationController!.isCompleted
                    ? animationController!.reverse()
                    : animationController!.forward(),
                iconData: Icons.add,
                backGroundColor: Color(0xffFABB51),
                items: <Bubble>[
                  Bubble(
                    title: "Add Category",
                    iconColor: Color(0xffFABB51),
                    bubbleColor: Color(0xffFABB51),
                    icon: Icons.settings,
                    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCategory()));
                    },
                  ),
                  // Floating action menu item
                  Bubble(
                    title: "Add Item",
                    iconColor: Color(0xffFABB51),
                    bubbleColor: Color(0xffFABB51),
                    icon: Icons.people,
                    titleStyle: TextStyle(fontSize: 16, color: Colors.white),
                    onPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AddItems()));
                    },
                  ),
                ],
                iconColor: Colors.white,
                animation: animation!,
              ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   onPressed: () {
        //     Navigator.push(
        //         context, MaterialPageRoute(builder: (context) => AddCategory()));
        //   },
        //   backgroundColor: Color(0xffFABB51),
        // ),
      ),
    );
  }

  Container bottomContainer(double h, double w, {text, icon, ontap}) {
    return Container(
        height: h * 0.08,
        width: w,
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Colors.grey.withOpacity(0.5), width: 1)),
          // borderRadius: BorderRadius.vertical(top: Radius.circular(10),bottom: Radius.circular(0)
        ),
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: w * 0.05, top: h * 0.02),
                height: h * 0.08,
                width: w * 0.8,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                child: text),
            Container(
                height: h * 0.08,
                width: w * 0.2,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10))),
                child: InkWell(
                  onTap: ontap,
                  child: icon,
                ))
          ],
        ));
  }
}
