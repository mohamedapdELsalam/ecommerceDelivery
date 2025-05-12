import 'package:deliveryapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geolocator/geolocator.dart';
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

  Future<void> checkLocationPerm() async {
    bool isLocationEnabled;
    LocationPermission permission;
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      print("error : gps not enabled");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("warning :you must enable location access");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("warning :you must enable location access from settings");
    }
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
