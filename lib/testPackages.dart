import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OptVerify extends StatelessWidget {
  const OptVerify({super.key});

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
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
      onSubmit: (String verificationCode) {}, // end onSubmit
    );
  }
}
