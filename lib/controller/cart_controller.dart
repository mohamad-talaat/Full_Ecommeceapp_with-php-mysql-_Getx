import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/functions/handlingDataController.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/cart_data.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
//Crud crud = Crud();
  CartData testData = CartData(Get.find());
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.viewData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
        //data.addAll(response['data']);}
        // if (response["status"] == "ok") data.addAll(response['articles']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  //List<ItemsModel> data = [];
  List data = [];
  addData(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await testData.addCart(
        myServices.sharedPreferences.getString("id").toString(), itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {}
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  deleteCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await testData.deleteCart(
        myServices.sharedPreferences.getString("id").toString(), itemsid);

    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") {
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  viewCountCart(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await testData.countCart(
        myServices.sharedPreferences.getString("id").toString(),
        itemsid.toString());
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success" && response['data'] != null) {
        int countitems = 0;
        countitems = int.parse(response['data'].toString());
        print("$countitems");
        return countitems;
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }
}
