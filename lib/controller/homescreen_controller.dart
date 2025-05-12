import 'package:deliveryapp/view/screens/homePage.dart';
import 'package:deliveryapp/view/screens/orders/archives_orders.dart';
import 'package:deliveryapp/view/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenControllerImp extends GetxController {
  changePage(int index) {}
  RxInt currentIndex = 0.obs;
}

class HomeScreenController extends HomeScreenControllerImp {
  List<Widget> pagesList = [
    const HomePage(),
    OrdersArchive(), SettingsScreen(),
    // const HomePage(),
    // const ProfileScreen(),
    //const SettingsScreen(),
  ];

  @override
  changePage(int index) {
    currentIndex.value = index;
    update();
  }
}
