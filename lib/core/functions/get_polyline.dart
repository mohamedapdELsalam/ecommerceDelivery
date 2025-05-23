import 'dart:convert';

import 'package:deliveryapp/core/constants/api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart';
import 'package:latlong2/latlong.dart';

getPolyline(lat, lng, latDes, lngDes) async {
  PolylinePoints polylinePoints = PolylinePoints();
  List<Polyline> polyLineList = [];
  List<LatLng> polylineCord = [];
  String polylineUrl =
      "https://api.mapbox.com/directions/v5/mapbox/driving-traffic";
  String url =
      "$polylineUrl/$lng,$lat;$lngDes,$latDes?geometries=polyline&access_token=${ApiKeys.mapBoxToken}";
  var response = await get(Uri.parse(url));
  var responseBody = jsonDecode(response.body);
  var point = responseBody["routes"][0]["geometry"];

  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  print(result);
  if (result.isNotEmpty) {
    result.forEach((PointLatLng pointLatLng) {
      polylineCord.add(LatLng(pointLatLng.latitude, pointLatLng.longitude));
    });

    Polyline polyline = Polyline(color: Colors.purple, points: polylineCord);
    polyLineList.add(polyline);
  }
  return polyLineList;
}
