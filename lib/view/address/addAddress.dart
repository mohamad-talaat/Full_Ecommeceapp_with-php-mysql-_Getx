import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("");
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("address"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
