import 'package:deliveryapp/controller/orders/order_details_controller.dart';
import 'package:deliveryapp/core/class/handlind_status_request.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/view/widgets/Auth/auth_button.dart';
import 'package:deliveryapp/view/widgets/orders/order_checkout.dart';
import 'package:deliveryapp/view/widgets/orders/order_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text("order details")),
      body: Container(
        child: GetBuilder<OrderDetailsController>(
          builder:
              (controller) => HandlingStatusRequest(
                controller: controller,
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding: EdgeInsets.all(5),
                  child: ListView(
                    children: [
                      OrderCheckout(),
                      if (controller.orderModel.ordersDeliveryType == 0)
                        OrderMap(),
                      SizedBox(height: 20),
                      AuthButton(
                        onPress: () {
                          Get.toNamed(
                            AppRoutes.orderTracking,
                            arguments: {"orderModel": controller.orderModel},
                          );
                        },
                        title: "tracking",
                      ),
                    ],
                  ),
                ),
              ),
        ),
      ),
    );
  }
}
