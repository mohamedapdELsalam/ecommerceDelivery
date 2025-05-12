import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/constants/image_assets.dart';
import 'package:deliveryapp/core/services/services.dart';
import 'package:deliveryapp/data/model/naviagtion_button_model.dart';
import 'package:deliveryapp/data/model/onboarding_model.dart';
import 'package:deliveryapp/data/model/profile_model.dart';
import 'package:deliveryapp/data/model/settings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

MyServices myServices = Get.find();

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: "8".tr,
    body: "9".tr,
    image: LottiesAssets.smoozyCart,
    backGroundColor: Colors.white,
  ),
  OnBoardingModel(
    title: "10".tr,
    body: "11".tr,
    image: LottiesAssets.smoozyCart,
    backGroundColor: Colors.orange,
  ),
  OnBoardingModel(
    title: "12".tr,
    body: "13".tr,
    image: LottiesAssets.smoozyCart,
    backGroundColor: Colors.deepPurple,
  ),
];
List<SpecialForYouModel> specialForYouList = [
  SpecialForYouModel(
    title: "8".tr,
    body: "9".tr,
    image: ImageAssets.specialOffer4,
  ),
  SpecialForYouModel(
    title: "10".tr,
    body: "11".tr,
    image: ImageAssets.BlackFriday,
  ),
  SpecialForYouModel(
    title: "12".tr,
    body: "13".tr,
    image: ImageAssets.specialOffer3,
  ),
];
List<NavigationButtonModel> navigationButtonsList = [
  NavigationButtonModel("home".tr, Icons.home, () {}),
  // NavigationButtonModel("offers".tr, Icons.shopify_sharp, () async {}),
  // NavigationButtonModel("cart".tr, Icons.shopping_bag, () async {}),
  // NavigationButtonModel("profile".tr, Icons.person, () {}),
  // NavigationButtonModel("settings".tr, Icons.settings, () {}),
  NavigationButtonModel("archive".tr, Icons.archive, () {}),
  NavigationButtonModel("settings".tr, Icons.settings, () {}),
];

List<SettingOptionModel> settingOptionsList = [
  SettingOptionModel(
    title: "language",
    subtitle: "english",
    onTap: () {},
    trailing: Icon(Icons.language),
  ),
  SettingOptionModel(
    title: "notification",
    subtitle: "stopped",
    onTap: () {},
    trailing: Switch(value: false, onChanged: (val) {}),
  ),
  SettingOptionModel(
    title: "addresses",
    subtitle: "add you address",
    onTap: () {
      Get.toNamed(AppRoutes.addressView);
    },
    trailing: Icon(Icons.location_pin),
  ),
  SettingOptionModel(
    title: "theme",
    subtitle: "dark",
    onTap: () {},
    trailing: Switch(value: true, onChanged: (val) {}),
  ),
  SettingOptionModel(
    title: "about us",
    subtitle: "about us",
    onTap: () {},
    trailing: Icon(Icons.info),
  ),
  SettingOptionModel(
    title: "contact us",
    subtitle: "whatsapp - call",
    onTap: () {
      Get.toNamed(AppRoutes.contact);
    },
    trailing: Icon(Icons.phone),
  ),
  SettingOptionModel(
    title: "log out",
    subtitle: "goodby",
    onTap: () {
      Get.defaultDialog(
        title: "warn",
        content: Text("do you agreed to logging out ?"),
        onConfirm: () {
          myServices.sharedPref.clear();
          Get.offAllNamed(AppRoutes.login);
        },
        onCancel: () {},
      );
    },
    trailing: Icon(Icons.exit_to_app, color: Colors.red[900]),
  ),
];

List<ProfileModel> profileList = [
  ProfileModel(
    title: "orders",
    subtitle: "pending and archive",
    onTap: () {
      Get.toNamed(AppRoutes.orders);
    },
    trailing: Icon(Icons.shop),
  ),
  ProfileModel(
    title: "information",
    subtitle: "stopped",
    onTap: () {},
    trailing: Icon(Icons.info_rounded),
  ),
  ProfileModel(
    title: "addresses",
    subtitle: "add you address",
    onTap: () {
      Get.toNamed(AppRoutes.addressView);
    },
    trailing: Icon(Icons.location_pin),
  ),
];

String onboardingButtonText = "13".tr;
String onboardingLastButtonText = "14".tr;
String loginTitle = "1".tr;
String loginSubtitle = "15".tr;
String signUpTitle = "1".tr;
String signUpSubtitle = "40".tr;
String verifyTitle = "16".tr;
String verifySubtitle = "17".tr;
String successResetPasswordTitle = "18".tr;
String successResetPasswordSubtitle = "19".tr;
String successSignUpTitle = "25".tr;
String successSignUpSubtitle = "26".tr;
String appName = "45".tr;
