import 'package:get/get.dart';

validate(String val, int min, int max, String type, controller) {
  if (type == "confirmPassword") {
    if (controller.passwordCtrl.text != controller.passConfirmCtrl.text) {
      return "password doesn't match";
    }
  }
  if (val.isEmpty) {
    return "can't be empty";
  }
  if (type == "userName" && !GetUtils.isUsername(val)) {
    return "this username not valid";
  }

  if (type == "email" && !GetUtils.isEmail(val)) {
    return "this email not valid";
  }

  if (type == "phone" && !GetUtils.isPhoneNumber(val)) {
    return "this phone not valid";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }
  if (val.length > max) {
    return "can't be larger than $max";
  }
}
