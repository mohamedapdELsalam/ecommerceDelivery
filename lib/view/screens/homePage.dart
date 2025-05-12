import 'package:deliveryapp/controller/orders/orders_controller.dart';
import 'package:deliveryapp/view/screens/orders/orders_accepted.dart';
import 'package:deliveryapp/view/screens/orders/pending_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    OrdersController controller = Get.put(OrdersController());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(title: Text("orders")),
        body: Container(
          decoration: BoxDecoration(
            color: ColorScheme.of(context).surface,
            borderRadius: BorderRadius.vertical(top: Radius.circular(35)),
          ),
          child: Column(
            children: [
              TabBar(
                labelPadding: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.only(top: 20),
                dividerColor: Colors.cyan[700],
                tabs: [
                  OrderTap(
                    title: "pending",
                    counter: controller.pendingCtrl.pendingCounter,
                  ),
                  OrderTap(
                    title: "accepted",
                    counter: controller.acceptedCtrl.acceptedCounter,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [OrdersScreen(), AcceptedOrders()]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderTap extends StatelessWidget {
  final String title;
  final RxInt counter;

  const OrderTap({super.key, required this.title, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title),
        SizedBox(width: 5),
        Obx(
          () => CircleAvatar(
            radius: 12,
            child: FittedBox(child: Text("${counter.value}")),
          ),
        ),
      ],
    );
  }
}
