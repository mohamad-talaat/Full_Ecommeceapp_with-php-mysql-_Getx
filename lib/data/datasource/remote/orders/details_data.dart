
 import '../../../../core/class/crud.dart';
 import '../../../linkApi.dart';

 class OrdersDetailsData {
   Crud crud;
   OrdersDetailsData(this.crud);
   getData(String id) async {
     var response = await crud.postData(AppLink.ordersdetails, {"id": id});
     return response.fold((l) => l, (r) => r);
   }
 }
