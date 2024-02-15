import '../../../core/class/crud.dart';
import '../../linkApi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);
  addData(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.addfavorite, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }

  removeData(String usersid, String itemsid) async {
    var response = await crud.postData(
        AppLink.removefavorite, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((l) => l, (r) => r);
  }
}
