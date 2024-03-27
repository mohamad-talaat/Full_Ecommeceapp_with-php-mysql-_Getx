import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

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
  FirebaseMessaging.onMessage.listen((event) {
    print('onMessage========================== ${event.data}');
    FlutterRingtonePlayer.playNotification();
    Get.snackbar(event.notification!.title!, event.notification!.body!);
  });
}
