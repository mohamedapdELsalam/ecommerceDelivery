import 'package:deliveryapp/controller/auth/signup/signup_verifycode_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class SignupOtp extends GetView<SignupCheckVerifycodeController> {
  const SignupOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: OtpTextField(
        textStyle: TextStyle(fontSize: 14),
        fieldWidth: 40,
        borderRadius: BorderRadius.circular(12),
        focusedBorderColor: const Color.fromARGB(255, 155, 179, 192),
        enabledBorderColor: Theme.of(context).colorScheme.primary,
        fillColor: Colors.green,
        numberOfFields: 6,
        borderColor: Colors.red, //Theme.of(context).colorScheme.primary,
        //set to true to show as box or false to show as dash
        showFieldAsBox: true,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode) {
          controller.verifyCode = verificationCode;
        }, // end onSubmit
      ),
    );
  }
}
