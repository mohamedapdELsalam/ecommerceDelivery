
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/data/data_source/static/static.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_title&subtitle.dart';
import 'package:deliveryapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Password Changed Successfully",
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: double.infinity),
              LogoApp(bottomMargin: 10, hight: 100, width: 100),
              TitleAndSubtitleAuth(
                title: successResetPasswordTitle,
                subtitle: successResetPasswordSubtitle,
                bottomMargin: 50,
              ),
              Spacer(),
              AuthButton(
                  onPress: () {
                    Get.offAllNamed(AppRoutes.login);
                  },
                  title: "Go To Login"),
            ],
          )),
    );
  }
}
