import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/functions/handling_status_request.dart';
import 'package:deliveryapp/data/data_source/remote/auth/forget_password_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailSignupControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailCtrl = TextEditingController();
  ForgetPasswordData forgetPasswordData = ForgetPasswordData();
  String? email;
  checkEmail();
}

class CheckEmailSignupController extends CheckEmailSignupControllerAbstract {
  @override
  checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await forgetPasswordData.checkEmail(emailCtrl.text);
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          Get.toNamed(
            AppRoutes.verifyCodeSignup,
            arguments: {"email": emailCtrl.text},
          );
        } else {
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        statusRequest = StatusRequest.serverFailure;
        update();
      }
    }
  }

  @override
  void onInit() {
    if (Get.arguments != null) {
      email = Get.arguments["email"];
      emailCtrl.text = email!;
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
