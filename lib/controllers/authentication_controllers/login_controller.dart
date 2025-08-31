import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/dependency_injection.dart';
import 'package:dapperz/main.dart';
import 'package:dapperz/models/login/check_mobile_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import '../../common/config/session.dart';
import '../../models/login/login_model.dart';
import '../../user_singleton.dart';

class LoginController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final socialLoginCtrl = Get.isRegistered<SocialLoginController>()
      ? Get.find<SocialLoginController>()
      : Get.put(SocialLoginController());

  // Email & password controllers
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final BaseApi apiCall = ApiServiceCall();
  final storage = GetStorage();

  bool passwordVisible = true;
  bool isBack = false;

  // Toggle password visibility
  void toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  //direct login using actual backend
  Future<void> login() async {
    final email = txtEmail.text.trim();
    final password = txtPassword.text.trim();

    if (email.isEmpty || password.isEmpty) {
      socialLoginCtrl.showToast('Email and Password are required');
      return;
    }

    socialLoginCtrl.showLoading();
    update();

    try {
      final params = {
        'email': email,
        'password': password,
      };

      print("Sending login request: $params");

      final response = await apiCall.postRequest(ApiMethodList.userLogin, params);
      final loginModel = LoginModel.fromJson(response);

      print("login response: $response");

      if (loginModel.isSuccess == true) {
        UserSingleton().isGuest = false;
        UserSingleton().token = loginModel.data!.access;
        UserSingleton().uuidFcm = loginModel.data!.username ?? "";
        // UserSingleton().firstName = loginModel.data!.firstName ?? "";

        await storage.write(Session.isGuest, false);
        await storage.write(Session.isGuestLoginToken, "");
        await storage.write(Session.isLogin, true);
        await storage.write(Session.isRegularLoginToken, UserSingleton().token);
        await storage.write(Session.id, UserSingleton().uuidFcm);
        await storage.write(Session.userName, UserSingleton().firstName);

        print("session token: $UserSingleton().uuidFcm");

        txtEmail.clear();
        txtPassword.clear();
        Get.offAllNamed(routeName.dashboard);
      } else {
        socialLoginCtrl.showToast("Login failed. Please check credentials.");
      }
    } catch (e) {
      print('Login error: $e');
      socialLoginCtrl.showToast('An unexpected error occurred');
    } finally {
      socialLoginCtrl.hideLoading();
      update();
    }
  }

  @override
  void onReady() {
    isBack = Get.arguments ?? false;
    update();
    DependencyInjection.init();
    super.onReady();
  }
}

