import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../widget/customappbar.dart';
import '../../widget/handlingdata/handlingdataview.dart';
import '../../widget/home/customcardhome.dart';
import '../../widget/home/customtitlehome.dart';
import '../../widget/home/listcategorieshome.dart';
import '../../widget/home/listitemshome.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView(
                    children: [
                      CustomAppBar(
                        titleappbar: "Find Product",
                        onPressedIcon: () {},
                        onPressedSearch: () {},
                        onPressedfavorite: () {
                          Get.toNamed("myfavoritePage");
                        },
                      ),
                      const CustomCardHome(
                          title: "A summer surprise", body: "Cashback 20%"),
                      const CustomTitleHome(title: "Categories"),
                      const ListCategoriesHome(),
                      const CustomTitleHome(title: "Product for you"),
                      const ListItemsHome(),
                      const CustomTitleHome(title: "Offer"),
                      const ListItemsHome()
                    ],
                  )))),
    );
  }
}
