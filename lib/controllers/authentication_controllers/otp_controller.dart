import 'dart:async';

import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/config.dart';

class OtpController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  TextEditingController txtEmail = TextEditingController();
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  TextEditingController fieldOTP = TextEditingController();

  BaseApi apiCall = ApiServiceCall();

  int remainingSeconds = 30;
  Timer? timer;

  @override
  void onReady() async {
    update();
    startTimer();
    super.onReady();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds = 30 - timer.tick;
        update();
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
