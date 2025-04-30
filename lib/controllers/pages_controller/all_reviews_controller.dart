import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/models/product/product_review_list_model.dart' as prl;

class AllReviewsController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List<prl.Data>? productReviewAll;
  BaseApi apiCall = ApiServiceCall();
  bool isLoading = true;

  @override
  void onReady() async {
    String slug = Get.arguments;
    await Future.delayed(DurationsClass.s1);
    await getProductReview("10", slug);
    update();
    super.onReady();
  }

  getProductReview(String pageSize, String slug) async {
    try {
      dynamic response = await apiCall.getResponse(
          "${ApiMethodList.getProductReview}$slug/?page_size=$pageSize");
      productReviewAll = prl.ProductReviewListModel.fromJson(response).data!;
      isLoading = false;
    } catch (e) {
      productReviewAll = [];
      isLoading = false;
      rethrow;
    }
  }
}
