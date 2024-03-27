import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/pagescall/pagename.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/cart_data.dart';
import 'package:e_commerce_app/data/model/cartmodel.dart';
import 'package:e_commerce_app/data/model/couponmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/functions/handlingDataController.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;

  MyServices myServices = Get.find();

  List<CartModel> data = [];

  double priceorders = 0.0;

  int totalcountitems = 0;

  add(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم اضافة المنتج الى السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  delete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();

    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "اشعار",
            messageText: const Text("تم ازالة المنتج من السلة "));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  TextEditingController? couponcontroller;

  getTotalPrice() {
    return (priceorders - priceorders * discountcoupon! / 100);
  }

  int? discountcoupon = 0;
  String? couponname;
  int? couponid;
  CouponModel? couponModel;

  checkcoupon() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(couponcontroller!.text);
    print("=============================== Controller response $response ");
    statusRequest = handlingData(response);
    print(
        "=============================== Controller statusRequest $statusRequest ");
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = int.parse(couponModel!.couponDiscount.toString());
        couponname = couponModel!.couponName;
        couponid = couponModel!.couponId;
      } else {
        // statusRequest = StatusRequest.failure;
        discountcoupon = 0;
        couponname = null;
        Get.snackbar("Error", "Coupon Not Found");
      }
      // End
    }
    update();
  }

  goToCheckPage() {
    if (data.isEmpty) return Get.snackbar("Warning", "You Haven`t any order");
    Get.toNamed(AppRoute.checkout, arguments: {
      "coupondiscount": discountcoupon.toString(),
      "couponid": couponid ?? 0,
      "priceorder": priceorders.toString()
    });
  }

  resetVarCart() {
    totalcountitems = 0;
    priceorders = 0;
    data.clear();
  }

  refreshPage() {
    resetVarCart();
    view();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.viewData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        if (response['datacart']['status'] == 'success') {
          List dataresponse = response['datacart']['data'];
          Map dataresponsecountprice = response['countprice'];
          data.clear();
          data.addAll(dataresponse.map((e) => CartModel.fromJson(e)));
          totalcountitems = dataresponsecountprice['totalcount'];
          priceorders =
              double.parse(dataresponsecountprice['totalprice'].toString());

          print(priceorders);
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  @override
  void onInit() {
    couponcontroller = TextEditingController();
    view();
    super.onInit();
  }
}
