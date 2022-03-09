import 'dart:io';

import 'package:admintemplecity/COMMON_WIDGETS/costom_appbar.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_selectformfield.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_switch.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_textformfield.dart';
import 'package:admintemplecity/MENU_PAGES/ADD_ITEMS/set_time_items.dart';
import 'package:admintemplecity/SERVICES/baseurl.dart';
import 'package:admintemplecity/SERVICES/common_function.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditDishes extends StatefulWidget {
  var image;
  String? updateCatName;

  EditDishes({this.image, this.updateCatName});
  @override
  _EditDishesState createState() => _EditDishesState();
}

class _EditDishesState extends State<EditDishes> {
  var getCatData;
  var pickedImage;
  var pickedImagePath;
  var multerImage;
  var postingImage;
  var category_id;
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemPriceController = TextEditingController();
  TextEditingController itemTagController = TextEditingController();
  List<Category> Cat = [];
  bool delivery = false;
  bool takeAway = false;
  bool special = false;
  bool addHome = false;
  List tagList = [];
  String dropValue = "Select";

  List<DropdownMenuItem<String>> allCat = [
    DropdownMenuItem(
      child: CustomText(
        text: "Select",
      ),
      value: "Select",
    )
  ];
  @override
  void initState() {
    print(widget.image);
    print("image from constructor");
    Provider.of<CommonFunctions>(context, listen: false)
        .apiGet(incomingFeild: "c_list/getcategory");
    print(Provider.of<CommonFunctions>(context, listen: false).getData);
    setState(() {
      for (var i = 0;
          i <
              Provider.of<CommonFunctions>(context, listen: false)
                  .getData
                  .length;
          i++) {
        Cat.add(Category(
            cat_Id:
                "${Provider.of<CommonFunctions>(context, listen: false).getData[i]["category_id"]}"
                    .toString(),
            cat_name: Provider.of<CommonFunctions>(context, listen: false)
                .getData[i]["category_name"]
                .toString()));
      }
      print("faffafadfafafafasdfafafadfadffafaf");
      for (var i in Cat) {
        setState(() {
          allCat.add(DropdownMenuItem(
            child: CustomText(
              text: i.cat_name.toString(),
            ),
            value: i.cat_Id.toString(),
          ));
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.08),
        child: CustomAppBar(
          leadingWant: true,
          appTitle1: "Edit",
          appTitle2: "Item details",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h * 0.3,
              width: w,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(0xff9FB3BF).withOpacity(0.4),
                          width: h * 0.002))),
              child: Center(
                child: InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            actions: [
                              Custom_Button(
                                height: h * 0.05,
                                width: w * 0.25,
                                color: Color(0xffFABB51),
                                text: "Cancel",
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                            title: CustomText(
                              text: "Choose Any One",
                            ),
                            content: Container(
                              height: h * 0.1,
                              width: w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        getFromCamera();
                                      },
                                      icon: Icon(Icons.camera_alt)),
                                  IconButton(
                                    onPressed: () {
                                      getFromCamera();
                                    },
                                    icon: Icon(Icons.image),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: pickedImage == null
                      ? Container(
                          height: h * 0.25,
                          width: w * 0.9,
                          child: DottedBorder(
                            strokeWidth: h * 0.0025,
                            color: const Color(0xff9FB3BF),
                            borderType: BorderType.RRect,
                            child: Center(
                              child: Container(
                                height: h * 0.2,
                                width: w * 0.5,
                                child: Column(
                                  children: [
                                    Container(
                                      height: h * 0.1,
                                      width: w * 0.3,
                                      alignment: Alignment.bottomCenter,
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 35,
                                        color: const Color(0xff9FB3BF),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        height: h * 0.03,
                                        width: w * 0.3,
                                        child: CustomText(
                                          text: "Add Photo ",
                                          color: const Color(0xff9FB3BF),
                                        )),
                                    Container(
                                        alignment: Alignment.center,
                                        height: h * 0.03,
                                        width: w * 0.35,
                                        child: CustomText(
                                          text: "Add item images",
                                          color: const Color(0xff9FB3BF),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: h * 0.25,
                          width: w * 0.9,
                          child: widget.image == null
                              ? Image.network(
                                  "https://www.cviacserver.tk/templecity/image/${widget.image}")
                              : Image.file(
                                  File(pickedImagePath),
                                ),
                        ),
                ),
              ),
            ),
            Container(
              height: h * 0.3,
              width: w,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(0xff9FB3BF).withOpacity(0.4),
                          width: h * 0.002))),
              child: Column(
                children: [
                  Container(
                    height: h * 0.04,
                    width: w,
                    padding: EdgeInsets.only(left: w * 0.05),
                    child: CustomText(
                      text: "Category",
                      color: const Color(0xff9FB3BF),
                    ),
                  ),
                  Container(
                    height: h * 0.07,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: const Color(0xff9FB3BF).withOpacity(0.5),
                    )),
                    child: Container(
                      height: h * 0.05,
                      width: w * 0.9,
                      child: DropdownButton<String>(
                        underline: const SizedBox(),
                        isExpanded: true,
                        value: dropValue,
                        items: allCat.map<DropdownMenuItem<String>>((e) {
                          return e;
                        }).toList(),
                        onChanged: (value) {
                          print(value);
                          setState(() {
                            dropValue = value!;
                            category_id = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    height: h * 0.15,
                    width: w,
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.04,
                          width: w,
                          padding: EdgeInsets.only(left: w * 0.05),
                          child: CustomText(
                            text: "Item Name",
                            color: const Color(0xff9FB3BF),
                          ),
                        ),
                        Container(
                          height: h * 0.07,
                          width: w * 0.9,
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: const Color(0xff9FB3BF).withOpacity(0.5),
                          )),
                          child: CustomFormField(
                            height: h * 0.05,
                            controller: itemNameController,
                            width: w * 0.9,
                            hintText: "Enter Category Name",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: h * 0.15,
              width: w,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: Color(0xff9FB3BF).withOpacity(0.4),
                          width: h * 0.002))),
              child: Column(
                children: [
                  Container(
                    height: h * 0.04,
                    width: w,
                    padding: EdgeInsets.only(left: w * 0.05),
                    child: CustomText(
                      text: "Item Price",
                      color: const Color(0xff9FB3BF),
                    ),
                  ),
                  Container(
                    height: h * 0.07,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: const Color(0xff9FB3BF).withOpacity(0.5),
                    )),
                    child: CustomFormField(
                      height: h * 0.05,
                      width: w * 0.9,
                      controller: itemPriceController,
                      hintText: "Enter item Price",
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   height: h * 0.2,
            //   width: w,
            //   decoration: BoxDecoration(
            //       border: Border(
            //           bottom: BorderSide(color: Colors.grey.withOpacity(0.4)))),
            //   child: Column(
            //     children: [
            //       Container(
            //         height: h * 0.05,
            //         width: w,
            //         padding: EdgeInsets.only(left: w * 0.04, top: h * 0.01),
            //         child: CustomText(
            //           text: "Item available on",
            //           color: Color(0xff8D8989),
            //         ),
            //       ),
            //       // Stack(
            //       //   children: [
            //       //     Container(
            //       //       height: h * 0.14,
            //       //       width: w,
            //       //     ),
            //       //     Positioned(
            //       //       top: h * 0.01,
            //       //       left: w * 0.05,
            //       //       child: Icon(
            //       //         Icons.delivery_dining,
            //       //         size: 30,
            //       //         color: Color(0xff8D8989),
            //       //       ),
            //       //     ),
            //       //     Positioned(
            //       //         left: w * 0.15,
            //       //         top: h * 0.015,
            //       //         child: CustomText(
            //       //           text: "Delivery",
            //       //           weight: FontWeight.w600,
            //       //           color: Color(0xff8D8989),
            //       //         )),
            //       //     Positioned(
            //       //       right: w * 0.05,
            //       //       child: Checkbox(
            //       //           activeColor: Color(0xffFABB51),
            //       //           value: delivery,
            //       //           onChanged: (value) {
            //       //             setState(() {
            //       //               delivery = !delivery;
            //       //             });
            //       //           }),
            //       //     ),
            //       //     Positioned(
            //       //       bottom: h * 0.03,
            //       //       left: w * 0.05,
            //       //       child: Icon(
            //       //         Icons.backpack,
            //       //         size: 30,
            //       //         color: Color(0xff8D8989),
            //       //       ),
            //       //     ),
            //       //     Positioned(
            //       //         left: w * 0.15,
            //       //         bottom: h * 0.035,
            //       //         child: CustomText(
            //       //           text: "Takeaway",
            //       //           weight: FontWeight.w600,
            //       //           color: Color(0xff8D8989),
            //       //         )),
            //       //     Positioned(
            //       //       bottom: h * 0.02,
            //       //       right: w * 0.05,
            //       //       child: Checkbox(
            //       //           activeColor: Color(0xffFABB51),
            //       //           value: takeAway,
            //       //           onChanged: (value) {
            //       //             setState(() {
            //       //               takeAway = !takeAway;
            //       //             });
            //       //           }),
            //       //     )
            //       //   ],
            //       // ),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: h * 0.03,
            ),
            Container(
              height: h * 0.06,
              width: w,
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.8,
                    padding: EdgeInsets.only(top: h * 0.02, left: w * 0.05),
                    child: CustomText(
                      text: "Temple City Special dish",
                      color: Color(0xff707070),
                    ),
                  ),
                  Container(
                    height: h * 0.06,
                    width: w * 0.2,
                    child: Center(
                      child: CustomSwitch(
                        height: h * 0.035,
                        width: w * 0.13,
                        value: special,
                        givenColor: Colors.grey,
                        onChange: (val) {
                          setState(() {
                            special = !special;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: h * 0.06,
              width: w,
              child: Row(
                children: [
                  Container(
                    height: h * 0.06,
                    width: w * 0.8,
                    padding: EdgeInsets.only(top: h * 0.02, left: w * 0.05),
                    child: CustomText(
                      text: "Add dish to home screen",
                      color: Color(0xff707070),
                    ),
                  ),
                  Container(
                    height: h * 0.06,
                    width: w * 0.2,
                    child: Center(
                      child: CustomSwitch(
                        height: h * 0.035,
                        width: w * 0.13,
                        value: addHome,
                        givenColor: Colors.grey,
                        onChange: (val) {
                          setState(() {
                            addHome = !addHome;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Custom_Button(
              height: h * 0.06,
              width: w * 0.9,
              text: "Edit time for dish availability",
              color: Color(0xff9FB3BF),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SetTimeItem()));
              },
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Container(
              height: h * 0.1,
              width: w,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: w * 0.05),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: Color(0xff88A0AE).withOpacity(0.4))),
                    child: CustomFormField(
                      color: Colors.white,
                      height: h * 0.06,
                      width: w * 0.6,
                      controller: itemTagController,
                      hintText: "Select Item Tag",
                    ),
                  ),
                  SizedBox(
                    width: w * 0.05,
                  ),
                  Custom_Button(
                    height: h * 0.06,
                    width: w * 0.25,
                    color: Color(0xff88A0AE),
                    text: "Add",
                    onTap: () {
                      setState(() {
                        tagList.add(itemTagController.text.toString());
                      });
                      print(tagList);
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: h * 0.3,
              width: w * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  border:
                      Border.all(color: Color(0xff88A0AE).withOpacity(0.4))),
              child: GridView.builder(
                  itemCount: tagList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      width: w * 0.1,
                      color: Colors.green,
                      child: CustomText(
                        text: tagList[index],
                        color: Colors.red,
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: h * 0.05,
            ),
            Container(
              height: h * 0.1,
              width: w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Custom_Button(
                    onTap: () {
                      itemPost();
                    },
                    height: h * 0.06,
                    width: w * 0.9,
                    text: "Save",
                    color: Color(0xffFABB51),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.07,
            )
          ],
        ),
      ),
    );
  }

  getFromGallery() async {
    pickedImage = (await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 30));
    if (pickedImage != null) {
      print(pickedImage);
      setState(() {
        pickedImagePath = pickedImage!.path;
      });
      print("image path from cam: ${pickedImage!.path}");
      postImage(incomingFile: pickedImagePath);
      Navigator.pop(context);
    }
  }

  getFromCamera() async {
    pickedImage = (await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 30));
    if (pickedImage != null) {
      print(pickedImage);
      setState(() {
        pickedImagePath = pickedImage!.path;
      });
      print("image path from cam: ${pickedImage!.path}");
      postImage(incomingFile: pickedImagePath);
      Navigator.pop(context);
    }
  }

  postImage({incomingFile}) async {
    // https://www.cviacserver.tk/templecity/food/postImage
    final String url = "https://www.cviacserver.tk/templecity/food/postImage";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('File', incomingFile));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    multerImage = json.decode(response.body);
    print("MUlterImage : $multerImage");
    postingImage = multerImage["image"]["filename"];
    print("Image: $postingImage");
    print("multer posted");
  }

  Future itemPost() async {
    // https://www.cviacserver.tk/templecity/newmenu/addnewmenu
    var baseUrl = BaseUrl().baseUrl;
    var url = Uri.parse("${baseUrl}newmenu/addnewmenu");
    var response = await http.post(url, body: {
      "menu_name": itemNameController.text.toString(),
      "menu_image": postingImage.toString(),
      "price": itemPriceController.text.toString(),
      "available_from": "11:00:00",
      "available_till": "16:00:00",
      "category_id": category_id.toString()
    });
    var decodeDetails = json.decode(response.body);
    print(decodeDetails);
    if (decodeDetails["status"] == 200) {
      final snackbar = SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: CustomText(
          text: "Item added succesfully",
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Color(0xffFABB51),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: CustomText(
          text: "error",
        ),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }
}

class Category {
  String? cat_Id;
  String? cat_name;
  Category({this.cat_Id, this.cat_name});
}
