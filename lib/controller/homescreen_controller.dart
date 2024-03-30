import 'package:e_commerce_app/view/screen/bottomnavbarscreen/home.dart';
import 'package:e_commerce_app/view/screen/notification.dart';
import 'package:e_commerce_app/view/screen/offers.dart';
import 'package:e_commerce_app/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
abstract class homescreenController extends GetxController {
  changePage(int currentpage);
}

// ignore: camel_case_types
class homescreenControllerImp extends homescreenController {
  // ignore: non_constant_identifier_names
  List<Widget> ListPage = <Widget>[
    const Home(),
    
    const NotificationView(),
    const Offers(),
    const Settings(),
  ];
  List bottomNav = [
    {"name": "Home", "icon": Icons.home},
    {"name": "notific.. ", "icon": Icons.notifications_active},
    {"name": "favorite", "icon": Icons.local_offer_outlined},
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
}
