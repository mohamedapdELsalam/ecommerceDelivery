import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/data/model/naviagtion_button_model.dart';
import 'package:flutter/material.dart';

List<NavigationButtonModel> navigationButtonsList = [
  NavigationButtonModel("home", Icons.home, () {}),
  NavigationButtonModel(LangKeys.offers, Icons.shopify_sharp, () async {}),
  NavigationButtonModel(LangKeys.cart, Icons.shopping_bag, () async {}),
  NavigationButtonModel(LangKeys.profile, Icons.person, () {}),
  NavigationButtonModel(LangKeys.settings, Icons.settings, () {}),
];
