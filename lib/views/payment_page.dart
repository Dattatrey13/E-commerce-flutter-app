import 'dart:collection';

import 'package:dapperz/api/api_config.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatefulWidget {
  final String? url;

  const PaymentPage({super.key, this.url});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  HashMap<String, dynamic>? data;
  late WebViewController controller;

  @override
  void initState() {
    data = Get.arguments;
    controller = WebViewController.fromPlatformCreationParams(
        const PlatformWebViewControllerCreationParams());
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            if (url.contains("?is_success=1") &&
                url.contains(ApiConfig.baseUrl)) {
              String urlTemp = url.split("?transactionId=")[1].split("_").first;
              Fluttertoast.showToast(msg: "Order Placed Successfully");
              HashMap<String, dynamic> params = HashMap();
              params['orderId'] = urlTemp;
              params['data'] = "";
              params['type'] = 2; // For Online
              params['shippingAddress'] =
                  data!['shippingAddress']; // For Online
              Get.offAndToNamed(routeName.orderSuccess, arguments: params);
            }
            if (url.contains("?is_success=0") &&
                url.contains(ApiConfig.baseUrl)) {
              Fluttertoast.showToast(msg: "Payment Failed");
              Get.back();
            }
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
            "${ApiConfig.baseUrl}orders/pay-online/?transaction_id=${data!['transaction_id']}&access_key=${data!['access_key']}"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${UserSingleton().token}',
        },
      );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
