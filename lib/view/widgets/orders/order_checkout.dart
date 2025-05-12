import 'package:deliveryapp/controller/orders/order_details_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCheckout extends GetView<OrderDetailsController> {
  const OrderCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Table(
              border: TableBorder.all(
                color: const Color.fromARGB(56, 42, 41, 41),
                borderRadius: BorderRadius.circular(10),
              ),
              children: [
                TableRow(
                  children: [
                    Text(
                      "item",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      "quantity",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      "price",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      "total price",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                ...List.generate(
                  controller.orderDetails.length,
                  (index) => TableRow(
                    children: [
                      Text(
                        "${controller.orderDetails[index].itemsNameEn}",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${controller.orderDetails[index].count}",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${controller.orderDetails[index].finalPrice}",
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "${controller.orderDetails[index].totalPrice}",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text("----------------------------"),
            SizedBox(height: 5),
            Text(
              "total Price : ${controller.orderModel.ordersTotalPrice} \$",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
