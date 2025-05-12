import 'dart:async';
import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

abstract class TrackingPositionControllerAbs extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  late StreamSubscription<Position> positionStream;
  OrderModel orderModel = OrderModel();
  List<Marker> markers = [];
  MapController mapController = MapController();
}

class TrackingPositionController extends TrackingPositionControllerAbs {
  LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
  );
  @override
  void onInit() async {
    super.onInit();
    orderModel = Get.arguments["orderModel"];
    markers.add(
      Marker(
        point: LatLng(orderModel.latitude!, orderModel.longitude!),
        child: Icon(Icons.location_pin),
      ),
    );
    markers.add(Marker(point: LatLng(0, 0), child: Icon(Icons.location_pin)));
    positionStream = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen((Position? position) {
      markers[1] = Marker(
        point: LatLng(position!.latitude, position.longitude),
        child: Icon(Icons.delivery_dining),
      );

      // mapController.move(LatLng(position.latitude, position.longitude), 4);
      print(
        '${position.latitude.toString()}, ${position.longitude.toString()}',
      );
      update();
    });
  }
}
