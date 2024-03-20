import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addAddress.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddAddress());
          //       Get.toNamed(AppRoute.addAddress);
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text("address"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
