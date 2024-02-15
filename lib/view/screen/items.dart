import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/data/model/itemmodel.dart';
import 'package:e_commerce_app/view/widget/customappbar.dart';
import 'package:e_commerce_app/view/widget/handlingdata/handlingdataview.dart';
import 'package:e_commerce_app/view/widget/items/customlistitems.dart';
import 'package:e_commerce_app/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerfav = Get.put(FavoriteController());

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ListView(children: [
          CustomAppBar(
            titleappbar: "Find Product",
            onPressedIcon: () {},
            onPressedSearch: () {},
            onPressedfavorite: () {
              Get.toNamed("myfavoritePage");
              //   controllerfav.viewFavorite(
              //       controllerfav.myServices.sharedPreferences.getString("id")!);
            },
          ),
          const SizedBox(height: 20),
          const ListCategoriesItems(),
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.data.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.7),
                      itemBuilder: (BuildContext context, index) {
                        controllerfav.isFavorite[controller.data[index]
                                ['items_id']] =
                            controller.data[index]['favorite']; //key = value

                        return CustomListItems(
                            //   active: false,
                            itemsModel:
                                ItemsModel.fromJson(controller.data[index]));
                      })))
        ]),
      ),
    );
  }
}
