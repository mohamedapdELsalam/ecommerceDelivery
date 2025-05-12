import 'package:deliveryapp/controller/orders/orders_controller.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print("------ ${message.data["pageName"]}");
    print("------ ${Get.currentRoute}");
    print("------ ${AppRoutes.homeScreen}");
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    if (Get.currentRoute == AppRoutes.homeScreen &&
        message.data["pageName"] == "refreshOrders") {
      print(" --------------------------- i will refresh");
      OrdersController controller = Get.find();
      controller.refreshOrders();
    }
  });
}

notificationPermision() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
}
