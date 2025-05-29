import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/services/services.dart';
import 'package:deliveryapp/main.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  MyServices servicesController = Get.find();
  @override
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    if (testMode) {
      return const RouteSettings(name: AppRoutes.test);
    }
    if (servicesController.sharedPref.getInt("step") == 2) {
      return const RouteSettings(name: AppRoutes.homeScreen);
    } else if (servicesController.sharedPref.getInt("step") == 1) {
      return const RouteSettings(name: AppRoutes.login);
    }
    return null;
  }
}

class AuthMiddleWare extends GetMiddleware {
  MyServices servicesController = Get.find();
  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    if (testMode) {
      return const RouteSettings(name: AppRoutes.test);
    }
    if (servicesController.sharedPref.getString("user_name") != null) {
      if (servicesController.sharedPref.getInt("approve") == 0) {
        return const RouteSettings(name: AppRoutes.signupVerifyEmail);
      } else {
        return const RouteSettings(name: AppRoutes.homeScreen);
      }
    }
    return null;
  }
}
