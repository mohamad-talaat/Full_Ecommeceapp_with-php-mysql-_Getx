import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';

class LoginData {
  late Crud crud;
  LoginData(this.crud);
  postData(String email, String password) async {
    // debugPrint("the problem <<<<<<<<<in Link Data");

    var response = await crud.postData(AppLink.LinkLogin, {
      "email": email,
      "password": password,
    });
    //debugPrint("the problem <<<<<<<<<in get Data");
    return response.fold((l) => l, (r) => r);
  }
}
