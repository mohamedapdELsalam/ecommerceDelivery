import 'package:deliveryapp/core/class/crud.dart';
import 'package:deliveryapp/core/constants/api_links.dart';

class OrderDetailsData {
  Crud crud = Crud();

  getOrderDetailsRequest(int orderId) async {
    var response = await crud.postRequest(ApiLinks.orderDetails, {
      "orderId": orderId.toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
