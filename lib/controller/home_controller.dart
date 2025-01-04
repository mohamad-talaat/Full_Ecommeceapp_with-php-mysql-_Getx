import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/functions/handlingDataController.dart';
import 'package:e_commerce_app/core/pagescall/pagename.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/home_data.dart';
import 'package:e_commerce_app/data/model/itemmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToItems(List categories, int selectedCat, String categoryid);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();

  String? username;
  String? id;
  String? lang;

  HomeData homedata = HomeData(Get.find());

  // List data = [];
  List categories = [];
  List items = [];
  // List settings = [];
  String homeTitleSettings = "";
  String homebodySettings = "";

  late StatusRequest statusRequest;

  TextEditingController? search;
  bool issearch = false;
  changeSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      issearch = false;
    }
    update();
  }

  onSearchItem() {
    issearch = true;
    searchData();
    update();
  }

  // ckeckSearch(searchValue) {
  //   if (searchValue == "") {
  //     issearch = false;
  //   } else {
  //     issearch = true;
  //     searchData();
  //   }
  //   update();
  // }          // my way >> to search by char

  List<ItemsModel> listdata = [];
  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search!.text);
    logger.w("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      listdata.clear();
      if (response['status'] == "success") {
        listdata.clear();
        List dataModel = response["data"];
        listdata.addAll(dataModel.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    logger.w("=============================== Controller $response ");
      statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // تحويل القواميس إلى قوائم قبل استخدام addAll
        categories.addAll(List.from(response['categories']['data']));
        items.addAll(List.from(response['items']['data']));
        homeTitleSettings =
            response['settings']['data'][0]['settings_hometitle'];
        homebodySettings = response['settings']['data'][0]['settings_homebody'];
        // settings.addAll(List.from(response['settings']['data']));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  initialData() {
    // myServices.sharedPreferences.clear() ;
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  goToItems(categories, selectedCat, categoryid) {
    Get.toNamed(AppRoute.Items, arguments: {
      "categories": categories,
      "selectedcat": selectedCat,
      "catid": categoryid
    });
  }

  goToPageProductDetails(itemsModel) {
    Get.toNamed("productDetails", arguments: {"itemsmodel": itemsModel});
  }
}
