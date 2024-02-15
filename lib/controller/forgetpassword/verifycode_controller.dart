import 'package:e_commerce_app/data/datasource/remote/forgetpassword/verfiycoderesetpassworddata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/pagescall/pagename.dart';
import '../../core/functions/handlingDataController.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode(String verfiycodesignup);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  verfiycodeforgetpasswordData testverfiycodeforgetpasswordData =
      verfiycodeforgetpasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  @override
  checkCode(verfiycodesignup) async {
    statusRequest =
        StatusRequest.loading; //اول ما نستدعي الداتا بيكون ف مرحلة التحميل لسه
    var response = await testverfiycodeforgetpasswordData.postData(
        email!, verfiycodesignup);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: " Verfiy Code is Not Correct ",
            titleStyle: const TextStyle(color: Colors.red));
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }
}
