import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common/array/cart_array.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/models/cart/apply_coupon_model.dart';
import 'package:dapperz/models/cart/cart_list_model.dart' as acm;
import 'package:dapperz/models/cart/cart_list_model.dart';
import 'package:dapperz/models/dashboard/count_model.dart';
import 'package:dapperz/models/order/get_all_coupons_model.dart';
import 'package:dapperz/models/order/get_cart_total.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import '../../config.dart';
import '../../models/product/delete_review_model.dart';

class CartController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final storage = GetStorage();
  CartListModel? cartModelList;
  GetAllCouponsModel? getAllCouponsModel;
  ApplyCouponModel? applyCouponModel;
  GetCartTotal? cartTotalData;
  TextEditingController txtCouponApplied = TextEditingController();

  List<HomeFindStyleCategoryModel> similarList = [];

  BaseApi apiCall = ApiServiceCall();
  bool? isLoading = true;
  int quantity = 1;

  bool? isPriceLoading = true;

  @override
  void onReady() async {
    await getData();
    txtCouponApplied.text =
        UserSingleton().coupons != null ? UserSingleton().coupons ?? "" : "";
    super.onReady();
    print("Cart Data: $getData()");
  }

  // common bottom sheet
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

  Future getData({bool withShimmer = true}) async {
    isLoading = true;
    appCtrl.isShimmer = true;
    update();

    await getCouponsList();

    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.getUserCartDetails);
      print("Raw Cart API Response: $response");

      if (response != null && response['success'] == true && response['data'] != null) {
        cartModelList = CartListModel.fromJson(response);
        cartList = cartModelList!;
        print("Parsed Cart Items Count: ${cartList.data?.length ?? 0}");

        // Iterate and print each cart item details
        for (var item in cartList.data ?? []) {
          print("Cart Item: ${item.toJson()}");
        }

      } else {
        print("Failed to fetch cart data: ${response['message']}");
      }

    } catch (e, stacktrace) {
      print("Error in getData(): $e");
      print("Stacktrace: $stacktrace");
      rethrow;
    }

    await getCartCount();
    await getCartTotal();

    isLoading = false;
    isPriceLoading = false;
    appCtrl.isShimmer = false;
    appCtrl.update();
    update();
  }

  Future getDataWithOutLoading() async {
    showProgressDialog(true);
    await getCouponsList();
    try {
      dynamic response =
          await apiCall.getResponse(ApiMethodList.getUserCartDetails);
      cartModelList = CartListModel.fromJson(response);
      cartList = cartModelList!;
      update();
      print("GetCart without Loading Data: $response");

    } catch (e) {
      rethrow;
    }
    await getCartCount();
    await getCartTotal();
    update();
    Get.forceAppUpdate();
    isLoading = false;
    isPriceLoading = false;
    update();
    Get.forceAppUpdate();
    showProgressDialog(false);
  }

  Future getCouponsList() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.getAllCoupons);
      getAllCouponsModel = GetAllCouponsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

/*  Future applyCoupon(dynamic params, dynamic e) async {
    try {
      dynamic response = await apiCall.postRequest(ApiMethodList.applyCoupons, params);
      applyCouponModel = ApplyCouponModel.fromJson(response);
      if (applyCouponModel != null && (applyCouponModel!.success ?? false)) {
        txtCouponApplied.text = e.code ?? "";
        UserSingleton().coupons = e.code ?? "";
        UserSingleton().couponsDesc = e.couponsDesc.toString();
        UserSingleton().couponsDiscount = e.amount.toString();
        var temp = e;
        getAllCouponsModel!.data!.remove(e);
        getAllCouponsModel!.data!.insert(0, temp);
        update();
      } else if (applyCouponModel != null && !(applyCouponModel!.success ?? false)) {
        txtCouponApplied.text = "";
        UserSingleton().coupons = "";
        UserSingleton().couponsDiscount = "";
        UserSingleton().couponsDesc = "";
        if (applyCouponModel!.data != null && applyCouponModel!.data!.couponError != null && applyCouponModel!.data!.couponError!.isNotEmpty) {
          Fluttertoast.showToast(msg: applyCouponModel!.data!.couponError!.first ?? "");
        } else if (applyCouponModel!.data != null && applyCouponModel!.data!.message != null) {
          Fluttertoast.showToast(msg: applyCouponModel!.data!.message ?? "");
        } else {
          Fluttertoast.showToast(msg: applyCouponModel!.message ?? "");
        }
      }
    } catch (e) {
      rethrow;
    }
  }*/

