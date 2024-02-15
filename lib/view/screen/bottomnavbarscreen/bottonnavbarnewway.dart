// import 'package:e_commerce_app/controller/home_controller.dart';
// import 'package:e_commerce_app/controller/homescreen_controller.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../widget/bottomnavbarscreen/custommaterialbutton.dart';
//
// class newButtonNav extends GetView<homescreenControllerImp> {
//   const newButtonNav({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//
//       children: [
//         Row(
//           children: [
//             CustomMaterialButton(
//                 onpressed: () {
//                   controller.changePage(0);
//                 },
//                 iconbutton: Icons.home,
//                 //    active: controller.changePage(0) == true,
//                 active: controller.currentpage == 0 ? true : false,
//                 textButton: "Home"),
//             CustomMaterialButton(
//                 onpressed: () {
//                   controller.changePage(1);
//                 },
//                 iconbutton: Icons.settings,
//                 active: controller.currentpage == 1 ? true : false,
//                 textButton: "settings"),
//           ],
//         ),
//         Spacer(),
//         Row(
//           children: [
//             CustomMaterialButton(
//               onpressed: () {
//                 controller.changePage(2);
//               },
//               iconbutton: Icons.person,
//               textButton: "profile",
//               active: controller.currentpage == 2 ? true : false,
//             ),
//             CustomMaterialButton(
//                 onpressed: () {
//                   controller.changePage(3);
//                 },
//                 iconbutton: Icons.favorite,
//                 active: controller.currentpage == 3 ? true : false,
//                 textButton: "favorite"),
//           ],
//         )
//
//       ],
//
//     );
//   }
// }
