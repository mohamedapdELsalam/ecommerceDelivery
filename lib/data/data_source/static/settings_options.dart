import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/services/services.dart';
import 'package:deliveryapp/core/shared/alert_logout_dialog.dart';
import 'package:deliveryapp/data/model/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();

List<SettingOptionModel> settingOptionsList = [
  SettingOptionModel(
    title: LangKeys.language,
    subtitle: LangKeys.languageSub,
    onTap: () {
      Get.toNamed(AppRoutes.languageSettings);
    },
    trailing: Icon(Icons.language),
  ),
  SettingOptionModel(
    title: LangKeys.notification,
    subtitle: LangKeys.notificationSub,
    onTap: () {},
    trailing: Switch(value: false, onChanged: (val) {}),
  ),
  SettingOptionModel(
    title: LangKeys.address,
    subtitle: LangKeys.addressesSub,
    onTap: () {
      Get.toNamed(AppRoutes.addressView);
    },
    trailing: Icon(Icons.location_pin),
  ),
  SettingOptionModel(
    title: LangKeys.theme,
    subtitle: LangKeys.themeSub,
    onTap: () {},
    trailing: Switch(value: true, onChanged: (val) {}),
  ),
  SettingOptionModel(
    title: LangKeys.aboutUs,
    subtitle: LangKeys.aboutUsSub,
    onTap: () {},
    trailing: Icon(Icons.info),
  ),
  SettingOptionModel(
    title: LangKeys.contactUs,
    subtitle: LangKeys.contactUsSub,
    onTap: () {
      Get.toNamed(AppRoutes.contact);
    },
    trailing: Icon(Icons.phone),
  ),
  SettingOptionModel(
    title: LangKeys.logOut,
    subtitle: LangKeys.logOutSub,
    onTap: () {
      showAlertLogout(
        onConfirm: () {
          myServices.sharedPref.clear();
          myServices.sharedPref.setString("lang", Get.locale.toString());
          Get.offAllNamed(AppRoutes.login);
        },
        onCancel: () {
          Get.back();
        },
      );
    },
    trailing: Icon(Icons.exit_to_app, color: Colors.red[900]),
  ),
];
