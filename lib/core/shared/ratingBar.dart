import 'package:deliveryapp/controller/orders/orders_controller.dart';
import 'package:deliveryapp/core/constants/image_assets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

@override
Widget ratingBarShow(BuildContext context, double initialRating, double size) {
  // OrdersController controller = Get.find();
  return RatingBar.builder(
    itemSize: size,
    initialRating: initialRating,
    minRating: 1,
    direction: Axis.horizontal,
    allowHalfRating: true,
    itemCount: 5,
    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
    onRatingUpdate: (rating) {},
  );
}

void showDialogRating(BuildContext context, int orderId) {
  OrdersController controller = Get.find();

  showDialog(
    context: context,
    builder:
        (context) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 280),
          child: Material(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(),
              width: 300,
              padding: EdgeInsets.all(10),
              height: 300,
              child: Column(
                children: [
                  SvgPicture.asset(SvgAssets.creditCardIcon, height: 100),
                  SizedBox(height: 10),
                  Text(
                    "rate your order and add \n comment if you like",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(child: ratingBarShow(context, 3.0, 40)),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: controller.commentCtrl,
                    buildCounter: (
                      context, {
                      required currentLength,
                      required isFocused,
                      required maxLength,
                    }) {
                      if (isFocused) {
                        return Text("$currentLength / $maxLength");
                      }
                      return null;
                    },

                    maxLength: 255,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "type your comments ",
                      fillColor: const Color.fromARGB(12, 158, 158, 158),
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  Spacer(flex: 2),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "submit",
                      style: TextTheme.of(context).titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
    barrierDismissible: true,
  );
}
