import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    // print("the problem <<<<<<<<<in Link Data");
    var response = await crud.postData(AppLink.LinkHomeData, {});
    // print("the problem here is <<<<<<<<<<<<<<<<testData");
    return response.fold((l) => l, (r) => r);
  }

  searchData(String search) async {
    var response = await crud.postData(AppLink.LinkSearch, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
