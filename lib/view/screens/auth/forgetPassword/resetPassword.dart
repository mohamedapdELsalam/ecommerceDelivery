
import 'package:deliveryapp/controller/auth/resetPassword_controller.dart';
import 'package:deliveryapp/data/data_source/static/static.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_title&subtitle.dart';
import 'package:deliveryapp/view/widgets/Auth/resetPasswordFields.dart';
import 'package:deliveryapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordController controller = Get.put(ResetPasswordController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Reset Password",
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [
              SizedBox(width: double.infinity),
              LogoApp(bottomMargin: 10, hight: 100, width: 100),
              TitleAndSubtitleAuth(
                title: loginTitle,
                subtitle: loginSubtitle,
                bottomMargin: 50,
              ),
              ResetPasswordFields(),
              AuthButton(
                  onPress: () {
                    controller.resetPassword();
                  },
                  title: "Save"),
            ],
          )),
    );
  }
}
