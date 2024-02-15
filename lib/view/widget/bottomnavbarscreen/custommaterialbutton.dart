import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final void Function()? onpressed;
  final IconData iconbutton;
  final String textButton;
  final bool active;

  const CustomMaterialButton(
      {Key? key,
      required this.onpressed,
      required this.iconbutton,
      required this.textButton,
      required this.active})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Icon(
              iconbutton,
              color: active == true ? AppColor.primaryColor : Colors.black,
            ),
            Text(
              "${textButton}",
              style: TextStyle(
                color: active == true ? AppColor.primaryColor : Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
