import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordAbstract extends GetxController {
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController passConfirmCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  resetPassword();
  // clearTextEditingControllers();
}

class ResetPasswordController extends ResetPasswordAbstract {
  bool isDisapearPassword = true;
  switchShowPassword() {
    isDisapearPassword = !isDisapearPassword;
    print(" is show password :  $isDisapearPassword");
    update();
  }

  @override
  resetPassword() {
    if (formKey.currentState!.validate()) {
      Get.offNamed(AppRoutes.successResetPassword);
      isDisapearPassword = true;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
