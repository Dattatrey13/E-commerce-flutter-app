import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common/array/cart_array.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/models/cart/apply_coupon_model.dart';
import 'package:dapperz/models/order/get_all_coupons_model.dart';
import 'package:dapperz/models/order/get_cart_total.dart';
import 'package:dapperz/models/order/order_checkout_model.dart';
import 'package:dapperz/models/order/order_online_checkout_model.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config.dart';
import '../../models/address_list_model.dart' as al;

class PaymentController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final socialLoginCtrl = Get.put(SocialLoginController());

  String totalAmount = "0";

  String? orderNote;
  al.Data? billingAddress, shippingAddress;
  bool seeAll = false;
  int? selectRadio = 0;
  int? selectWallet = 0;
  String value = "";
  bool expand = false;
  int? tapped = 0;
  String walletSelectedValue = "Choose Bank...";

  var bankList = ["Choose Bank...", "ICICI", "BOB"];

  BaseApi apiCall = ApiServiceCall();

  // Coupons
  TextEditingController txtCouponApplied = TextEditingController();
  GetCartTotal? cartTotalData;
  GetAllCouponsModel? getAllCouponsModel;
  ApplyCouponModel? applyCouponModel;

  @override
  void onReady() async {
    await getData();
    billingAddress = Get.arguments['billingAddress'];
    shippingAddress = Get.arguments['shippingAddress'];
    orderNote = Get.arguments['orderNote'];
    totalAmount = Get.arguments['totalAmount'].toString();
    update();
    super.onReady();
  }

  //expanded
  expandBox(index) {
    expand =
        ((tapped == null) || ((index == tapped) || !expand)) ? !expand : expand;
    tapped = index;
    update();
  }

  //select address
  selectAddressType(val, index) {
    value = val['title']!;
    selectRadio = index;
    expand =
        ((tapped == null) || ((index == tapped) || !expand)) ? !expand : expand;
    tapped = index;
    update();
  }

  payNow() async {
    try {
      HashMap<String, dynamic> params = HashMap();
      params['payment_method'] = "cod";
      params['payment_method_title'] = "Cash on delivery";
      params['set_paid'] = "false";
      HashMap<String, dynamic> billingParams = HashMap();
      billingParams['first_name'] = billingAddress!.firstName;
      billingParams['last_name'] = billingAddress!.lastName;
      billingParams['address_1'] = billingAddress!.address1;
      billingParams['address_2'] = billingAddress!.address2;
      billingParams['city'] = billingAddress!.city;
      billingParams['state'] = billingAddress!.state;
      billingParams['postcode'] = billingAddress!.pincode;
      billingParams['country'] = billingAddress!.country;
      billingParams['email'] = billingAddress!.email;
      billingParams['phone'] = billingAddress!.phoneNumber;
      params['billing'] = billingParams;
      HashMap<String, dynamic> shippingParams = HashMap();
      shippingParams['first_name'] = shippingAddress!.firstName;
      shippingParams['last_name'] = shippingAddress!.lastName;
      shippingParams['address_1'] = shippingAddress!.address1;
      shippingParams['address_2'] = shippingAddress!.address2;
      shippingParams['city'] = shippingAddress!.city;
      shippingParams['state'] = shippingAddress!.state;
      shippingParams['postcode'] = shippingAddress!.pincode;
      shippingParams['country'] = shippingAddress!.country;
      shippingParams['email'] = shippingAddress!.email;
      params['shipping'] = shippingParams;
      List<HashMap<String, dynamic>> product = [];
      for (int i = 0; i < cartList.data!.length; i++) {
        HashMap<String, dynamic> linesItemsParams = HashMap();
        linesItemsParams['cart_item_key'] = cartList.data![i].cartItemKey!;
        product.add(linesItemsParams);
      }
      params['line_items'] = product;
      params['note'] = orderNote;
      params['is_buy_now'] = UserSingleton().isBuyNow;
      dynamic response =
          await apiCall.postRequest(ApiMethodList.userOrderCheckout, params);
      OrderCheckoutModel? status = OrderCheckoutModel.fromJson(response);

      print("COD Response: $response");

      print("Sending params: $params");

      if ((status.success ?? false)) {
        UserSingleton().isBuyNow = false;
        showProgressDialog(false);
        HashMap<String, dynamic> params = HashMap();
        params['orderId'] = status.data!.id!.toString();
        params['data'] = status;
        params['type'] = 1; // For Cash On Delivery
        params['shippingAddress'] = shippingAddress;
        Get.offAndToNamed(routeName.orderSuccess, arguments: params);
      } else {
        showProgressDialog(false);
        Fluttertoast.showToast(msg: status.message ?? "Unable to Place Order");
      }
    } catch (e) {
      showProgressDialog(false);
      Fluttertoast.showToast(msg: "Unable to Place Order");
    }
  }

  payNowOnline() async {
    try {
      HashMap<String, dynamic> params = HashMap();
      params['payment_method'] = "payeasebuzz";
      params['payment_method_title'] = "Pay Online";
      params['set_paid'] = "true";
      HashMap<String, dynamic> billingParams = HashMap();
      billingParams['first_name'] = billingAddress!.firstName;
      billingParams['last_name'] = billingAddress!.lastName;
      billingParams['address_1'] = billingAddress!.address1;
      billingParams['address_2'] = billingAddress!.address2;
      billingParams['city'] = billingAddress!.city;
      billingParams['state'] = billingAddress!.state;
      billingParams['postcode'] = billingAddress!.pincode;
      billingParams['country'] = billingAddress!.country;
      billingParams['email'] = billingAddress!.email;
      billingParams['phone'] = billingAddress!.phoneNumber;
      params['billing'] = billingParams;
      HashMap<String, dynamic> shippingParams = HashMap();
      shippingParams['first_name'] = shippingAddress!.firstName;
      shippingParams['last_name'] = shippingAddress!.lastName;
      shippingParams['address_1'] = shippingAddress!.address1;
      shippingParams['address_2'] = shippingAddress!.address2;
      shippingParams['city'] = shippingAddress!.city;
      shippingParams['state'] = shippingAddress!.state;
      shippingParams['postcode'] = shippingAddress!.pincode;
      shippingParams['country'] = shippingAddress!.country;
      shippingParams['email'] = shippingAddress!.email;
      params['shipping'] = shippingParams;
      List<HashMap<String, dynamic>> product = [];
      for (int i = 0; i < cartList.data!.length; i++) {
        HashMap<String, dynamic> linesItemsParams = HashMap();
        linesItemsParams['cart_item_key'] = cartList.data![i].cartItemKey!;
        product.add(linesItemsParams);
      }
      params['line_items'] = product;
      params['note'] = orderNote;
      params['is_buy_now'] = UserSingleton().isBuyNow;
      dynamic response =
          await apiCall.postRequest(ApiMethodList.userOrderCheckout, params);
      if (OrderOnlineCheckoutModel.fromJson(response).success == true &&
          OrderOnlineCheckoutModel.fromJson(response).data != null) {
        UserSingleton().isBuyNow = false;
        HashMap<String, dynamic> testPa = HashMap();
        testPa['access_key'] =
            OrderOnlineCheckoutModel.fromJson(response).data!.accessKey ?? "";
        testPa['transaction_id'] =
            OrderOnlineCheckoutModel.fromJson(response).data!.transactionId ??
                "";
        await Future.delayed(DurationsClass.s1);
        showProgressDialog(false);
        testPa['shippingAddress'] = shippingAddress;
        Get.toNamed(routeName.paymentPage, arguments: testPa);
      } else {
        showProgressDialog(false);
        Fluttertoast.showToast(
            msg: OrderOnlineCheckoutModel.fromJson(response).message ??
                "Unable to Place Order");
        return false;
      }
    } catch (e) {
      showProgressDialog(false);
      Fluttertoast.showToast(msg: "Payment Failed");
    }
  }

  Future applyCoupon(dynamic params, dynamic e) async {
    try {
      dynamic response =
          await apiCall.postRequest(ApiMethodList.applyCoupons, params);
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
      } else if (applyCouponModel != null &&
          !(applyCouponModel!.success ?? false)) {
        txtCouponApplied.text = "";
        UserSingleton().coupons = "";
        UserSingleton().couponsDiscount = "";
        UserSingleton().couponsDesc = "";
        if (applyCouponModel!.data != null &&
            applyCouponModel!.data!.couponError != null &&
            applyCouponModel!.data!.couponError!.isNotEmpty) {
          Fluttertoast.showToast(
              msg: applyCouponModel!.data!.couponError!.first ?? "");
        } else if (applyCouponModel!.data != null &&
            applyCouponModel!.data!.message != null) {
          Fluttertoast.showToast(msg: applyCouponModel!.data!.message ?? "");
        } else {
          Fluttertoast.showToast(msg: applyCouponModel!.message ?? "");
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  Future removeCoupon(
      dynamic params, dynamic d, dynamic e, bool isFromApply) async {
    try {
      dynamic response =
          await apiCall.postRequest(ApiMethodList.removeCoupons, params);
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

  getCartTotal() async {
    try {
      dynamic response = UserSingleton().isBuyNow ?? false
          ? await apiCall
              .getResponse("${ApiMethodList.userCartTotal}?is_buy_now=true")
          : await apiCall.getResponse(ApiMethodList.userCartTotal);
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

  Future getData({bool withShimmer = true}) async {
    appCtrl.isShimmer = true;
    update();
    await getCouponsList();
    await getCartTotal();
    appCtrl.isShimmer = false;
    appCtrl.update();
    update();
  }

  Future getCouponsList() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.getAllCoupons);
      getAllCouponsModel = GetAllCouponsModel.fromJson(response);

      print("Payment Coupons: $response");
    } catch (e) {
      rethrow;
    }
  }
}
