import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/functions/handling_status_request.dart';
import 'package:deliveryapp/data/data_source/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpControllerApstract extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController passConfirmCtrl = TextEditingController();
  late StatusRequest statusRequest;

  signUp();
  goToLogin();
  // clearTextEditingControllers();
}

class SignUpController extends SignUpControllerApstract {
  bool isDisapearPassword = true;
  switchShowPassword() {
    isDisapearPassword = !isDisapearPassword;
    update();
  }

  @override
  signUp() async {
    if (formKey.currentState!.validate()) {
      try {
        statusRequest = StatusRequest.loading;
        update();
        await Future.delayed(Duration(seconds: 4));

        var response = await SignupData().signupRequest(
          email: emailCtrl.text,
          password: passwordCtrl.text,
          phone: phoneController.text,
          userName: userNameCtrl.text,
        );

        statusRequest = handlingStatusRequest(response);
        update();

        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            print("Dialog should be shown now in success");

            Get.defaultDialog(
              title: "your account created successfully",
              middleText: "go to verify your email",
              textConfirm: "ok",
              onConfirm: () {
                Get.offNamed(AppRoutes.verifyEmail);
              },
            );
            print("success");
          } else {
            print("Dialog should be shown now in failure");

            Get.defaultDialog(
              title: "error",
              middleText: "${response["message"]}",
              textConfirm: "ok",
              onConfirm: () {
                Get.back();
              },
            );
            statusRequest = StatusRequest.failure;
            update();
          }
        } else {
          print("the problem is here ya mohamed");
          update();
        }
      } catch (e) {
        print("Dialog should be shown now  in catch");

        Get.defaultDialog(
          title: "error:$e",
          middleText: "check your internet",
          textConfirm: "ok",
          onConfirm: () {
            Get.back();
          },
        );
      }
      update();
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
    // isDisapearPassword = true;
  }

  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  void onInit() {
    statusRequest = StatusRequest.none;

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
