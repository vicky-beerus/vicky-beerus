import 'package:admintemplecity/COMMON_WIDGETS/custom_switch.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/MENU_PAGES/EDIT_DISH/edit_pages.dart';
import 'package:admintemplecity/SERVICES/common_function.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllItemsDishList extends StatefulWidget {
  int? categoryId;
  // List<bool>? boolingList;
  AllItemsDishList({this.categoryId});
  @override
  _AllItemsDishListState createState() => _AllItemsDishListState();
}

class _AllItemsDishListState extends State<AllItemsDishList> {
  List<bool> dishBool = [];
  @override
  @override
  void initState() {
    print("asfasfasdfasdfasdfasdfasdfasdfasdfadsfasdf");
    print(widget.categoryId);
    print("asfasfasdfasdfasdfasdfasdfasdfasdfadsfasdf");
    // https://www.cviacserver.tk/templecity/newmenu/foodDetails/:category_id
    Provider.of<CommonFunctions>(context, listen: false)
        .apiDishGet(incomingFeild: "newmenu/foodDetails/${widget.categoryId}");

    super.initState();
  }

  void didChangeDependencies() {
    setState(() {
      for (var i = 0;
          i <
              Provider.of<CommonFunctions>(context, listen: false)
                  .dishData
                  .length;
          i++) {
        setState(() {
          dishBool.add(Provider.of<CommonFunctions>(context, listen: false)
                      .dishData[i]["turnon_status"] ==
                  1
              ? true
              : false);
        });
      }
      print(dishBool);
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Provider.of<CommonFunctions>(context, listen: true).dishData == null
        ? CircularProgressIndicator(
            color: Color(0xff362222),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: Provider.of<CommonFunctions>(context, listen: true)
                .dishData
                .length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int dishIndex) {
              return Container(
                height: h * 0.25,
                width: w,
                child: Stack(
                  children: [
                    Container(
                      height: h * 0.25,
                      width: w,
                    ),
                    Positioned(
                      top: h * 0.02,
                      left: w * 0.05,
                      child: CustomText(
                        text:
                            "${Provider.of<CommonFunctions>(context, listen: true).dishData[dishIndex]["menu_name"]}",
                        size: 16,
                      ),
                    ),
                    Positioned(
                      top: h * 0.07,
                      left: w * 0.05,
                      child: CustomText(
                        text:
                            "Rs ${Provider.of<CommonFunctions>(context, listen: true).dishData[dishIndex]["price"]}",
                        size: 16,
                      ),
                    ),
                    Positioned(
                        top: h * 0.12,
                        left: w * 0.04,
                        child: CustomSwitch(
                            height: h * 0.032,
                            width: w * 0.13,
                            value: dishBool[dishIndex],
                            onChange: (val) {
                              setState(() {
                                dishBool[dishIndex] = !dishBool[dishIndex];
                                // widget.boolingList![dishIndex] =
                                //     !widget.boolingList![dishIndex];
                              });
                            })),
                    Positioned(
                      top: h * 0.01,
                      right: w * 0.05,
                      child: Container(
                        height: h * 0.13,
                        width: w * 0.3,
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xff32666)),
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        // https://www.cviacserver.tk/templecity/image/3e107fab3f4e50eecd8ec6486b960664
                        child: Image.network(
                          "https://www.cviacserver.tk/templecity/image/${Provider.of<CommonFunctions>(context, listen: true).dishData[dishIndex]["menu_image"]}",
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: h * 0.01,
                      left: w * 0.025,
                      child: Container(
                        height: h * 0.06,
                        width: w * 0.95,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(7),
                            color: Color(0xff362222)),
                      ),
                    ),
                    Positioned(
                      bottom: h * 0.03,
                      left: w * 0.05,
                      child: Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    Positioned(
                      bottom: h * 0.025,
                      left: w * 0.12,
                      child: InkWell(
                        onTap: () {},
                        child: CustomText(
                          text: "Add to Home screen",
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: h * 0.03,
                      left: w * 0.57,
                      child: Icon(
                        Icons.edit,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    Positioned(
                      bottom: h * 0.025,
                      right: w * 0.05,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditDishes(
                                        image: Provider.of<CommonFunctions>(
                                                context,
                                                listen: true)
                                            .dishData[dishIndex]["menu_image"]
                                            .toString(),
                                      )));
                        },
                        child: CustomText(
                          text: "Edit item details",
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            });
  }
}
