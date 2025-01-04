import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/myfavorite_controller.dart';
import '../widget/handlingdata/handlingdataview.dart';
import '../widget/myfavorite/custom_myfavorite.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());

    return Scaffold(
      body: GetBuilder<MyFavoriteController>(
        assignId: true,
        builder: (controller) {
          return Column(children: [
            const SizedBox(
              height: 10,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: CustomAppBar(
            //     titleappbar: "Find Product",
            //     onPressedSearch: () {},
            //     onPressedfavorite: () {
            //       Get.toNamed(AppRoute.myfavoritePage);
            //       //   controller.viewFavorite();
            //     },
            //   ),
            // ),
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.7),
                    itemBuilder: (BuildContext context, index) {
                      return CustomMyFavorite(
                          itemsModel: controller.data[index]);
                    }))
          ]);
        },
      ),
    );
  }
}
