import 'dart:collection';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../config.dart';
import '../../api/api_method_list.dart';
import '../../api/api_service_call.dart';
import '../../api/base_api_call.dart';

class RazorpayController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
      
  late Razorpay _razorpay;
  String? orderId;
  String? totalAmount;
  final RxBool isLoading = false.obs;
  BaseApi apiCall = ApiServiceCall();
  
  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    try {
      // Update order status
      HashMap<String, dynamic> params = HashMap();
      params['order_id'] = orderId;
      params['payment_id'] = response.paymentId;
      params['signature'] = response.signature;
      params['status'] = 'completed';
      
      print("Updating order status with params: $params");
      
      dynamic updateResponse = await apiCall.postRequest(
        ApiMethodList.updateOrderStatus,
        params
      );
      
      print("Order status update response: $updateResponse");
      
      if (updateResponse['success'] == true) {
        isLoading.value = false;
        Fluttertoast.showToast(
          msg: "Payment Successful: ${response.paymentId}",
          toastLength: Toast.LENGTH_SHORT,
        );
      } else {
        isLoading.value = false;
        Fluttertoast.showToast(
          msg: "Payment successful but order update failed",
          toastLength: Toast.LENGTH_SHORT,
        );
      }
    } catch (e) {
      print("Error updating order status: $e");
      isLoading.value = false;
      Fluttertoast.showToast(
        msg: "Error updating order: ${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment failed: ${response.message}");
    isLoading.value = false;
    Fluttertoast.showToast(
      msg: "Payment Failed: ${response.message}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("External wallet selected: ${response.walletName}");
    isLoading.value = false;
    Fluttertoast.showToast(
      msg: "External Wallet Selected: ${response.walletName}",
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  void startPayment({
    required String keyId,
    required double amount,
    required String name,
    required String description,
    required String prefillEmail,
    required String prefillContact,
  }) {
    isLoading.value = true;
    
    var options = {
      'key': keyId,
      'amount': (amount * 100).toInt(), // Amount in smallest currency unit
      'name': name,
      'description': description,
      'prefill': {
        'contact': prefillContact,
        'email': prefillEmail
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    print("Starting Razorpay payment with options: $options");

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error starting Razorpay payment: $e");
      isLoading.value = false;
      Fluttertoast.showToast(
        msg: "Error: ${e.toString()}",
        toastLength: Toast.LENGTH_SHORT,
      );
    }
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }
} 