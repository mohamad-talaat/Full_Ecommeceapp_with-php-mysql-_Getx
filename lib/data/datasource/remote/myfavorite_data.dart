import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';

class MyFavoriteData {
  Crud crud;
  MyFavoriteData(this.crud);
  viewData(String userid) async {
    var response =
        await crud.postData(AppLink.viewfavorite, {"id": userid.toString()});
    return response.fold((l) => l, (r) => r);
  }  
  deleteDataFromMyFavorite(String id) async {
    var response =
        await crud.postData(AppLink.deleteFromMyfavorite, {"id": id.toString()});
    return response.fold((l) => l, (r) => r);
  }
}
