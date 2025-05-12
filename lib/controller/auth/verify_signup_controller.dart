import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class VerifySignUpControllerAbstract extends GetxController {
  verify();
  reSendCode();
  goToPage(String route);
}

class VerifySignUpController extends VerifySignUpControllerAbstract {
  @override
  verify() {
    Get.toNamed(AppRoutes.successSignUp);
  }

  @override
  goToPage(String route) {
    Get.offNamed(route);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  reSendCode() {
    // TODO: implement reSendCode
    throw UnimplementedError();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
