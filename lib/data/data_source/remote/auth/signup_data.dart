import 'package:deliveryapp/core/class/crud.dart';
import 'package:deliveryapp/core/constants/api_links.dart';
import 'package:get/get.dart';

class SignupData {
  Crud crud = Get.find();

  SignupData();

  signupRequest({
    String? userName,
    String? email,
    String? phone,
    String? password,
  }) async {
    var response = await crud.postRequest(ApiLinks.signLinkApi, {
      "userName": userName,
      "email": email,
      "phone": phone,
      "password": password,
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  checkVerifyCode(String email, String verifyCode) async {
    var response = await crud.postRequest(ApiLinks.signupVerifyCode, {
      "email": email,
      "otp": verifyCode,
    });
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
