import 'package:deliveryapp/core/class/crud.dart';
import 'package:deliveryapp/core/constants/api_links.dart';


class ForgetPasswordData {
  Crud crud = Crud();

  checkEmail(String email) async {
    var response =
        await crud.postRequest(ApiLinks.checkEmail, {"email": email});
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  checkVerifyCode(String email, String verifyCode) async {
    var response = await crud.postRequest(
        ApiLinks.checkVerifyCode, {"email": email, "otp": verifyCode});
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  changePassword(String email, String password) async {
    var response = await crud.postRequest(
        ApiLinks.changePassword, {"email": email, "password": password});
    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
