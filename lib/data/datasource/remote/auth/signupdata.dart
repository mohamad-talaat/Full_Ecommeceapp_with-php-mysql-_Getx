import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';

class SignupData {
  late Crud crud;
  SignupData(this.crud);
  postData(String name, String email, String password, String phone) async {
    // debugPrint("the problem <<<<<<<<<in Link Data");

    var response = await crud.postData(AppLink.LinkSignUp, {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    });
    //debugPrint("the problem <<<<<<<<<in get Data");
    return response.fold((l) => l, (r) => r);
  }
}
