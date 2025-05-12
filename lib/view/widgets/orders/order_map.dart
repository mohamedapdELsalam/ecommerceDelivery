import 'package:deliveryapp/controller/orders/order_details_controller.dart';
import 'package:deliveryapp/core/constants/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';

class OrderMap extends GetView<OrderDetailsController> {
  const OrderMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text("${controller.orderModel.name}"),
            subtitle: Text(
              "${controller.orderModel.cityEn} /${controller.orderModel.goverEn} ",
            ),
            trailing: Icon(Icons.location_pin),
          ),
          if (controller.selectedLocation != null)
            Container(
              height: 200,
              width: double.infinity,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: controller.selectedLocation!,
                  initialZoom: 13,
                  minZoom: 6,
                  maxZoom: 25,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=${ApiKeys.mapBoxToken}",
                    additionalOptions: {
                      'access_token': ApiKeys.mapBoxToken,
                      'id': 'mapbox/streets-v11',
                    },
                  ),
                  MarkerLayer(markers: controller.markers),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
