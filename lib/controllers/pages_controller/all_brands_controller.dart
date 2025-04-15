import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/category/all_brands_model.dart' as abm;
import 'package:fluttertoast/fluttertoast.dart';

import '../../api/api_method_list.dart';
import '../../config.dart';

class AllBrandsController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  BaseApi apiCall = ApiServiceCall();

  List<abm.Data>? data = [];
  bool? isLoading = true;

  @override
  void onReady() async {
    await getData();
    super.onReady();
  }

  getData() async {
    isLoading = true;
    update();
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.allBrands);
      if (data != null) {
        isLoading = false;
        data!.addAll(abm.AllBrandsModel.fromJson(response).data!);
      } else {
        isLoading = false;
        data = [];
      }
      update();
    } catch (e) {
      isLoading = false;
      data = [];
      Fluttertoast.showToast(msg: "Unable to Get Data");
      rethrow;
    }
  }
}
