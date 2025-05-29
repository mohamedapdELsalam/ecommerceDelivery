
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

showCustomDialog({
  String? title,
  required String? content,
  required void Function() onConfirm,
  void Function()? onCancel,
}) {
  BuildContext? context = Get.context;
  Get.defaultDialog(
    backgroundColor: context!.onPrimaryColor,
    title: title ?? LangKeys.error.tr,
    content: Text(content!),
    titleStyle: context.textTheme.titleSmall,
    confirm: ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text(
          LangKeys.ok.tr,
          style: context.textTheme.bodyMedium,
        )),
  );
}
