
import 'package:deliveryapp/core/constants/lang_keys.dart';
import 'package:deliveryapp/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

showAlertLogout({
  String? title,
  String? content,
  required void Function() onConfirm,
  void Function()? onCancel,
}) {
  BuildContext? context = Get.context;
  Get.defaultDialog(
    backgroundColor: context!.onPrimaryColor,
    title: title ?? LangKeys.warn.tr,
    content: Text(content ?? LangKeys.logoutConfirmMsg.tr),
    titleStyle: context.textTheme.titleSmall,
    cancel: ElevatedButton(
      onPressed: onCancel,
      child: Text(
        LangKeys.cancel.tr,
        style: context.textTheme.bodyMedium,
      ),
    ),
    confirm: ElevatedButton(
        onPressed: onConfirm,
        child: Text(
          LangKeys.exit.tr,
          style: context.textTheme.bodyMedium,
        )),
  );
}
