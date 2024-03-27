import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

import '../../controller/orders/pending_controller.dart';

PirmitionNotifications() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmNotification() {
  FirebaseMessaging.onMessage.listen((message) {
    print('onMessage========================== ${message.data}');
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print('onMessageOpenedApp========================== ${message.data}');
    refreshPageNotification(message.data);
  });
}
refreshPageNotification(data) { //good instead of Stream Firebase // تعمل ريفرش للصفحة بالمعلومات المطلوبه يتعملها ابديت  
  print("============================= page id ");
  print(data['pageid']);
  print("============================= page name ");
  print(data['pagename']);
  print("================== Current Route");
  print(Get.currentRoute);

  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    OrdersPendingController controller = Get.find();
    controller.refrehOrder();
  } 
  else if (Get.currentRoute == "/orderscompleted" &&
      data['pagename'] == "refreshordercompleted") {
    OrdersPendingController controller = Get.find();
    controller.refrehOrder();
  }
}


// Firebase + stream 
// Socket io 
// Notification refresh 