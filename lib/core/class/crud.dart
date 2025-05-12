import 'package:dartz/dartz.dart';
import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Crud {
  Future<Either<StatusRequest, Map>> postRequest(String url, Map data) async {
    if (await isOnline() == true) {
      try {
        var response = await http.post(Uri.parse(url), body: data);

        if (response.statusCode == 200 || response.statusCode == 201) {
          print("------- responsebody is : ${response.body}");
          Map responsebody = jsonDecode(response.body);

          print("------------------------------- must return right value");
          return Right(responsebody);
        } else {
          print("------fail");
          return const Left(StatusRequest.serverFailure);
        }
      } catch (e) {
        print(" el error :  $e");
        return const Left(StatusRequest.exceptionFailure);
      }
    } else {
      print("you are offline dont cry");
      return const Left(StatusRequest.offlineFailure);
    }
  }

  Future<Either<StatusRequest, Map>> getRequest(String url) async {
    var response = await http.get(Uri.parse(url));
    try {
      if (await isOnline()) {
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverFailure);
    }
  }
}
