import 'package:e_commerce_app/core/class/crud.dart';
import 'package:e_commerce_app/data/linkApi.dart';


// to recieve the vars and link from backend

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    // print("the problem <<<<<<<<<in Link Data");
    var response = await crud.postData(AppLink.linkTest, {});
    // print("the problem here is <<<<<<<<<<<<<<<<testData");
    return response.fold((l) => l, (r) => r);
  }
}

/*   getData() async {
    // print("the problem <<<<<<<<<in Link Data");
    var response = await crud.getData(
       "https://newsapi.org/v2/top-headlines?category=sports&apiKey=c9549d6d17f24a06a3405763441e9825");
    // print("the problem here is <<<<<<<<<<<<<<<<testData");
    return response.fold((l) => l, (r) => r);
  }
} */
