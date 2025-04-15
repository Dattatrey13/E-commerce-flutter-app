import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/dashboard/count_model.dart';
import 'package:dapperz/models/product/delete_review_model.dart';
import 'package:dapperz/models/wishlist/wish_list_model.dart' as wl;
import 'package:dapperz/user_singleton.dart';
import 'package:get_storage/get_storage.dart';

import '../../config.dart';

class WishlistController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final homeCtrl = Get.put(HomeController());

  final storage = GetStorage();
  CartModel? cartModelList;
  List<wl.Data> wishlist = [];

  BaseApi apiCall = ApiServiceCall();

  @override
  void onReady() async {
    await getData();
    super.onReady();
  }

  //common bottom sheet
  bottomSheetLayout(text) {
    Get.bottomSheet(
      CommonBottomSheet(text: text),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }

  getData() async {
    wishlist.clear();
    appCtrl.isShimmer = true;
    update();
    await getWishList();
    update();
    appCtrl.isShimmer = false;
    appCtrl.update();
    Get.forceAppUpdate();
  }

  getWishList() async {
    try {
      dynamic response =
          await apiCall.getResponse(ApiMethodList.getWishListForUser);
      wishlist.clear();
      wishlist.addAll(wl.WishListModel.fromJson(response).data!);
    } catch (e) {
      rethrow;
    }
  }

  removeItemFromWishList(String id) async {
    try {
      dynamic response = await apiCall
          .deleteRequest("${ApiMethodList.removeItemWishListForUser}$id/");
      if (DeleteReviewModel.fromJson(response).success ?? false) {
        getWishlistCount();
      }
      return DeleteReviewModel.fromJson(response).success ?? false;
    } catch (e) {
      return false;
    }
  }

  getWishlistCount() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.wishlistCount);
      UserSingleton().wishListCount =
          (CountModel.fromJson(response).data!.total ?? 0).toInt();
      Get.forceAppUpdate();
    } catch (e) {
      rethrow;
    }
  }
}
