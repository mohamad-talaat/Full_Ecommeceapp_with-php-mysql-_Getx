import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/offers_controller.dart';
import 'package:e_commerce_app/data/model/itemmodel.dart';
import 'package:e_commerce_app/view/widget/customappbar.dart';
import 'package:e_commerce_app/view/widget/handlingdata/handlingdataview.dart';
import 'package:e_commerce_app/view/widget/offers/customlistitemsoffers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(HomeControllerImp());
    FavoriteController controllerFav = Get.put(FavoriteController());

    OffersController controller = Get.put(OffersController());

    return GetBuilder<OffersController>(
        builder: (controller) => ListView(children: [
              CustomAppBar(
                mycontroller: controller.search!,
                onChange: (val) {
                  controller.changeSearch(val);
                  //   controller.changeSearch(val);
                },
                titleappbar: "Find Product",
                onPressedSearch: () {
                  controller.onSearchItem();
                  //controller.onSearchItem();
                },
                onPressedfavorite: () {
                  Get.toNamed("myfavoritePage");
                },
              ),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      itemBuilder: (BuildContext context, index) {
                        return CustomListItemsOffers(
                            itemsModel: controller.data[index] as ItemsModel);
                      }))
            ]));
  }
}
