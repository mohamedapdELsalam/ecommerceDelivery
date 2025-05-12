
import 'package:deliveryapp/controller/auth/login_controller.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordControllerAbstract extends GetxController {
  TextEditingController emailCtrl = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  checkEmail();
  returnToLogin();
}

class ForgetPasswordController extends ForgetPasswordControllerAbstract {
  LoginController loginController = Get.put(LoginController());
  bool isRememberMeChecked = false;

  @override
  checkEmail() {
    Get.offNamed(AppRoutes.verifyCode);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  returnToLogin() {
    Get.offNamed(AppRoutes.login);
  }
}
