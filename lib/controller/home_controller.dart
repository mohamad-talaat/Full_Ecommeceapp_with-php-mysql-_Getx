import 'package:e_commerce_app/core/class/statusrequest.dart';
import 'package:e_commerce_app/core/pagescall/pagename.dart';
import 'package:e_commerce_app/core/functions/handlingDataController.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/data/datasource/remote/home_data.dart';
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
  // List items = [];

  late StatusRequest statusRequest;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homedata.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(categories, selectedcategory, categoryid) {
    Get.toNamed(AppRoute.Items, arguments: {
      "categories": categories,
      "selectedcategory": selectedcategory,
      "catid": categoryid
    });
  }
}
