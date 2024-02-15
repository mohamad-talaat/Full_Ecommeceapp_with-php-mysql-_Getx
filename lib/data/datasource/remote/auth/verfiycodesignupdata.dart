import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';

class verfitcodeSignupData {
  late Crud crud;
  verfitcodeSignupData(this.crud);
  postData(String email, String verfiycode) async {
    print("the problem <<<<<<<<<in Link Data verfiy code");

    var response = await crud.postData(AppLink.LinkVerfiyCodeSignUp, {
      "email": email,
      "verfiycode": verfiycode,
    });
    print("the problem <<<<<<<<<in get Data , verfiy code");

    return response.fold((l) => l, (r) => r);
  }
  
  
  
  resendVerfiyCode(String email) async {
    print("the problem <<<<<<<<<in Link Data verfiy code");

    var response = await crud.postData(AppLink.LinkForResendVerfiyCode, {
      "email": email,
    });
    print("the problem <<<<<<<<<in get Data , verfiy code");

    return response.fold((l) => l, (r) => r);
  }


}
