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
    const Column(
      children: [
        Center(
          child: Text("notifi"),
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
    const Settings(),
  ];
  List bottomNav = [
    {"name": "Home", "icon": Icons.home},
    {"name": "notific.. ", "icon": Icons.notifications_active},
    {"name": "favorite", "icon": Icons.favorite},
    {"name": "settings", "icon": Icons.settings},
  ];
/*   List ListtitleButton = [
    "Home",
    "favourite",
    "profile",
    "settings",
  ];
  // ignore: non_constant_identifier_names
  List ListIconeButton = [
    Icons.home,
    Icons.favorite,
    Icons.person,
    Icons.settings,
  ];
 */
  int currentpage = 0;
  changePage(int index) {
    currentpage = index;
    update();
  }

  // void onInit() {
  //   super.onInit();
  // }
}
