import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/functions/handlingDataController.dart';
import 'package:e_commerce_app/data/datasource/remote/home_data.dart';
import 'package:e_commerce_app/data/datasource/remote/offers_data.dart';
import 'package:e_commerce_app/data/model/itemmodel.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OffersController extends GetxController {
  OffersData offersData = OffersData(Get.find());
  HomeData homedata = HomeData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  List<ItemsModel> dataModel = [];

  getOffers() async {
    statusRequest = StatusRequest.loading;
    var response = await offersData.offerData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        // logger.w("=============================== Controller $response ");
        // List data = response['data'];
        //  debugPrint(data);
        data.addAll(response['data'].map((e) => ItemsModel.fromJson(e)));
        //  data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

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

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.searchData(search.toString());
    logger.w("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      data.clear();
      if (response['status'] == "success") {
        data.clear();
        List dataModel = response["data"];
        dataModel.addAll(dataModel.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getOffers();
    super.onInit();
  }
}
