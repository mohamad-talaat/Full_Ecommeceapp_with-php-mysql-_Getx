import 'package:e_commerce_app/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/view/widget/auth/custombuttonauth.dart';
import 'package:e_commerce_app/view/widget/auth/customtextbodyauth.dart';
import 'package:e_commerce_app/view/widget/auth/customtextformauth.dart';
import 'package:e_commerce_app/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widget/handlingdata/handlingdataview.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColor.backgroundcolor,
          elevation: 0.0,
          title: Text('14'.tr,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: AppColor.grey)),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            assignId: true,
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(children: [
                        const SizedBox(height: 20),
                        CustomTextTitleAuth(text: "27".tr),
                        const SizedBox(height: 10),
                        CustomTextBodyAuth(
                            // please Enter Your Email Address To Recive A verification code
                            text: "29".tr),
                        const SizedBox(height: 15),
                        CustomTextFormAuth(
                          isNumber: false,
                          valid: (val) {
                            return null;
                          },
                          mycontroller: controller.email,
                          hinttext: "12".tr,
                          iconData: Icons.email_outlined,
                          labeltext: "18".tr,
                          // mycontroller: ,
                        ),
                        CustomButtonAuth(
                            text: "30".tr,
                            onPressed: () {
                              controller.checkemail();
                            }),
                        const SizedBox(height: 40),
                      ]),
                    ),
                  ),
                )));
  }
}
