import 'package:e_commerce_app/controller/test_controller.dart';
import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/view/widget/handlingdata/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Title")),
        backgroundColor: AppColor.primaryColor,
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        print("StatusRequest: ${controller.statusRequest}");
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                
                itemBuilder: (context, index) {
                  return Text("${controller.data
                      //[index]["title"]
                      }");
                }));
      }),
    );
  }
}
