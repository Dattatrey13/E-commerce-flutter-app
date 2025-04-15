import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/order/get_all_order_list_model.dart' as gaolm;
import 'package:dapperz/models/order/get_all_order_list_model.dart';

import '../../config.dart';

class OrderHistoryController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  TextEditingController controller = TextEditingController();
  List<gaolm.Data> orderHistoryList = [];
  List orderType = [];
  List timeFilterType = [];
  int orderTypeValue = 0;
  int timeFilterTypeValue = 0;
  BaseApi apiCall = ApiServiceCall();
  bool isLoading = true;

  @override
  void onReady() async {
    await getOrderList();
    timeFilterType = AppArray().timeFilterType;
    update();
    super.onReady();
  }

  //common bottom sheet
  bottomSheetLayout() {
    Get.bottomSheet(
      const RatingReview(),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  //order history filter bottom sheet
  historyFilterBottomSheet() {
    Get.bottomSheet(
      const OrderHistoryFilter(),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  getOrderList() async {
    try {
      isLoading = true;
      orderHistoryList.clear();
      dynamic response = await apiCall.getResponse(ApiMethodList.getOrderList);
      orderHistoryList
          .addAll(GetAllOrderListModel.fromJson(response).data ?? []);
      isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }
}
