import 'package:get/get.dart';

import '../core/class/statusrequest.dart';
import '../core/functions/handlingDataController.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/myfavorite_data.dart';
import '../data/model/myfavorite_model.dart';

class MyFavoriteController extends GetxController {
  MyFavoriteData myfavoriteData = MyFavoriteData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();

  viewFavorite() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myfavoriteData
        .viewData(myServices.sharedPreferences.getString("id")!);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        List resdata = response['data'];
        data.addAll(resdata.map((e) => MyFavoriteModel.fromJson(e)));
        // ف الاسكرين  MyFavoriteModel.fromJson(e) وفرت عليا استدعاء لل

        //   data.addAll(response['data']); //  MyFavoriteModel.fromJson(لمكان العنصر اللي عاوز اطبعه )
        print(data);
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  List<MyFavoriteModel> data = [];

  void deleteMyfavorite(String favoriteid) async {
    //data.clear();
    var response = await myfavoriteData.deleteDataFromMyFavorite(favoriteid);
    print("=============================== Controller $response ");
    data.removeWhere((element) => element.favoriteId == favoriteid);
  /*   data.remove(favoriteid); */

    // تحديث واجهة المستخدم فورًا
    update();
  }

  @override
  void onInit() {
    viewFavorite();
    // TODO: implement onInit
    super.onInit();
  }
}
