import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/models/chat/quote_detail_model.dart';

class QuoteDetailController extends GetxController {
  String name = "";
  String id = "";
  bool isLoading = true;
  QuoteDetailModel? quoteDetailModel;

  BaseApi apiCall = ApiServiceCall();

  @override
  void onReady() {
    var data = Get.arguments;
    name = data['name'] ?? "";
    id = (data['id'] ?? "").toString();
    getQuoteList();
    super.onReady();
  }

  void getQuoteList() async {
    try {
      isLoading = true;
      update();
      dynamic response =
          await apiCall.getResponse("${ApiMethodList.getQuote}$id/");
      quoteDetailModel = QuoteDetailModel.fromJson(response);
      isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }
}
