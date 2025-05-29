import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/functions/handling_status_request.dart';
import 'package:deliveryapp/data/data_source/remote/auth/forget_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckVerifycodeControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ForgetPasswordData forgetPasswordData = ForgetPasswordData();
  String? verifyCode;
  String? email;
  checkVerifyCode();
}

class CheckVerifycodeController extends CheckVerifycodeControllerAbstract {
  @override
  checkVerifyCode() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await forgetPasswordData.checkVerifyCode(email!, verifyCode!);
    print(
        "----------------- verifyCode otp is : $verifyCode ------------------");
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.offNamed(AppRoutes.resetPassword, arguments: {"email": email});
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
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
