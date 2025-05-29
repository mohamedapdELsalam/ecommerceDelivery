
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/data/model/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

List<ProfileModel> profileList = [
  ProfileModel(
    title: LangKeys.orders,
    subtitle: LangKeys.ordersSub,
    onTap: () {
      Get.toNamed(AppRoutes.orders);
    },
    trailing: Icon(
      Icons.shop,
    ),
  ),
  ProfileModel(
    title: LangKeys.information,
    subtitle: LangKeys.informationSub,
    onTap: () {},
    trailing: Icon(Icons.info_rounded),
  ),
  ProfileModel(
    title: LangKeys.address,
    subtitle: LangKeys.addressesSub,
    onTap: () {
      Get.toNamed(AppRoutes.addressView);
    },
    trailing: Icon(Icons.location_pin),
  ),
];
