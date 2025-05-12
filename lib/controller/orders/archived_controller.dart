import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/functions/handling_status_request.dart';
import 'package:deliveryapp/data/data_source/remote/orders/orders_data.dart';
import 'package:deliveryapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ArchiveOrdersControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  double? orderRating;
  TextEditingController commentCtrl = TextEditingController();
  OrdersData ordersData = OrdersData();
  List<OrderModel> archiveOrders = [];
  Future<void> getArchiveOrders();
  String printOrderStatus(int val);
  refreshOrders();
}

class ArchiveOrdersController extends ArchiveOrdersControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    await getArchiveOrders();
  }

  @override
  refreshOrders() async {}

  @override
  getArchiveOrders() async {
    archiveOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getArchiveOrders();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        archiveOrders.addAll(data.map((e) => OrderModel.fromJson(e)));
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

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
