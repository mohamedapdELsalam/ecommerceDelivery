import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/functions/handling_status_request.dart';
import 'package:deliveryapp/core/functions/save_userdata_instorge.dart';
import 'package:deliveryapp/data/data_source/remote/auth/login.dart';
import 'package:deliveryapp/data/data_source/static/settings_options.dart';
import 'package:deliveryapp/data/model/couriers_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAbstract extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  StatusRequest statusRequest = StatusRequest.none;
  bool isRememberMeChecked = true;
  bool isDisapearPassword = true;
  CouriersModel courierData = CouriersModel();

  login(BuildContext context);
  toggleRememberMe();
  goToSignup();
  goToForgetPassword();
  switchShowPassword();
  resetStatus();
}

class LoginController extends LoginControllerAbstract {
  @override
  switchShowPassword() {
    isDisapearPassword = !isDisapearPassword;
    update();
  }

  @override
  toggleRememberMe() {
    isRememberMeChecked = !isRememberMeChecked;
    update();
  }

  @override
  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        statusRequest = StatusRequest.loading;
        update();
        await Future.delayed(Duration(seconds: 2));
        var response = await LoginData().LoginRequiest(
          email: emailCtrl.text,
          password: passwordCtrl.text,
        );
        statusRequest = handlingStatusRequest(response);

        if (statusRequest == StatusRequest.success) {
          if (response["status"] == "success") {
            statusRequest = StatusRequest.success;
            Map<String, dynamic> data = response["data"];
            courierData = CouriersModel.fromJson(data);
            saveUserDataInStorage(courierData);
            FirebaseMessaging.instance.subscribeToTopic("users");
            FirebaseMessaging.instance.subscribeToTopic(
              "users${response["data"]["user_id"]}",
            );
            if (courierData.couriersApprove == 0) {
              myServices.sharedPref.setInt("approve", 0);
              statusRequest = StatusRequest.none;
              update();
              Get.defaultDialog(
                barrierDismissible: false,
                title: "warn",
                middleText: "you must verify your email",
                textConfirm: "go to verify email",
                onConfirm: () {
                  Get.offNamed(
                    AppRoutes.signupVerifyEmail,
                    arguments: {"email": emailCtrl.text},
                  );
                  print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
                },
              );
            } else if (courierData.couriersApprove == 1) {
              myServices.sharedPref.setInt("approved", 1);
              Get.offAllNamed(AppRoutes.homeScreen);
              return;
            }
          } else {
            statusRequest = StatusRequest.failure;
            update();
            Get.defaultDialog(
              title: "error",
              middleText: response["message"],
              textConfirm: "ok",
              onConfirm: () {
                Get.back();
              },
            );
          }
        }
      } catch (e) {
        statusRequest = StatusRequest.exceptionFailure;
        print("e:$e");
      }

      print("validate");
    }
    statusRequest = StatusRequest.none;
    update();
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoutes.signUp);
    isDisapearPassword = true;
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetPassword);
    isDisapearPassword = true;
  }

  @override
  void onInit() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.getToken().then((value) {
      String? token = value;
      print("token is : $token");
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
