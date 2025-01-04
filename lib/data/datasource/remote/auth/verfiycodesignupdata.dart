import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';
import 'package:flutter/material.dart';

class verfitcodeSignupData {
  late Crud crud;
  verfitcodeSignupData(this.crud);
  postData(String email, String verfiycode) async {
    debugPrint("the problem <<<<<<<<<in Link Data verfiy code");

    var response = await crud.postData(AppLink.LinkVerfiyCodeSignUp, {
      "email": email,
      "users_verfiycode": verfiycode,
    });
    debugPrint("the problem <<<<<<<<<in get Data , verfiy code");

    return response.fold((l) => l, (r) => r);
  }

  resendVerfiyCode(String email) async {
    debugPrint("the problem <<<<<<<<<in Link Data verfiy code");

    var response = await crud.postData(AppLink.LinkForResendVerfiyCode, {
      "email": email,
    });
    debugPrint("the problem <<<<<<<<<in get Data , verfiy code");

    return response.fold((l) => l, (r) => r);
  }
}
