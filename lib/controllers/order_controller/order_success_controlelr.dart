import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/order/order_checkout_model.dart';

import '../../config.dart';

class OrderSuccessController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  OrderCheckoutModel? status;
  String? orderId;
  bool isLoading = true;
  BaseApi apiCall = ApiServiceCall();
  String? address1;
  String? address2;

  @override
  void onReady() async {
    getOrderDetails(Get.arguments);
    super.onReady();
  }

  getOrderDetails(var temp) async {
    try {
      address1 = temp['shippingAddress'].address1 ?? "";
      address2 = temp['shippingAddress'].address2 ?? "";
      if (temp['type'] == 1) {
        status = temp['data'];
      } else if (temp['type'] == 2) {
        orderId = temp['orderId'];
        dynamic response = await apiCall.getResponse(
            "${ApiMethodList.getOrderDetailsByTransactionId}$orderId/");
        status = OrderCheckoutModel.fromJson(response);
      }
      isLoading = false;
      update();
      Get.forceAppUpdate();
    } catch (e) {
      rethrow;
    }
  }
}
