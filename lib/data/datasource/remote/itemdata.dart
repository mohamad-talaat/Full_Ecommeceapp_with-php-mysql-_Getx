import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';

class ItemsData {
  Crud crud;
  ItemsData(this.crud);
  getData(String id, String userid) async {
    var response = await crud.postData(
        AppLink.LinkItemData, {"id": id.toString(), "usersid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
