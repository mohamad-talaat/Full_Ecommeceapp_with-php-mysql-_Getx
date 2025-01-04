import 'package:e_commerce_app/core/functions/handlingDataController.dart';
import 'package:e_commerce_app/data/datasource/remote/testdata.dart';
import 'package:get/get.dart';
import '../core/class/statusrequest.dart';

class TestController extends GetxController {
  //Crud crud = Crud();
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest =
        StatusRequest.loading; //اول ما نستدعي الداتا بيكون ف مرحلة التحميل لسه
    var response = await testData.getData();
    // logger.w("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["status"] == "success") data.addAll(response['data']);
      // if (response["status"] == "ok") data.addAll(response['articles']);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
