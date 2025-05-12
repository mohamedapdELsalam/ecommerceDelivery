
import 'package:deliveryapp/controller/auth/verify_signup_controller.dart';
import 'package:deliveryapp/data/data_source/static/static.dart';
import 'package:deliveryapp/testPackages.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_title&subtitle.dart';
import 'package:deliveryapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    VerifySignUpController controller = Get.put(VerifySignUpController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verification Code",
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: double.infinity),
              LogoApp(bottomMargin: 0, hight: 100, width: 100),
              TitleAndSubtitleAuth(
                title: verifyTitle,
                subtitle: verifySubtitle,
                veriable: "moalgouker@gmail.com",
                bottomMargin: 50,
              ),
              OptVerify(),
              Spacer(),
              AuthButton(
                  onPress: () {
                    controller.verify();
                  },
                  title: "Continue"),
            ],
          )),
    );
  }
}
