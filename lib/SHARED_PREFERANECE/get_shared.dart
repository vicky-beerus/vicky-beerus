import 'package:admintemplecity/SHARED_PREFERANECE/shared_preferance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GetShared extends ChangeNotifier {
  var adminName;
  var adminId;
  var branch;

  Future getShared() async {
    await Shared().shared().then((value) {
      print(value);
      adminId = value.getStringList('admin');
      print("dfdf");
    });
    notifyListeners();
  }
}
