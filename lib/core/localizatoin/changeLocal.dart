import 'package:deliveryapp/core/functions/fcm_config.dart';
import 'package:deliveryapp/core/services/services.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  void changeLocal(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPref.setString("lang", langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() async {
    notificationPermision();
    fcmConfig();
    String? sharedPrefLangCode = myServices.sharedPref.getString("lang");
    if (sharedPrefLangCode == "ar") language = Locale("ar");
    if (sharedPrefLangCode == "en") language = Locale("en");
    if (sharedPrefLangCode == "de") {
      language = Locale("de");
    }
    if (sharedPrefLangCode == null) language = Get.deviceLocale;

    super.onInit();
  }
}
