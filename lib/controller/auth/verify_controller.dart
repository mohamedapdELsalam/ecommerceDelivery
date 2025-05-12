import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class VerifyCodeAbstract extends GetxController {
  verify();
  reSendCode();
  goToPage(String route);
}

class VerifyCodeController extends VerifyCodeAbstract {
  @override
  verify() {
    Get.offNamed(AppRoutes.resetPassword);
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
