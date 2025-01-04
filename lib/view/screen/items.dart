import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/controller/favorite_controller.dart';
import 'package:e_commerce_app/controller/items_controller.dart';
import 'package:e_commerce_app/data/model/itemmodel.dart';
import 'package:e_commerce_app/view/widget/handlingdata/handlingdataview.dart';
import 'package:e_commerce_app/view/widget/items/customlistitems.dart';
import 'package:e_commerce_app/view/widget/items/listcategoriesitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../data/linkApi.dart';
import '../widget/customappbar.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteController controllerfav = Get.put(FavoriteController());
    Get.put(HomeControllerImp());

    return Scaffold(
        body: GetBuilder<HomeControllerImp>(
            builder: (controller) => Container(
                padding: const EdgeInsets.all(15),
                child: ListView(children: [
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
                  const SizedBox(height: 20),
                  const ListCategoriesItems(),
                  !controller.issearch
                      ? GetBuilder<ItemsControllerImp>(
                          builder: (controller) => HandlingDataView(
                              statusRequest: controller.statusRequest,
                              widget: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: controller.data.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.7),
                                  itemBuilder: (BuildContext context, index) {
                                    controllerfav.isFavorite[controller
                                            .data[index]['items_id']] =
                                        controller.data[index]
                                            ['favorite']; //key = value

                                    return CustomListItems(
//   active: false,
                                        itemsModel: ItemsModel.fromJson(
                                            controller.data[index]));
                                  })))
                      : searchScreen(listdatamodel: controller.listdata)
                ]))));
  }
}

class searchScreen extends GetView<HomeControllerImp> {
  final List<ItemsModel> listdatamodel;
  const searchScreen({super.key, required this.listdatamodel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${AppLink.imagestItems}/${listdatamodel[index].itemsImage}")),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(listdatamodel[index].itemsName!),
                          subtitle: Text(listdatamodel[index].categoriesName!),
                        )),
                  ],
                ),
              )),
            ),
          );
        });
  }
}
