import 'package:deliveryapp/core/class/crud.dart';
import 'package:deliveryapp/core/constants/api_links.dart';
import 'package:deliveryapp/core/services/services.dart';
import 'package:get/get.dart';

class OrdersData {
  Crud crud = Get.find();
  MyServices myServices = Get.find();

  getPendingOrders() async {
    var response = await crud.postRequest(ApiLinks.pendingOrders, {
      "userId": myServices.sharedPref.getInt("user_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  getAcceptedOrders() async {
    print(
      "courierId: ${myServices.sharedPref.getInt("courier_id").toString()}",
    );
    var response = await crud.postRequest(ApiLinks.acceptedOrders, {
      "courierId": myServices.sharedPref.getInt("courier_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  getArchiveOrders() async {
    var response = await crud.postRequest(ApiLinks.archiveOrders, {
      "courierId": myServices.sharedPref.getInt("courier_id").toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  approveOrder({int? orderId, int? adminId, int? userId}) async {
    var response = await crud.postRequest(ApiLinks.approveOrder, {
      "userId": userId.toString(),
      "courierId": myServices.sharedPref.getInt("courier_id").toString(),
      "orderId": orderId.toString(),
      "adminId": adminId.toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }

  doneOrder({int? orderId, int? adminId, int? userId}) async {
    var response = await crud.postRequest(ApiLinks.doneOrders, {
      "userId": userId.toString(),
      "orderId": orderId.toString(),
      "adminId": adminId.toString(),
    });

    if (response.isRight()) {
      return response.fold((l) => null, (r) => r);
    } else {
      return response.fold((l) => l, (r) => null);
    }
  }
}
