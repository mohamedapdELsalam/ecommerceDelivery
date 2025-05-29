
import 'package:deliveryapp/core/functions/fcm_config.dart';
import 'package:deliveryapp/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Rx<Locale?> language = Rxn<Locale>();
  MyServices myServices = Get.find();

  void changeLocal(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPref.setString("lang", langCode);
    language.value = locale;
    Get.updateLocale(locale);
    update();
  }

  @override
  void onInit() async {
    notificationPermision();
    fcmConfig();
    String? sharedPrefLangCode = myServices.sharedPref.getString("lang");
    if (sharedPrefLangCode == "ar") language.value = Locale("ar");
    if (sharedPrefLangCode == "en") language.value = Locale("en");
    if (sharedPrefLangCode == "de") language.value = Locale("de");
    if (sharedPrefLangCode == "es") language.value = Locale("es");

    if (sharedPrefLangCode == null) language.value = Get.deviceLocale;

    super.onInit();
  }
}
