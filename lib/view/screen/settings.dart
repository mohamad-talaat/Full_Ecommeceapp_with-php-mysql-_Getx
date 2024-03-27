import 'package:e_commerce_app/view/screen/address/add.dart';
import 'package:e_commerce_app/view/screen/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';
import '../../core/pagescall/pagename.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  SettingsController controller = Get.put(SettingsController());
    return Container(
      child: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(height: Get.width / 3, color: AppColor.primaryColor),
                Positioned(
                    top: Get.width / 3.9,
                    child: Container(
                      padding: EdgeInsets.all(4),
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
          SizedBox(height: 100),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Card(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                ListTile(
                  // onTap: () {},
                  trailing: Switch(onChanged: (val) {}, value: true),
                  title: Text("Disable Notificatios"),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.orderspending);
                  },
                  trailing: Icon(Icons.card_travel),
                  title: Text("Orders"),
                ),
                ListTile(
                  onTap: () {
                    Get.toNamed(AppRoute.ordersarchive);
                  },
                  trailing: Icon(Icons.card_travel),
                  title: Text("Archive"),
                ),
                ListTile(
                  onTap: () {
                    // Get.toNamed(AppRoute.viewAddress);
                    Get.to(AddressAdd());
                  },
                  trailing: Icon(Icons.location_on_outlined),
                  title: Text("Address"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.help_outline_rounded),
                  title: Text("About us"),
                ),
                ListTile(
                  onTap: () {},
                  trailing: Icon(Icons.phone_callback_outlined),
                  title: Text("Contact us"),
                ),
                ListTile(
                  onTap: () {
                    //     controller.logout();
                    Get.off(Login());
                  },
                  title: Text("Logout"),
                  trailing: Icon(Icons.exit_to_app),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
