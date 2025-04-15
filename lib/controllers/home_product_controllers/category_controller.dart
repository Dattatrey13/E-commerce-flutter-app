import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/category/subcategory_model.dart' as scm;
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;

import '../../api/api_method_list.dart';
import '../../config.dart';

class CategoryController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  List<cm.Data> categoryList = [];
  scm.Data? subCategoryList;

  BaseApi apiCall = ApiServiceCall();

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  //get data list
  getData() async {
    appCtrl.isShimmer = true;
    appCtrl.update();
    await getCategoryList();
    update();
    await Future.delayed(DurationsClass.s1);
    appCtrl.isShimmer = false;
    appCtrl.update();
    update();
  }

  getCategoryList() async {
    try {
      categoryList.clear();
      dynamic response = await apiCall.getResponse(ApiMethodList.allCategory);
      if (cm.AllCategoryModel.fromJson(response).data != null) {
        for (var element in cm.AllCategoryModel.fromJson(response).data!) {
          if (element.imageUrl != null) {
            categoryList.add(element);
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  getSubCategoryList(String catId) async {
    try {
      dynamic response =
          await apiCall.getResponse("${ApiMethodList.subCategory}$catId/");
      subCategoryList = scm.SubCategoryModel.fromJson(response).data!;
    } catch (e) {
      rethrow;
    }
  }
}
