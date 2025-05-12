import 'package:deliveryapp/controller/orders/archived_controller.dart';
import 'package:deliveryapp/core/class/handlind_status_request.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveOrdersController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Archive"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CircleAvatar(
              radius: 15,
              child: GetBuilder<ArchiveOrdersController>(
                builder:
                    (controller) => Text("${controller.archiveOrders.length}"),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GetBuilder<ArchiveOrdersController>(
          builder:
              (controller) => HandlingStatusRequest(
                controller: controller,
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.archiveOrders.length,
                  itemBuilder: (context, i) {
                    var orderModel = controller.archiveOrders[i];
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
                                      Theme.of(context).textTheme.titleMedium,
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
                                        Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Spacer(flex: 5),
                                MaterialButton(
                                  color: Colors.yellow,
                                  onPressed: () {
                                    Get.toNamed(
                                      AppRoutes.ordersDetails,
                                      arguments: {"orderModel": orderModel},
                                    );
                                  },
                                  child: Text("details"),
                                ),
                                Spacer(flex: 1),
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
      ),
    );
  }
}
