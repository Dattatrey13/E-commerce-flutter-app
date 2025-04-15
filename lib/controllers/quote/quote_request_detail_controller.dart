import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/models/chat/quote_request_detail_model.dart';
import 'package:dapperz/models/form_submit_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class QuoteRequestDetailController extends GetxController {
  bool isLoading = true;
  BaseApi apiCall = ApiServiceCall();
  String id = "";

  QuoteRequestDetailModel? quoteRequestDetailModel;

  @override
  void onReady() {
    var data = Get.arguments;
    id = (data['id'] ?? "").toString();
    getQuoteDetailList();
    super.onReady();
  }

  void getQuoteDetailList() async {
    try {
      isLoading = true;
      update();
      dynamic response = await apiCall
          .getResponse("${ApiMethodList.getQuoteRequestDetail}$id/");
      quoteRequestDetailModel = QuoteRequestDetailModel.fromJson(response);
      isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }

  void acceptOrDecline(String status) async {
    try {
      showProgressDialog(true);
      HashMap<String, dynamic> params = HashMap();
      params['status'] = status; // accepted, declined
      dynamic response = await apiCall.patchRequest(
          "${ApiMethodList.acceptOrDecline}$id/", params);
      var data = FormSubmitModel.fromJson(response);
      if (data != null && data.message == "Success") {
        getQuoteDetailList();
      } else {
        Fluttertoast.showToast(msg: "Unable to $status request");
      }
      showProgressDialog(false);
    } catch (e) {
      rethrow;
    }
  }
}
