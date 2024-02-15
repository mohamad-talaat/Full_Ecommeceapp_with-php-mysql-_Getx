import 'package:e_commerce_app/core/pagescall/pagename.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/functions/handlingDataController.dart';
import '../../data/datasource/remote/forgetpassword/resetpassworddata.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;

  ResetPasswordData testresetPasswordData = ResetPasswordData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  goToSuccessResetPassword() async {
    if (password.text != repassword.text)
      return Get.defaultDialog(
          title: "Warning",
          middleText: " The passwords not match ",
          titleStyle: const TextStyle(color: Colors.red));

    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await testresetPasswordData.postData(email!, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["status"] == "success") {
          Get.offNamed(AppRoute.successResetpassword);
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: " Try Again ",
              titleStyle: const TextStyle(color: Colors.red));
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {}

    //   Get.offNamed(AppRoute.successResetpassword);
    // } else {
    //   print("Not Valid");
    // }
  }

  String? email;
  @override
  void onInit() {
    email = Get.arguments["email"];
    password = TextEditingController();
    repassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    password.dispose();
    repassword.dispose();
    super.dispose();
  }
}