/*
  Future removeCoupon(dynamic params, dynamic d, dynamic e, bool isFromApply) async {
    try {
      dynamic response = await apiCall.postRequest(ApiMethodList.removeCoupons, params);
      applyCouponModel = ApplyCouponModel.fromJson(response);
      if (applyCouponModel != null && (applyCouponModel!.success ?? false)) {
        if (isFromApply) {
          applyCoupon(d, e);
        } else {
          Fluttertoast.showToast(msg: applyCouponModel!.message ?? "");
          txtCouponApplied.text = "";
          UserSingleton().coupons = "";
          UserSingleton().couponsDiscount = "";
          UserSingleton().couponsDesc = "";
          update();
        }
        update();
      } else {
        Fluttertoast.showToast(msg: "Something Went Wrong");
      }
    } catch (e) {
      rethrow;
    }
  }
*/

  Future<DeleteReviewModel> removeFromCart(String key) async {
    try {
      dynamic response =
          await apiCall.deleteRequest("${ApiMethodList.userRemoveCart}$key/");
      return DeleteReviewModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  getCartTotal() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.userCartTotal);
      cartTotalData = GetCartTotal.fromJson(response);
      if (cartTotalData!.data!.appliedCoupons != null &&
          cartTotalData!.data!.appliedCoupons!.isNotEmpty) {
        for (var e in getAllCouponsModel!.data!) {
          if (e.code == cartTotalData!.data!.appliedCoupons!.first) {
            txtCouponApplied.text = e.code ?? "";
            UserSingleton().coupons = e.code;
            UserSingleton().couponsDiscount =
                cartTotalData!.data!.totalDiscount.toString();
            var temp = e;
            getAllCouponsModel!.data!.remove(e);
            getAllCouponsModel!.data!.insert(0, temp);
          }
        }
      } else {
        txtCouponApplied.text = "";
        UserSingleton().coupons = "";
        UserSingleton().couponsDiscount = "";
      }
      cartTotal = cartTotalData!;
      update();
      Get.forceAppUpdate();
    } catch (e) {
      rethrow;
    }
  }

  //on quantity increase
  quantityIncrease(acm.Data data) async {
    int val = int.parse(data.quantity!.toString());
    val++;
    bool status = await updateCount(data.cartItemKey.toString(), val);
    if (status) {
      data.setValue = val.toString();
    }
    isPriceLoading = true;
    update();
    Get.forceAppUpdate();
    await getDataWithOutLoading();
  }

  //on quantity decrease
  quantityDecrease(acm.Data data) async {
    int val = int.parse(data.quantity!.toString());
    if (val <= 1) {
      DeleteReviewModel status =
          await removeFromCart(data.cartItemKey.toString());
      if (status.success!) {
        Fluttertoast.showToast(msg: "item deleted");
      }
    } else {
      val--;
      bool status = await updateCount(data.cartItemKey.toString(), val);
      if (status) {
        data.setValue = val.toString();
      }
    }
    isPriceLoading = true;
    update();
    Get.forceAppUpdate();
    await getDataWithOutLoading();
  }

  getCartCount() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.cartCount);
      UserSingleton().cartCount =
          (CountModel.fromJson(response).data!.total ?? 0).toInt();
    } catch (e) {
      rethrow;
    }
  }

  updateCount(String itemKey, int quantity) async {
    if (UserSingleton().isGuest!) {
      try {
        HashMap<String, dynamic> params = HashMap();
        params['quantity'] = quantity.toString();
        //params['return_cart'] = true;
        dynamic response = await apiCall.patchRequest(
            "${ApiMethodList.updateCart}$itemKey/", params);
        return CountModel.fromJson(response).success;
      } catch (e) {
        rethrow;
      }
    } else {
      try {
        HashMap<String, dynamic> params = HashMap();
        params['quantity'] = quantity.toString();
        //params['return_cart'] = true;
        dynamic response = await apiCall.patchRequest(
            "${ApiMethodList.updateCart}$itemKey/", params);
        return CountModel.fromJson(response).success;
      } catch (e) {
        rethrow;
      }
    }
  }
}
