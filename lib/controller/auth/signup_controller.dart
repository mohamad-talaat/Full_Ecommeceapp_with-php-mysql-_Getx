import 'package:e_commerce_app/core/pagescall/pagename.dart';
import 'package:e_commerce_app/core/functions/handlingDataController.dart';
import 'package:e_commerce_app/data/datasource/remote/auth/signupdata.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
} // عمل كدا ليه لأن لأنه عاوز يفصل الكود ويوزعة لكن عادي يعني
// من الاخر عشان الميثود تتنفذ هحطها ف الجيت أكس

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest statusRequest = StatusRequest.none;

  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  SignupData testDataSignUp = SignupData(Get.find());
  List data = [];
  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await testDataSignUp.postData(
          name.text, email.text, password.text, phone.text);
      print("------------------$response------------------");
      statusRequest = handlingData(response);

      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          //   data.addAll(response['data']);
          Get.offNamed(AppRoute.verfiyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning",
              titleStyle: const TextStyle(color: Colors.red),
              middleText: "Phone Number or Email is Already Exist");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignIn() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    name = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }

/*   void showPassword() {}
 */
}
