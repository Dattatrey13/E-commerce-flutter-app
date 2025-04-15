import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import '../../config.dart';

class SocialLoginController extends GetxController {
  bool isLoading = false;
  final storage = GetStorage();

  //show loader
  void showLoading() {
    isLoading = true;
    update();
  }

  //hide loader
  void hideLoading() {
    isLoading = false;
    update();
  }

  //save data in shared pref
  saveData(userid) async {
    await storage.write('id', userid);
    update();
    Get.toNamed(routeName.dashboard);
  }

  //show toast
  showToast(error) {
    Fluttertoast.showToast(msg: error);
  }
}