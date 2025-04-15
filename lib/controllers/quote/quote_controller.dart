import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/config.dart';

import '../../models/chat/quote_list_model.dart';

class QuoteController extends GetxController {
  bool isLoading = true;
  QuoteListModel? quoteListModel = QuoteListModel();

  BaseApi apiCall = ApiServiceCall();

  @override
  void onReady() {
    getQuoteList();
    super.onReady();
  }

  void getQuoteList() async {
    try {
      isLoading = true;
      update();
      dynamic response = await apiCall.getResponse(ApiMethodList.getQuote);
      quoteListModel = QuoteListModel.fromJson(response);
      isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }
}
