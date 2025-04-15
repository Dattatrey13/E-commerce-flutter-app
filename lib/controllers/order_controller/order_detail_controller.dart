import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/order/get_order_by_id_model.dart';
import 'package:dapperz/models/product/delete_review_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config.dart';

class OrderDetailController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController controller = TextEditingController();
  List<OrderHistoryModel> orderHistoryList = [];

  GetOrderByIdModel? getOrderByIdModel;
  DeleteReviewModel? deleteOrderByIdModel;
  bool isLoading = true;
  bool? isCancelable = false;
  BaseApi apiCall = ApiServiceCall();

  TextEditingController txtOrderNotes = TextEditingController();
  FocusNode focusTxtOrderNotes = FocusNode();

  @override
  void onReady() async {
    var data = Get.arguments;
    String orderId = data['id'];
    isCancelable = data['is_cancelable'];
    orderHistoryList = orderHistory;
    await getOrderDetails(orderId);
    super.onReady();
  }

  bottomSheetLayout(text) {
    Get.bottomSheet(
      CommonBottomSheet(
          text: text,
          onTap: () {
            cancelOrder(getOrderByIdModel!.data!.id!.toString());
          }),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  getOrderDetails(String orderId) async {
    try {
      dynamic response = await apiCall
          .getResponse("${ApiMethodList.getOrderDetailsByOrderId}$orderId/");
      getOrderByIdModel = GetOrderByIdModel.fromJson(response);
      await Future.delayed(DurationsClass.s1);
      isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }

  cancelOrder(String orderId) async {
    try {
      isLoading = true;
      update();
      HashMap<String, dynamic> params = HashMap();
      //params['order_id'] = int.parse(orderId);
      params['cancel_notes'] = txtOrderNotes.text.trim();
      dynamic response = await apiCall.patchRequest(
          "${ApiMethodList.cancelOrderList}$orderId/", params);
      deleteOrderByIdModel = DeleteReviewModel.fromJson(response);
      if (deleteOrderByIdModel != null &&
          (deleteOrderByIdModel!.success ?? false) &&
          (deleteOrderByIdModel!.message == "Updated")) {
        isLoading = false;
        // showProgressDialog(false);
        update();
        Get.back();
        await getOrderDetails(orderId);
        //Get.offAndToNamed(routeName.orderHistory);
        // Get.toNamed(routeName.orderHistory);
      }
      if (deleteOrderByIdModel != null &&
          (deleteOrderByIdModel!.success ?? false) &&
          (deleteOrderByIdModel!.message == "Updated")) {
        Get.back();
        isLoading = false;
        Fluttertoast.showToast(
            msg: deleteOrderByIdModel!.message ?? "Unable to Cancel Order");
      } else {
        Get.back();
        isLoading = false;
        Fluttertoast.showToast(msg: "Unable to Cancel Order");
      }
      update();
    } catch (e) {
      rethrow;
    }
  }
}
