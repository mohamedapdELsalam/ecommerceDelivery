import 'package:deliveryapp/core/constants/image_assets.dart';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/data/model/onboarding_model.dart';
import 'package:flutter/material.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
    title: LangKeys.onBoardingTitle1,
    body: LangKeys.onBoardingBody1,
    image: LottiesAssets.smoozyCart,
    backGroundColor: Colors.white,
  ),
  OnBoardingModel(
    title: LangKeys.onBoardingTitle2,
    body: LangKeys.onBoardingBody2,
    image: LottiesAssets.smoozyCart,
    backGroundColor: Colors.orange,
  ),
  OnBoardingModel(
    title: LangKeys.onBoardingTitle3,
    body: LangKeys.onBoardingBody3,
    image: LottiesAssets.smoozyCart,
    backGroundColor: Colors.deepPurple,
  ),
];
