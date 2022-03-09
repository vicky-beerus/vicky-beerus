import 'dart:convert';
import 'dart:io';

import 'package:admintemplecity/COMMON_WIDGETS/costom_appbar.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_button.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_text.dart';
import 'package:admintemplecity/COMMON_WIDGETS/custom_textformfield.dart';
import 'package:admintemplecity/MENU_PAGES/CATEGORY/set_time.dart';
import 'package:admintemplecity/SERVICES/baseurl.dart';
import "package:flutter/material.dart";
import 'package:dotted_border/dotted_border.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class EditCategory extends StatefulWidget {
  @override
  _EditCategoryState createState() => _EditCategoryState();
}

class _EditCategoryState extends State<EditCategory> {
  var pickedImage;
  var pickedImagePath;
  var multerImage;
  var postingImage;
  TextEditingController categoryNameContorller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(h * 0.08),
        child: CustomAppBar(
          appTitle1: 'Edit',
          appTitle2: "Category",
          leadingWant: true,
        ),
      ),
      body: Container(
        height: h,
        width: w,
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
                        builder: (BuildContext contex) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            actions: [
                              Custom_Button(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                height: h * 0.05,
                                width: w * 0.3,
                                text: "Cancel",
                                color: Color(0xffFABB51),
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
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        getFromCamera();
                                      },
                                      icon: Icon(
                                        Icons.camera_alt,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        getFromGallery();
                                      },
                                      icon: Icon(Icons.image)),
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
                                          text: "Edit Photo ",
                                          color: const Color(0xff9FB3BF),
                                        )),
                                    Container(
                                        alignment: Alignment.center,
                                        height: h * 0.03,
                                        width: w * 0.35,
                                        child: CustomText(
                                          text: "Edit item images",
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
                          child: Image.file(File("${pickedImagePath}")),
                        ),
                ),
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
                    child: CustomFormField(
                      controller: categoryNameContorller,
                      height: h * 0.05,
                      width: w * 0.9,
                      hintText: "Enter Category Name",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),
            Custom_Button(
              height: h * 0.06,
              width: w * 0.9,
              onTap: () {
                EditCategory();
              },
              borderRadius: BorderRadius.circular(5),
              text: "Save",
              color: const Color(0xffFABB51),
            )
          ],
        ),
      ),
    );
  }

  getFromGallery() async {
    pickedImage = (await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 30,
    ));
    if (pickedImage != null) {
      print(pickedImage);
      setState(() {
        pickedImagePath = pickedImage!.path;
      });
      print("image path gal: ${pickedImage!.path}");
      postImage(inComingFile: pickedImagePath);
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
      print("image path from cam:${pickedImage!.path}");
      postImage(inComingFile: pickedImagePath);
      Navigator.pop(context);
    }
  }

  Future EditCategory() async {
    // https://www.cviacserver.tk/templecity/c_list/Edit_category
    var baseUrl = BaseUrl().baseUrl;
    print(
      "category_name : ${categoryNameContorller.text.toString()}",
    );
    print("category_image:${postingImage.toString()}");
    var url = Uri.parse("${baseUrl}c_list/Edit_category");
    var response = await http.post(url, body: {
      "category_name": categoryNameContorller.text.toString(),
      "category_image": postingImage.toString(),
    });
    //print(response.body);
    var decodeDeatilas = json.decode(response.body);
    print(decodeDeatilas);

    if (decodeDeatilas["status"] == 200) {
      final snackbar = SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: CustomText(
          text: "Category Edited succesfully",
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

  postImage({inComingFile}) async {
    // https://www.cviacserver.tk/templecity/food/postImage
    final String url = "https://www.cviacserver.tk/templecity/food/postImage";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('File', inComingFile));
    var res = await request.send();
    var response = await http.Response.fromStream(res);
    multerImage = json.decode(response.body);
    print("MulterImage : $multerImage");
    postingImage = multerImage['image']['filename'];
    print("Image: $postingImage");
    print("multer posted");
  }
}
