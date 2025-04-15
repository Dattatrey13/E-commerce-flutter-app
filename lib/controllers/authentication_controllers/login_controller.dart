import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/dependency_injection.dart';
import 'package:dapperz/main.dart';
import 'package:dapperz/models/login/check_mobile_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final socialLoginCtrl = Get.isRegistered<SocialLoginController>()
      ? Get.find<SocialLoginController>()
      : Get.put(SocialLoginController());

  TextEditingController txtMobile = TextEditingController();

  bool isBack = false;

  final FocusNode mobileFocus = FocusNode();

  bool passwordVisible = true;
  final storage = GetStorage();
  BaseApi apiCall = ApiServiceCall();

  // Toggle Between Password show
  toggle() {
    passwordVisible = !passwordVisible;
    update();
  }

  //firebase login with email and password
  login() async {
    socialLoginCtrl.showLoading();
    update();
    try {
      // var user = await auth.signInWithEmailAndPassword(email: txtMobile.text, password: txtPassword.text);
      // await user.user!.getIdToken();
      // final User? currentUser = auth.currentUser;
      // assert(user.user!.uid == currentUser!.uid);
      // await storage.write('id', user.user!.uid);
      //
      // txtMobile.text = "";
      // socialLoginCtrl.saveData(user.user!.uid);
      // socialLoginCtrl.hideLoading();
      update();
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      socialLoginCtrl.hideLoading();
      update();
      if (e.code == 'wrong-password') {
        socialLoginCtrl.showToast('Incorrect Password');
      } else if (e.code == 'user-not-found') {
        socialLoginCtrl.showToast('Email is not Found');
      }
    } catch (e) {
      socialLoginCtrl.hideLoading();
      update();
    } finally {
      socialLoginCtrl.hideLoading();
      update();
    }
  }

  checkMobileExist(String mobileNo) async {
    socialLoginCtrl.showLoading();
    try {
      HashMap<String, dynamic> params = HashMap();
      params['phone_number'] = mobileNo;
      dynamic response =
          await apiCall.postRequest(ApiMethodList.checkMobileNumber, params);
      socialLoginCtrl.hideLoading();
      return CheckMobileModel.fromJson(response).data!.isExists ?? false;
    } catch (e) {
      socialLoginCtrl.hideLoading();
      rethrow;
    }
  }

  sendOTP(String mobileNo) async {
    socialLoginCtrl.showLoading();
    await auth!.verifyPhoneNumber(
      phoneNumber: '+91$mobileNo',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        socialLoginCtrl.hideLoading();
        if (e.code == 'invalid-phone-number') {
          Fluttertoast.showToast(
              msg: ('The provided phone number is not valid.'));
        } else {
          Fluttertoast.showToast(msg: e.message ?? "Something Went Wrong");
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        socialLoginCtrl.hideLoading();
        sendOtp(mobileNo, verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        socialLoginCtrl.hideLoading();
      },
    );
  }

  @override
  void onReady() {
    isBack = Get.arguments ?? false;
    update();
    DependencyInjection.init();
    super.onReady();
  }
}
