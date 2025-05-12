
import 'package:deliveryapp/controller/auth/signup_controller.dart';
import 'package:deliveryapp/core/class/handlind_status_request.dart';
import 'package:deliveryapp/core/functions/alert_exit.dart';
import 'package:deliveryapp/data/data_source/static/static.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_socialIconsBar.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_title&subtitle.dart';
import 'package:deliveryapp/view/widgets/Auth/signup_bottomText.dart';
import 'package:deliveryapp/view/widgets/Auth/signup_fields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("37".tr, style: Theme.of(context).textTheme.bodyMedium),
        ),
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            alertExit(
                context, "warn ", " do you want to exit ?", "exit", "cancel");
          },
          child: GetBuilder<SignUpController>(
              builder: (controller) => HandlingStatusRequest(
                controller: controller,
                  statusRequest: controller.statusRequest,
                  widget: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                      child: ListView(
                        children: [
                          const SizedBox(width: double.infinity),
                          TitleAndSubtitleAuth(
                              title: signUpTitle,
                              subtitle: signUpSubtitle,
                              bottomMargin: 25),
                          SignUpFields(),
                          AuthButton(
                              onPress: () {
                                controller.signUp();
                              },
                              title: "37".tr),
                          const AuthSocialIconsBar(),
                          signupBottomText(
                            firsText: "39".tr,
                            SecondText: "22".tr,
                          ),
                        ],
                      )))),
        ));
  }
}
