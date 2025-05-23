import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliveryapp/controller/orders/accetpted_controller.dart';
import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/constants/app_routes.dart';
import 'package:deliveryapp/core/functions/get_polyline.dart';
import 'package:deliveryapp/core/services/services.dart';
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
  List<Polyline> polyLineList = [];
  MapController mapController = MapController();
  double? lat;
  double? lng;
  double? latDes;
  double? lngDes;
  Timer? timer;
  MyServices myServices = Get.find();
  doneOrder(int orderId, int userId);
}

class TrackingPositionController extends TrackingPositionControllerAbs {
  LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
  );

  initialData() {
    orderModel = Get.arguments["orderModel"];
    latDes = orderModel.latitude;
    lngDes = orderModel.longitude;
  }

  getCurrentLocation() {
    positionStream = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen((Position? position) async {
      lat = position!.latitude;
      lng = position.longitude;
      markers[1] = Marker(
        point: LatLng(position.latitude, position.longitude),
        child: Icon(Icons.delivery_dining),
      );
      print(
        '${position.latitude.toString()}, ${position.longitude.toString()}',
      );
      polyLineList = await getPolyline(lat, lng, latDes, lngDes);
      update();
    });
  }

  sendingLocation() async {
    await Future.delayed(Duration(seconds: 1));
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      FirebaseFirestore.instance
          .collection("delivery")
          .doc("${orderModel.ordersId}")
          .set({
            "lat": lat,
            "lng": lng,
            "courierId": myServices.sharedPref.getInt("courier_id"),
          });
    });
  }

  addMarker() {
    markers.add(
      Marker(
        point: LatLng(orderModel.latitude!, orderModel.longitude!),
        child: Icon(Icons.location_pin),
      ),
    );
    markers.add(Marker(point: LatLng(0, 0), child: Icon(Icons.location_pin)));
  }

  @override
  void onInit() async {
    super.onInit();
    initialData();
    addMarker();
    getCurrentLocation();
    sendingLocation();
  }

  @override
  void onClose() {
    super.onClose();
    positionStream.cancel();
    timer!.cancel();
  }

  @override
  doneOrder(orderId, userId) {
    AcceptedOrdersController controller = Get.find();
    controller.doneOrder(orderId, 1, userId);
    Get.offAllNamed(AppRoutes.homeScreen);
  }
}
