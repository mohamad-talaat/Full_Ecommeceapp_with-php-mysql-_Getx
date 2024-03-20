import 'package:e_commerce_app/core/constant/color.dart';
import 'package:e_commerce_app/core/pagescall/pagename.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/homescreen_controller.dart';
import '../widget/bottomnavbarscreen/custommaterialbutton.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(homescreenControllerImp());
    return GetBuilder<homescreenControllerImp>(
      assignId: true,
      builder: (controller) {
        return Scaffold(
            body: controller.ListPage.elementAt(controller.currentpage),
            //controller.ListPage[controller.currentPage],
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColor.primaryColor,
              onPressed: () {
                Get.toNamed(AppRoute.cart);
              },
              child: const Icon(Icons.shopping_basket_outlined, size: 35),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Row(children: [
                ...List.generate(
                    controller.ListPage.length,
                    (index) => Expanded(
                          child: CustomMaterialButton(
                              onpressed: () {
                                controller.changePage(index);
                              },
                              //    iconbutton: Icons.home,
                              iconbutton: controller.bottomNav[index]['icon'],
                              //    active: controller.changePage(0) == true,
                              active: controller.currentpage == index
                                  ? true
                                  : false,
                              textButton: controller.bottomNav[index]['name']),
                        ))
              ]),
            ));
      },
    );
  }
}
