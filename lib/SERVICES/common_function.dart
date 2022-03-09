import 'dart:convert';

import 'package:admintemplecity/SERVICES/baseurl.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CommonFunctions extends ChangeNotifier {
  var getData;
  var dishData;
  bool? convertTrue;
  bool? convertFalse;
  var getBool;

  changer({value}) {
    getBool = value;
    getBool = !getBool;
    print(" provide function:$getBool");
    notifyListeners();
  }

  makeTrue(value) {
    value = !value;
    getData = value;
    notifyListeners();
  }

  Future apiGet({incomingFeild}) async {
    var baseUrl = BaseUrl().baseUrl;
    var url = Uri.parse("${baseUrl}${incomingFeild}");
    var respone = await http.get(url);
    var decodeData = json.decode(respone.body);
    print(decodeData);
    print("this is from pro");
    getData = decodeData['result'];
    notifyListeners();
  }

  Future apiDishGet({incomingFeild}) async {
    var baseUrl = BaseUrl().baseUrl;
    var url = Uri.parse("${baseUrl}${incomingFeild}");
    var respone = await http.get(url);
    var decodeData = json.decode(respone.body);
    print(decodeData);
    dishData = decodeData['result'];
    notifyListeners();
  }
}
