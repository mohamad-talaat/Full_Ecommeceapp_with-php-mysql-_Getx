import 'package:e_commerce_app/controller/cart_controller.dart';
import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:get/get.dart';

import '../data/model/itemmodel.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartController cartController = Get.put(CartController());
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int countitems = 1;

  intialData() async {
    statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsmodel'];
    countitems =
        await cartController.viewCountCart(itemsModel.itemsId.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  addone() {
    cartController.addData(itemsModel.itemsId.toString());
    countitems++;
    update();
  }

  removeone() {
    if (countitems > 0) {
      cartController.deleteCart(itemsModel.itemsId.toString());
      countitems--;
    }
    update();
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
