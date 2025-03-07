import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../data/linkApi.dart';
import '../../../data/model/itemmodel.dart';
import '../../widget/customappbar.dart';
import '../../widget/handlingdata/handlingdataview.dart';
import '../../widget/home/customcardhome.dart';
import '../../widget/home/customtitlehome.dart';
import '../../widget/home/listcategorieshome.dart';
import '../../widget/home/listitemshome.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
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
                  !controller.issearch
                      ? HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: Column(
                            children: [
                              CustomCardHome(
                                  // title: controller.settings[0]['settings_hometitle'],
                                  // body: controller.settings[0]['settings_homebody']),
                                  title:
                                      controller.homeTitleSettings.toString(),
                                  body: controller.homebodySettings.toString()),
                              const CustomTitleHome(title: "Categories"),
                              const ListCategoriesHome(),
                              const CustomTitleHome(title: "Product for you"),
                              const ListItemsHome(),
                              const CustomTitleHome(title: "Top Selling"),
                              const ListItemsHome()
                            ],
                          ))
                      : searchScreen(listdatamodel: controller.listdata)
                ],
              ))),
    );
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
