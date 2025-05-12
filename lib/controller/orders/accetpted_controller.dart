import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/functions/handling_status_request.dart';
import 'package:deliveryapp/data/data_source/remote/orders/orders_data.dart';
import 'package:deliveryapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AcceptedOrdersControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  double? orderRating;
  TextEditingController commentCtrl = TextEditingController();
  OrdersData ordersData = OrdersData();

  List<OrderModel> acceptedOrders = [];
  RxInt acceptedCounter = 0.obs;

  Future<void> getAcceptedOrders();
  String printOrderStatus(int val);
  refreshOrders();
  doneOrder(int? orderId, int adminId, int userId);
}

class AcceptedOrdersController extends AcceptedOrdersControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    await getAcceptedOrders();
  }

  @override
  refreshOrders() async {
    await getAcceptedOrders();
  }

  @override
  getAcceptedOrders() async {
    acceptedOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getAcceptedOrders();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        acceptedOrders.addAll(data.map((e) => OrderModel.fromJson(e)));
        acceptedCounter.value = acceptedOrders.length;
      } else {
        statusRequest = StatusRequest.failure;
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

  @override
  doneOrder(orderId, adminId, userId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.doneOrder(
      orderId: orderId,
      adminId: adminId,
      userId: userId,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.snackbar("Done", "Well Done");
        getAcceptedOrders();
        acceptedCounter.value--;
      } else {
        Get.snackbar("error", "there is a problem");
      }
    } else {
      Get.snackbar("exiption error", "oooh!");
    }
    update();
  }
}
