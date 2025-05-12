import 'package:deliveryapp/core/services/services.dart';
import 'package:deliveryapp/data/model/couriers_model.dart';
import 'package:get/get.dart';

saveUserDataInStorage(CouriersModel data) {
  MyServices services = Get.find();
  services.sharedPref.setString("courier_name", data.couriersName!);
  services.sharedPref.setInt("courier_id", data.couriersId!);
  services.sharedPref.setString("courier_phone", data.couriersPhone!);
  services.sharedPref.setString("courier_password", data.couriersPassword!);
  services.sharedPref.setInt("step", 2);
}
