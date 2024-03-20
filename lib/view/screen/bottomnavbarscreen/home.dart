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
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
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
                          widget: const Column(
                            children: [
                              CustomCardHome(
                                  title: "A summer surprise",
                                  body: "Cashback 20%"),
                              CustomTitleHome(title: "Categories"),
                              ListCategoriesHome(),
                              CustomTitleHome(title: "Product for you"),
                              ListItemsHome(),
                              CustomTitleHome(title: "Offer"),
                              ListItemsHome()
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
  const searchScreen({Key? key, required this.listdatamodel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listdatamodel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToPageProductDetails(listdatamodel[index]);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: Card(
                  child: Container(
                padding: EdgeInsets.all(10),
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
