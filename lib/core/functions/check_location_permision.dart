import 'package:geolocator/geolocator.dart';

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
