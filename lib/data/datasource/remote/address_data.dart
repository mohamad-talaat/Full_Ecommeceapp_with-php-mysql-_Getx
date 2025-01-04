import '../../../core/class/crud.dart';
import '../../linkApi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  getData(String usersid) async {
    var response =
        await crud.postData(AppLink.viewAddress, {"usersid": usersid});
    return response.fold((l) => l, (r) => r);
  }

  addData(String usersid, String name, String city, String street, String lat,
      String lang) async {
    var response = await crud.postData(AppLink.addAddress, {
      "usersid": usersid,
      "name": name,
      "city": city,
      "street": street,
      "lat": lat,
      "lang": lang,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteData(String addressid) async {
    var response =
        await crud.postData(AppLink.deleteAddress, {"addressid": addressid});
    return response.fold((l) => l, (r) => r);
  }
}
