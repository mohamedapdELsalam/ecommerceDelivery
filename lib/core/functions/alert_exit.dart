import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertExit(BuildContext context, title, middleText, confirmText, cancelText) {
  Get.defaultDialog(
      backgroundColor: Theme.of(context).shadowColor,
      middleText: middleText,
      middleTextStyle: Theme.of(context).textTheme.bodySmall,
      titleStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
      title: title,
      actions: [
        ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).dialogBackgroundColor),
            ),
            onPressed: () => exit(0),
            child: Text(
              confirmText,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Theme.of(context).colorScheme.onPrimary),
            )),
        ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(cancelText,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ))),
      ]);
}
