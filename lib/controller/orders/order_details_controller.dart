import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/functions/handling_status_request.dart';
import 'package:deliveryapp/data/data_source/remote/orders/orders_details_data.dart';
import 'package:deliveryapp/data/model/order_details_model.dart';
import 'package:deliveryapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

abstract class OrderDetailsControllerAbstract extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  LatLng? selectedLocation;
  List<Marker> markers = [];

  OrderModel orderModel = OrderModel();
  List<OrderDetailsModel> orderDetails = [];
  OrderDetailsData orderDetailsData = OrderDetailsData();
  getOrdersDetails(int orderId);
}

class OrderDetailsController extends OrderDetailsControllerAbstract {
  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      orderModel = await Get.arguments["orderModel"];
      await getOrdersDetails(orderModel.ordersId!);
    }
  }

  mapHandling() {
    selectedLocation = LatLng(orderModel.latitude!, orderModel.longitude!);

    markers.add(
      Marker(
        point: selectedLocation!,
        child: Icon(Icons.location_on, color: Colors.red, size: 30),
      ),
    );
  }

  @override
  getOrdersDetails(orderId) async {
    statusRequest = StatusRequest.loading;
    mapHandling();
    update();
    try {
      var response = await orderDetailsData.getOrderDetailsRequest(orderId);
      statusRequest = handlingStatusRequest(response);
      if (statusRequest == StatusRequest.success) {
        if (response["status"] == "success") {
          List data = response["data"];
          orderDetails.addAll(data.map((e) => OrderDetailsModel.fromJson(e)));
        } else {
          statusRequest = StatusRequest.failure;
        }
      }
    } catch (e) {
      print("errrrrror : $e");
    }

    update();
  }

  void resetStatus() {
    statusRequest = StatusRequest.none;
    update();
  }
}
