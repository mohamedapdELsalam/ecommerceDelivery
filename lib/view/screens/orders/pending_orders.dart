import 'package:deliveryapp/controller/orders/pending_controller.dart';
import 'package:deliveryapp/core/class/handlind_status_request.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 243, 238, 238),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 5),
            GetBuilder<PendingOrdersController>(
              builder:
                  (controller) => HandlingStatusRequest(
                    controller: controller,
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.pendingOrders.length,
                      itemBuilder: (context, i) {
                        var orderModel = controller.pendingOrders[i];
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "order number : ${orderModel.ordersId}",
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                    ),
                                    Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        Jiffy.parse(
                                          orderModel.ordersDateTime!,
                                        ).fromNow(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "payment method : ${orderModel.ordersPaymentMethod == 0 ? "cash" : "credit card"}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  "delivery type : ${orderModel.ordersDeliveryType == 0 ? "delivery" : "recieve"}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  "delivery price : ${orderModel.ordersDeliveryPrice} \$",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Text(
                                  "status : ${controller.printOrderStatus(orderModel.ordersStatus!)}",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(height: 10),
                                Divider(),
                                Row(
                                  children: [
                                    Text(
                                      "total price : ${orderModel.ordersTotalPrice}",
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.primary,
                                      ),
                                    ),
                                    Spacer(flex: 3),
                                    MaterialButton(
                                      color: Colors.yellow[300],
                                      onPressed: () {
                                        Get.toNamed(
                                          AppRoutes.ordersDetails,
                                          arguments: {"orderModel": orderModel},
                                        );
                                      },
                                      child: Text("details"),
                                    ),
                                    Spacer(flex: 1),
                                    MaterialButton(
                                      padding: EdgeInsets.all(2),
                                      color: Colors.green[700],
                                      onPressed: () {
                                        controller.takeOrder(
                                          orderModel.ordersId,
                                          1,
                                          orderModel.ordersUserid!,
                                        );
                                      },
                                      child: Text("take order"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
