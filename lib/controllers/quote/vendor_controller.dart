import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/models/chat/vendor_list_model.dart';

import '../../api/api_method_list.dart';

class VendorController extends GetxController {
  bool isLoading = true;

  VendorListModel? vendorListModel;

  BaseApi apiCall = ApiServiceCall();

  @override
  void onReady() {
    getVendorList();
    super.onReady();
  }

  getVendorList() async {
    try {
      isLoading = true;
      update();
      dynamic response = await apiCall.getResponse(ApiMethodList.vendorList);
      vendorListModel = VendorListModel.fromJson(response);
      isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }
}
