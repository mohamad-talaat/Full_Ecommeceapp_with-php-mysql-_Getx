import 'package:e_commerce_app/core/services/services.dart';
import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../data/datasource/remote/myfavorite_data.dart';
import '../data/model/myfavorite_model.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  List<MyFavoriteModel> data = [];

  Future<void> viewFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    try {
      var response = await myfavoriteData
          .viewData(myServices.sharedPreferences.getString("id")!);
      logger.w("=============================== Controller $response ");

      if (response is Map && response.containsKey('status')) {
        if (response['status'] == "success") {
          List resdata = response['data'];
          data.addAll(resdata.map((e) => MyFavoriteModel.fromJson(e)));
          statusRequest = StatusRequest.success;
          print(data);
        } else {
          statusRequest = StatusRequest.serverfailure;
        }
      } else {
        statusRequest = StatusRequest.serverfailure;
      }
    } catch (e) {
      print('============================ Error View Favorites $e');
      statusRequest = StatusRequest.serverfailure;
    }
    update();
  }

  Future<void> deleteMyfavorite(String favoriteid) async {
    try {
      var response = await myfavoriteData.deleteDataFromMyFavorite(favoriteid);
      logger.w("=============================== Controller $response ");
      data.removeWhere(
          (element) => element.favoriteId.toString() == favoriteid.toString());
      update();
    } catch (e) {
      print('============================ Error Delete Favorites $e');
      statusRequest = StatusRequest.serverfailure;
    }
  }

  @override
  void onInit() {
    viewFavorite();
    super.onInit();
  }
}
