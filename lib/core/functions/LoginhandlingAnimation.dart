import 'package:deliveryapp/core/class/status_request.dart';
import 'package:deliveryapp/core/constants/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginHandlingAnimation extends StatelessWidget {
  final StatusRequest statusRequest;
  const LoginHandlingAnimation({
    super.key,
    required this.statusRequest,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(LottiesAssets.loadingFingers,
                width: 150, height: 150),
          )
        : statusRequest == StatusRequest.failure
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(LottiesAssets.noDataText,
                      repeat: false, width: 100, height: 100),
                  Text("No Data"),
                ],
              ))
            : statusRequest == StatusRequest.serverFailure
                ? Center(
                    child: Lottie.asset(LottiesAssets.unknown,
                        width: 200, height: 200),
                  )
                : Center(
                    child: Column(
                    children: [
                      Lottie.asset(LottiesAssets.offline),
                      Text("no internet ")
                    ],
                  ));
  }
}
