import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/dashboard/auto_complete_search_model.dart'
    as acsm;
import 'package:dapperz/models/dashboard/auto_complete_search_model.dart';

import '../../api/api_method_list.dart';
import '../../config.dart';

class SearchScreenController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController controller = TextEditingController();
  int selectRecommended = 0;
  int selectNewArrival = 0;
  acsm.Products? recentSearchList;

  // List<acsm.Products> recentSearchList = [];
  acsm.Categories? categories;
  acsm.Brands? brandList;

  // acsm.category? categories;
  // List<acsm.Tags> tagsList = [];
  List recommendedList = [];
  List newArrivalProductList = [];
  List innerCategoryProduct = [];

  BaseApi apiCall = ApiServiceCall();

  @override
  void onReady() {
    recommendedList = AppArray().recommendedList;
    // newArrivalProductList= AppArray().newArrivalProductList;
    innerCategoryProduct = AppArray().innerCategoryProduct;
    update();
    super.onReady();
  }

  //go to shop page
  goToShopPage(name) {
    appCtrl.isNotification = false;
    appCtrl.update();
    Get.toNamed(routeName.shopPage, arguments: name);
  }

  autoCompleteSearch(String text) async {
    try {
      recentSearchList?.pitems?.clear();
      brandList?.bitems?.clear();
      categories?.citems?.clear();
      dynamic response =
          await apiCall.getResponse(ApiMethodList.autoCompleteSearch + text);
      if (AutoCompleteSearchModel.fromJson(response).success != null &&
          AutoCompleteSearchModel.fromJson(response).success! &&
          AutoCompleteSearchModel.fromJson(response).data!.products != null) {
        recentSearchList =
            AutoCompleteSearchModel.fromJson(response).data!.products;
        categories =
            AutoCompleteSearchModel.fromJson(response).data!.categories;
        brandList = AutoCompleteSearchModel.fromJson(response).data!.brands;
      }
      update();
    } catch (e) {
      rethrow;
    }
  }
}
