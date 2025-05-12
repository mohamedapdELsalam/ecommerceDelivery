import 'package:deliveryapp/controller/orders/accetpted_controller.dart';
import 'package:deliveryapp/controller/orders/pending_controller.dart';
import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/data/data_source/remote/orders/orders_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrdersControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  double? orderRating;
  TextEditingController commentCtrl = TextEditingController();
  OrdersData ordersData = OrdersData();
  late PendingOrdersController pendingCtrl;
  late AcceptedOrdersController acceptedCtrl;

  String printOrderStatus(int val);
  refreshOrders();
}

class OrdersController extends OrdersControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    pendingCtrl = Get.put(PendingOrdersController());
    acceptedCtrl = Get.put(AcceptedOrdersController());
  }

  @override
  refreshOrders() async {}

  @override
  String printOrderStatus(val) {
    if (val == 0) {
      return "pending await";
    } else if (val == 1) {
      return "approved";
    } else if (val == 2) {
      return "prepared";
    } else if (val == 3) {
      return "on the way";
    }
    return "archived";
  }

  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
