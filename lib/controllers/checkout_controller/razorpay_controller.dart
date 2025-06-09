import 'dart:collection';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../config.dart';

class RazorpayController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
      
  late Razorpay _razorpay;
  String? orderId;
  String? totalAmount;
  final RxBool isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    isLoading.value = false;
    Fluttertoast.showToast(
      msg: "Payment Successful: ${response.paymentId}",
      toastLength: Toast.LENGTH_SHORT,
    );
    // Handle successful payment here
    // You might want to update order status, show success screen, etc.
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    isLoading.value = false;
    Fluttertoast.showToast(
      msg: "Payment Failed: ${response.message}",
      toastLength: Toast.LENGTH_SHORT,
    );
    // Handle payment failure here
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    isLoading.value = false;
    Fluttertoast.showToast(
      msg: "External Wallet Selected: ${response.walletName}",
      toastLength: Toast.LENGTH_SHORT,
    );
    // Handle external wallet selection here
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

    try {
      _razorpay.open(options);
    } catch (e) {
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