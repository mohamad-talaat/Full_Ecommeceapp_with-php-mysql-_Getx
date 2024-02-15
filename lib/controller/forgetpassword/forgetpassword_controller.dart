import 'package:e_commerce_app/data/datasource/remote/forgetpassword/checkemaildata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/pagescall/pagename.dart';
import '../../core/functions/handlingDataController.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  checkEmailData testcheckEmailData = checkEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkemail() async {
    statusRequest =
        StatusRequest.loading; //اول ما نستدعي الداتا بيكون ف مرحلة التحميل لسه
    var response = await testcheckEmailData.postData(email.text);
    // ignore: avoid_print
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.verfiyCode, arguments: {"email": email.text});
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: " Email is Not Correct ",
            titleStyle: const TextStyle(color: Colors.red));
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // late String verfiycode;

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
