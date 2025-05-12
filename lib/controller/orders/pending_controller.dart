import 'package:deliveryapp/controller/orders/accetpted_controller.dart';
import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/functions/handling_status_request.dart';
import 'package:deliveryapp/data/data_source/remote/orders/orders_data.dart';
import 'package:deliveryapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PendingOrdersControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  double? orderRating;
  TextEditingController commentCtrl = TextEditingController();
  OrdersData ordersData = OrdersData();
  List<OrderModel> pendingOrders = [];
  RxInt pendingCounter = 0.obs;
  Future<void> getPendingOrders();
  String printOrderStatus(int val);
  refreshOrders();
  takeOrder(int? orderId, int adminId, int userId);
}

class PendingOrdersController extends PendingOrdersControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    await getPendingOrders();
  }

  @override
  refreshOrders() async {
    await getPendingOrders();
  }

  @override
  getPendingOrders() async {
    pendingOrders.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.getPendingOrders();
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        List data = response["data"];
        pendingOrders.addAll(data.map((e) => OrderModel.fromJson(e)));
        pendingCounter.value = pendingOrders.length;
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
  takeOrder(orderId, adminId, userId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.approveOrder(
      orderId: orderId,
      adminId: adminId,
      userId: userId,
    );
    statusRequest = handlingStatusRequest(response);
    if (statusRequest == StatusRequest.success) {
      if (response["status"] == "success") {
        Get.snackbar("Lets'go", "you have taken this order ");
        getPendingOrders();
        pendingCounter.value--;
        AcceptedOrdersController acceptedCtrl = Get.find();
        // Get.put(TrackingPositionController());
        acceptedCtrl.getAcceptedOrders();
      } else {
        Get.snackbar("error", "there is a problem");
      }
    } else {
      Get.snackbar("exiption error", "oooh!");
    }
    update();
  }
}
