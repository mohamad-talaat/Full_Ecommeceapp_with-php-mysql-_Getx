import 'package:e_commerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class settings extends StatelessWidget {
  const settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 50,
        ),
        IconButton(
            onPressed: () {
              Get.off(const Login());
            },
            icon: const Icon(Icons.exit_to_app))
      ]),
    );
  }
}
