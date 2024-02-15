import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';

class verfiycodeforgetpasswordData {
  late Crud crud;
  verfiycodeforgetpasswordData(this.crud);
  postData(String email, String verfiycode) async {
    print("the problem <<<<<<<<<in Link Data verfiy code");

    var response = await crud.postData(AppLink.Linkverfiycodeforgetpassword, {
      "email": email,
      "verfiycode": verfiycode,
    });
    print("the problem <<<<<<<<<in get Data , verfiy code");

    return response.fold((l) => l, (r) => r);
  }
}
