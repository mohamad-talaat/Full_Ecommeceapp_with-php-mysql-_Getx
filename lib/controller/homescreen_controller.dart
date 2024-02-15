import 'package:e_commerce_app/view/screen/bottomnavbarscreen/home.dart';
import 'package:e_commerce_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class homescreenController extends GetxController {
  changePage(int currentpage);
}

class homescreenControllerImp extends homescreenController {
  List<Widget> ListPage = [
    const Home(),
    const settings(),
    const Column(
      children: [
        Center(
          child: Text("profile"),
        )
      ],
    ),
    const Column(
      children: [
        Center(
          child: Text("favourite"),
        )
      ],
    ),
  ];
  List ListtitleButton = [
    "Home",
    "settings",
    "profile",
    "favourite",
  ];
  // ignore: non_constant_identifier_names
  List ListIconeButton = [
    Icons.home,
    Icons.settings,
    Icons.person,
    Icons.favorite,
  ];

  int currentpage = 0;
  changePage(int index) {
    currentpage = index;
    update();
  }

  // void onInit() {
  //   super.onInit();
  // }
}
