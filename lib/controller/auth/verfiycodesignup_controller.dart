import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/pagescall/pagename.dart';
import '../../core/functions/handlingDataController.dart';
import '../../data/datasource/remote/auth/verfiycodesignupdata.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  // checkCode();
  goToSuccessSignUp(String verfiycoderesetpassword);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  // checkCode() {}
  verfitcodeSignupData testverfitcodeDignupData =
      verfitcodeSignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
/*   String? Resendverfiycode;
 */
  @override
  goToSuccessSignUp(verfiycoderesetpassword) async {
    statusRequest =
        StatusRequest.loading; //اول ما نستدعي الداتا بيكون ف مرحلة التحميل لسه
    var response = await testverfitcodeDignupData.postData(
        email!, verfiycoderesetpassword);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning",
            middleText: " Verfiy Code Not Correct ",
            titleStyle: const TextStyle(color: Colors.red));
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  Resend() async {
      statusRequest =
        StatusRequest.loading;
        var response = await testverfitcodeDignupData.resendVerfiyCode(email!);

    if (response["status"] == "success") {
      Get.offNamed(AppRoute.successSignUp);
    }
    update();
  }

  @override
  void onInit() {
    // goToSuccessSignUp();
    email = Get.arguments["email"];
    super.onInit();
  }
}
