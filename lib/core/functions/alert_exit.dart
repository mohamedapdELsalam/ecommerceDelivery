import 'dart:io';
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExit(BuildContext context) {
  Get.defaultDialog(
    backgroundColor: Theme.of(context).shadowColor,
    middleText: LangKeys.exitMsg.tr,
    middleTextStyle: Theme.of(context).textTheme.bodySmall,
    titleStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
    title: LangKeys.warn.tr,
    actions: [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            Theme.of(context).dialogBackgroundColor,
          ),
        ),
        onPressed: () => exit(0),
        child: Text(
          LangKeys.exit.tr,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      ElevatedButton(
        onPressed: () => Get.back(),
        child: Text(
          LangKeys.cancel.tr,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ),
    ],
  );
}
