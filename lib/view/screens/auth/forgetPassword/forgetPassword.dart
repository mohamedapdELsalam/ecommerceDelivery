
import 'package:deliveryapp/controller/auth/forgetPassword_controller.dart';
import 'package:deliveryapp/core/functions/validate_inputs.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_textForm.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_title&subtitle.dart';
import 'package:deliveryapp/view/widgets/Auth/forgetpass_bottom_text.dart';
import 'package:deliveryapp/view/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordController controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Forget Password ",
            style: Theme.of(context).textTheme.bodyMedium),
      ),
      body: Form(
        autovalidateMode: AutovalidateMode.always,
        key: controller.formKey,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              children: [
                SizedBox(width: double.infinity),
                LogoApp(bottomMargin: 10, hight: 100, width: 100),
                TitleAndSubtitleAuth(
                  title: "check your Email",
                  subtitle: "",
                  bottomMargin: 50,
                ),
                TextFormAuth(
                    valid: (val) {
                      return validate(val!, 5, 100, "email", controller);
                    },
                    Ctrl: controller.emailCtrl,
                    hint: "Enter Your Email",
                    label: "Email",
                    obscure: false,
                    icon: Icon(Icons.email)),
                SizedBox(height: 40),
                AuthButton(
                    onPress: () {
                      controller.checkEmail();
                    },
                    title: "Check"),
                ForgetPassBottomText(
                  firsText: "return to ",
                  SecondText: "login",
                ),
              ],
            )),
      ),
    );
  }
}
