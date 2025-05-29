
import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/functions/handling_status_request.dart';
import 'package:deliveryapp/data/data_source/remote/auth/forget_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ChangePasswordControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController confirmPasswordCtrl = TextEditingController();
  ForgetPasswordData forgetPasswordData = ForgetPasswordData();
  bool isDisapearPassword = true;
  String? email;
  
  changePassword();
  switchShowPassword();
}

class ChangePasswordController extends ChangePasswordControllerAbstract {
  @override
  changePassword() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await forgetPasswordData.changePassword(email!, passwordCtrl.text);
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoutes.successResetPassword);
      } else {
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      statusRequest = StatusRequest.serverFailure;
      update();
    }
  }

  @override
  switchShowPassword() {
    isDisapearPassword = !isDisapearPassword;
    print(" is show password :  $isDisapearPassword");
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
