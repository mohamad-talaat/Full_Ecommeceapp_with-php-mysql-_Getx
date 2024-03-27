import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';

class CartData {
  Crud crud = Crud();

  CartData(this.crud);

  viewData(id) async {
    var response = await crud.postData(AppLink.viewCart, {
      "usersid": id,
    });

    return response.fold((l) => l, (r) => r);
  }

  addCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.addCart,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});

    return response.fold((l) => l, (r) => r);
  }

  deleteCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.removeCart,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});

    return response.fold((l) => l, (r) => r);
  }

  countCart(String usersid, String itemsid) async {
    var response = await crud.postData(AppLink.countcart,
        {"usersid": usersid.toString(), "itemsid": itemsid.toString()});

    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(String couponname) async {
    var response =
        await crud.postData(AppLink.checkcoupon, {"couponname": couponname});
    print("problem in checkcoupon");
    return response.fold((l) => l, (r) => r);
    print("problem in response.fold");
  }
}
