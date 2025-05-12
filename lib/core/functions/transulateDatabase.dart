import 'package:deliveryapp/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnAr, columnEn, columnDe, columnSp) {
  MyServices myservices = Get.find();
  var lang = myservices.sharedPref.getString("lang");

  return lang == "ar"
      ? columnAr
      : lang == "en"
          ? columnEn
          : lang == "de"
              ? columnDe
              : columnSp;
}
