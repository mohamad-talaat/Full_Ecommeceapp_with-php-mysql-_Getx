import '../../../core/class/crud.dart';
import '../../linkApi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkcoupon, data);
    print("problem checkout");
    return response.fold((l) => l, (r) => r);
    print("response" + response.toString());
  }
}
