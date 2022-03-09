import 'package:admintemplecity/COMMON_WIDGETS/custom_switch.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/MENU_PAGES/CATEGORY/set_time.dart';
import 'package:admintemplecity/MENU_PAGES/all_items.dart';
import 'package:admintemplecity/SERVICES/baseurl.dart';
import 'package:admintemplecity/SERVICES/common_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:floating_action_bubble/floating_action_bubble.dart';

import 'ADD_ITEMS/add_item.dart';
import 'CATEGORY/add_category.dart';
import 'dart:math';
import 'all_items_dishes.dart';

class MenuExpandList extends StatefulWidget {
  String? catId;
  String? catname;
  MenuExpandList({this.catId, this.catname});
  @override
  _MenuExpandListState createState() => _MenuExpandListState();
}

class _MenuExpandListState extends State<MenuExpandList>
    with SingleTickerProviderStateMixin {
  bool first1 = false;
  bool onState = true;
  bool partiShow = false;
  bool showfloatBubble = false;
  bool ofState = false;
  int? isExpand;
  var catId;
  var catName;
  List<bool> boolArrey = [];

  bool bottomExpand = false;
  bool floatBubble = false;
  List<bool> dishBool = [];

  bool isExpands = false;
  Animation<double>? animation;
  AnimationController? animationController;

  @override
  void initState() {
    print(Provider.of<CommonFunctions>(context, listen: false).getData);
    for (var i = 0;
        i < Provider.of<CommonFunctions>(context, listen: false).getData.length;
        i++) {
      setState(() {
        boolArrey.add(Provider.of<CommonFunctions>(context, listen: false)
                    .getData[i]["turnon_category"] ==
                1
            ? true
            : false);
      });
    }
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );

    // ignore: unused_local_variable
    final curvedAnimation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeInToLinear,
    );
    animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        // setState(() {
        //   bottomExpand = false;
        // });
        return Future.value(true);
      },
      child: WillPopScope(
        onWillPop: () {
          Navigator.pop(context);
          return Future.value(true);
        },
        child: Scaffold(
          body: partiShow == false
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: Provider.of<CommonFunctions>(context, listen: true)
                      .getData
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              isExpand = index;
                              if (isExpand == index) {
                                setState(() {
                                  isExpands = true;
                                });
                              }
                              // var catId = Provider.of<CommonFunctions>(context,
                              //         listen: false)
                              //     .getData[index]["category_id"];
                              // Provider.of<CommonFunctions>(context, listen: false)
                              //     .apiDishGet(
                              //         incomingFeild:
                              //             "newmenu/foodDetails/${catId}");
                              // for (var i = 0;
                              //     i <
                              //         Provider.of<CommonFunctions>(context,
                              //                 listen: false)
                              //             .dishData
                              //             .length;
                              //     i++) {
                              //   setState(() {
                              //     dishBool.add(Provider.of<CommonFunctions>(context,
                              //                     listen: false)
                              //                 .dishData[i]["turnon_status"] ==
                              //             1
                              //         ? true
                              //         : false);
                              //   });
                              // }
                            });
                          },
                          child: Container(
                            height: h * 0.07,
                            width: w,
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Color(0xffA5A5A5)))),
                            child: Row(
                              children: [
                                Container(
                                  height: h * 0.07,
                                  width: w * 0.7,
                                  padding: EdgeInsets.only(left: w * 0.05),
                                  alignment: Alignment.centerLeft,
                                  // color: Colors.red,
                                  child: Row(
                                    children: [
                                      CustomText(
                                        text:
                                            "${Provider.of<CommonFunctions>(context, listen: true).getData[index]["category_name"]}",
                                        size: 20,
                                      ),
                                      Container(
                                          child: isExpand == index
                                              ? Icon(Icons.arrow_drop_down)
                                              : Icon(Icons.arrow_drop_up))
                                    ],
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
                                      value: boolArrey[index],
                                      givenColor: Colors.grey,
                                      onChange: (val) {
                                        setState(() {
                                          boolArrey[index] = !boolArrey[index];
                                          if (boolArrey[index] == true) {
                                            categoryUpdate(
                                                cat_Id:
                                                    Provider.of<CommonFunctions>(
                                                                context,
                                                                listen: false)
                                                            .getData[index]
                                                        ["category_id"],
                                                status: "1");
                                          } else {
                                            categoryUpdate(
                                                cat_Id:
                                                    Provider.of<CommonFunctions>(
                                                                context,
                                                                listen: false)
                                                            .getData[index]
                                                        ["category_id"],
                                                status: "0");
                                          }
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
                                              bottomExpand = true;
                                              floatBubble = true;
                                            });
                                            showBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.vertical(
                                                            top:
                                                                Radius.circular(
                                                                    10))),
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return Container(
                                                    height: h * 0.4,
                                                    width: w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                top: Radius
                                                                    .circular(
                                                                        10))),
                                                    child: Column(
                                                      children: [
                                                        bottomContainer(h, w,
                                                            text: CustomText(
                                                              size: 20,
                                                              text:
                                                                  "${Provider.of<CommonFunctions>(context, listen: false).getData[index]["category_name"]}",
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
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            )),
                                                        bottomContainer(
                                                          h,
                                                          w,
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            color: Colors.grey,
                                                          ),
                                                          ontap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            SetTime()));
                                                          },
                                                          text: CustomText(
                                                            color: Color(
                                                                0xff6D6B6B),
                                                            size: 15,
                                                            text:
                                                                "Edit Category timings",
                                                          ),
                                                        ),
                                                        bottomContainer(
                                                          h,
                                                          w,
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            color: Colors.grey,
                                                          ),
                                                          text: CustomText(
                                                            color: Color(
                                                                0xff6D6B6B),
                                                            size: 15,
                                                            text:
                                                                "Edit Category name",
                                                          ),
                                                        ),
                                                        bottomContainer(
                                                          h,
                                                          w,
                                                          ontap: () {
                                                            setState(() {
                                                              partiShow =
                                                                  !partiShow;
                                                              if (partiShow ==
                                                                  true) {}
                                                            });
                                                          },
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            color: Colors.grey,
                                                          ),
                                                          text: CustomText(
                                                            color: Color(
                                                                0xff6D6B6B),
                                                            size: 15,
                                                            text: "Delete item",
                                                          ),
                                                        ),
                                                        bottomContainer(
                                                          h,
                                                          w,
                                                          icon: Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            color: Colors.grey,
                                                          ),
                                                          text: CustomText(
                                                            color: Color(
                                                                0xff6D6B6B),
                                                            size: 15,
                                                            text:
                                                                "Delete Category",
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
                        ),
                        Visibility(
                          visible: isExpand == index ? true : false,
                          child: AllItemsDishList(
                              categoryId: Provider.of<CommonFunctions>(context,
                                      listen: false)
                                  .getData[index]["category_id"]),
                        ),
                      ],
                    );
                  })
              : AllItems(
                  categoryId: widget.catId,
                  categoryName: widget.catname,
                ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: floatBubble == false
              ? FloatingActionBubble(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddItems()));
                      },
                    ),
                  ],
                  iconColor: Colors.white,
                  animation: animation!,
                )
              : null,
        ),
      ),
    );
  }

  Future categoryUpdate({cat_Id, status}) async {
    print("dish id : $cat_Id");
    print("status : $status");
    // https://www.cviacserver.tk/templecity/c_list/update_turnoncategory/:category_id
    var baseUrl = BaseUrl().baseUrl;
    var url = Uri.parse("${baseUrl}c_list/update_turnoncategory/${cat_Id}");
    var responce = await http.put(url, body: {
      "turnon_category": status,
    });
    print(responce.body);
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
