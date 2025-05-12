import 'package:deliveryapp/controller/orders/tracking_controller.dart';
import 'package:deliveryapp/core/class/handlind_status_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrderTracking extends StatelessWidget {
  const OrderTracking({super.key});

  @override
  Widget build(BuildContext context) {
    TrackingPositionController controller = Get.put(
      TrackingPositionController(),
    );
    return GetBuilder<TrackingPositionController>(
      builder:
          (controller) => HandlingStatusRequest(
            statusRequest: controller.statusRequest,
            widget: SizedBox(
              child: FlutterMap(
                mapController: controller.mapController,
                options: MapOptions(
                  initialCenter: LatLng(
                    controller.orderModel.latitude!,
                    controller.orderModel.longitude!,
                  ),
                  initialZoom: 13,
                  minZoom: 6,
                  maxZoom: 25,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=pk.eyJ1IjoibW9oYW1lZDc3NyIsImEiOiJjbTd3ZDl2cjAwNHZjMmtzODJycm9vNmVqIn0._3Hfl3BWuGG4cg07sUKbZQ",
                    additionalOptions: {
                      'access_token':
                          'pk.eyJ1IjoibW9oYW1lZDc3NyIsImEiOiJjbTd3ZDl2cjAwNHZjMmtzODJycm9vNmVqIn0._3Hfl3BWuGG4cg07sUKbZQ',
                      'id': 'mapbox/streets-v11',
                    },
                  ),
                  MarkerLayer(markers: controller.markers),
                ],
              ),
            ),
            controller: controller,
          ),
    );
  }
}
