import 'package:e_commerce_app/controller/address/adddetails_controller.dart';
import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/address_data.dart';
import 'package:e_commerce_app/data/datasource/remote/checkout_date.dart';
import 'package:e_commerce_app/data/model/addressmodel.dart';
import 'package:get/get.dart';

import '../core/functions/handlingDataController.dart';
import '../core/pagescall/pagename.dart';

class CheckoutController extends GetxController {
  AddressData addressData = Get.put(AddressData(Get.find()));
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  AddAddressDetailsController addressLatLong =  Get.put( AddAddressDetailsController());

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  String? paymentMethod;
  String? deliveryType;
  String addressid = "0";

  late String couponid;
  String? coupondiscount;
  late String priceorders;

  List<AddressModel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  chooseShippingAddress(String val) {
    addressid = val;
    update();
  }


   getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    logger.w("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List listdata = response['data'];
        dataaddress.addAll(listdata.map((e) => AddressModel.fromJson(e)));

        logger.w("Data address is: $dataaddress");
        addressid = dataaddress[0].addressId.toString();

      } else {
        statusRequest = StatusRequest.success;
      }
      // End
    }
    update();
  }

  checkout() async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }
    if (deliveryType == null) {
      return Get.snackbar("Error", "Please select a order Type");
    }
    // if (deliveryType == "0" && dataaddress.isEmpty  ) {
      if (deliveryType == "0" && dataaddress.isEmpty ) {
      Get.snackbar("No Address Found", "You Must Select Address");
    }
    // if (deliveryType == "0" && dataaddress.isNotEmpty ) {
    //   addressid = dataaddress[0].addressId.toString();
    // }

    statusRequest = StatusRequest.loading;
    update();

    Map data = {
      "usersid": myServices.sharedPreferences.getString("id"),
      "addressid": addressid.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": priceorders.toString(),
      "couponid": couponid.toString(),
      "coupondiscount": coupondiscount.toString(),
      "paymentmethod": paymentMethod.toString(),
      //   "orders_totalprice": "1500" //totalPrice.toString()
    };

    var response = await checkoutData.checkout(data);



    logger.d("$response");

    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {

        Get.offAllNamed(AppRoute.homePage);
        Get.snackbar("Success", "the order was successfully");
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar("Error", "try again");
      }
      // End
    }
    update();
  }

//  var totalPrice = 0.0;

  @override
  void onInit() {
    // totalPrice = Get.arguments['totalPrice'];
    couponid = Get.arguments['couponid'].toString();
    priceorders = Get.arguments['priceorder'];
    coupondiscount = Get.arguments['coupondiscount'].toString();

    getShippingAddress();
    super.onInit();
  }
}
