import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:get/get.dart';

abstract class CheckEmailControllerAbstract extends GetxController {
  checkEmail();
}

class CheckEmailController extends CheckEmailControllerAbstract {
  bool isRememberMeChecked = false;

  @override
  checkEmail() {
    Get.offNamed(AppRoutes.verifyEmail);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
