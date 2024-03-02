import 'package:e_commerce_app/core/Initialbinding.dart';
import 'package:e_commerce_app/core/localization/translation.dart';
import 'package:e_commerce_app/core/services/services.dart';
import 'package:e_commerce_app/view/screen/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/localization/changelocal.dart';
import 'core/pagescall/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      //  home: Cart(),
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBinding(),
      getPages: routes,
    );
  }
}
