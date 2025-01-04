import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';
import 'package:flutter/material.dart';

class verfiycodeforgetpasswordData {
  late Crud crud;
  verfiycodeforgetpasswordData(this.crud);
  postData(String email, String verfiycode) async {
    debugPrint("the problem <<<<<<<<<in Link Data verfiy code");

    var response = await crud.postData(AppLink.Linkverfiycodeforgetpassword, {
      "email": email,
      "verfiycode": verfiycode,
    });
    debugPrint("the problem <<<<<<<<<in get Data , verfiy code");

    return response.fold((l) => l, (r) => r);
  }
}
