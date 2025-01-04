import 'package:flutter/material.dart';

import '../../../core/class/crud.dart';
import '../../linkApi.dart';

class CheckoutData {
  Crud crud;
  CheckoutData(this.crud);
  checkout(Map data) async {
    var response = await crud.postData(AppLink.checkout, data);
    debugPrint("problem checkout");
    return response.fold((l) => l, (r) => r);
    debugPrint("response$response");
  }
}
