import 'package:e_commerce_app/googleMapTest.dart';
import 'package:e_commerce_app/view/screen/address/add.dart';
import 'package:e_commerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/pagescall/pagename.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    //  SettingsController controller = Get.put(SettingsController());
    return ListView(
      children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          Container(height: Get.width / 3, color: AppColor.primaryColor),
          Positioned(
              top: Get.width / 3.9,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.grey[100],
                  //           backgroundImage: AssetImage(AppImageAsset.avatar),
                ),
              )),
        ]),
        const SizedBox(height: 100),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                // onTap: () {},
                trailing: Switch(onChanged: (val) {}, value: true),
                title: const Text("Disable Notificatios"),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoute.orderspending);
                },
                trailing: const Icon(Icons.card_travel),
                title: const Text("Orders"),
              ),
              ListTile(
                onTap: () {
                  Get.toNamed(AppRoute.ordersarchive);
                },
                trailing: const Icon(Icons.card_travel),
                title: const Text("Archive"),
              ),
              ListTile(
                onTap: () {
                  // Get.toNamed(AppRoute.viewAddress);
                  Get.to(const AddressAdd());
                },
                trailing: const Icon(Icons.location_on_outlined),
                title: const Text("Address"),
              ),
              ListTile(
                onTap: () {},
                trailing: const Icon(Icons.help_outline_rounded),
                title: const Text("About us"),
              ),
              ListTile(
                onTap: () async {
                  final result = await Get.to(() => const LocationPicker());
                  if (result != null) {
                    print('Selected Location:');
                    print('Latitude: ${result['latitude']}');
                    print('Longitude: ${result['longitude']}');
                    // هنا يمكنك حفظ الموقع أو استخدامه
                  }

                  // launchUrl(Uri.parse('tel:+1-555-010-999'));
                  //   launchUrl(Uri.parse('sms:201013280650'));

                  // launchUrl(Uri.parse('https:https://flutter.dev'));
                },
                trailing: const Icon(Icons.phone_callback_outlined),
                title: const Text("Contact us"),
              ),
              ListTile(
                onTap: () {
                  //     controller.logout();
                  Get.off(const Login());
                },
                title: const Text("Logout"),
                trailing: const Icon(Icons.exit_to_app),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
