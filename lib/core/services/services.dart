import 'package:deliveryapp/core/functions/check_location_permision.dart';
import 'package:deliveryapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPref;
  Future<MyServices> sharedPrefInit() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    sharedPref = await SharedPreferences.getInstance();
    return this;
  }

  @override
  void onInit() {
    super.onInit();
    checkLocationPerm();
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().sharedPrefInit());
}
