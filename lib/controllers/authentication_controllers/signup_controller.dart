import 'dart:collection';
import 'dart:developer';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/models/login/check_mobile_model.dart';
import 'package:dapperz/models/login/register_new_user_model.dart';
import 'package:dapperz/models/login/user_profile_model.dart';
import 'package:dapperz/models/login/verify_token_model.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uuid/uuid.dart';

class SignUpController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final socialLoginCtrl = Get.isRegistered<SocialLoginController>()
      ? Get.find<SocialLoginController>()
      : Get.put(SocialLoginController());

  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobileNo = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final FocusNode nameFocus = FocusNode();
  final FocusNode mobileNoFocus = FocusNode();

  var auth = FirebaseAuth.instance;

  BaseApi apiCall = ApiServiceCall();

  //sign in
  signRegister(FirebaseAuth auth) async {
    if (signupFormKey.currentState!.validate()) {
      FocusScope.of(Get.context!).requestFocus(FocusNode());
      update();
      socialLoginCtrl.showLoading();
      try {
        HashMap<String, dynamic> params = HashMap();
        params['username'] = txtName.text.trim();
        params['phone_number'] = txtMobileNo.text.trim();
        params['country_code'] = "+91";
        params['uuid'] = const Uuid().v4();
        dynamic response = await apiCall.postRequestWithNoToken(
            ApiMethodList.userRegister, params);
        socialLoginCtrl.hideLoading();
        showProgressDialog(true);
        if (RegisterNewUserModel.fromJson(response).isSuccess != null &&
            (RegisterNewUserModel.fromJson(response).isSuccess ?? false)) {
          Fluttertoast.showToast(msg: "User Registered Successfully");
          Get.back();
          Get.back();
          // UserSingleton().isGuest = false;
          // UserSingleton().token = await auth.currentUser!.getIdToken(true);
          // await verifyToken(auth, UserSingleton().token);
          UserSingleton().isGuest = false;
          UserSingleton().token =
              RegisterNewUserModel.fromJson(response).data!.access;
          UserSingleton().uuidFcm =
              RegisterNewUserModel.fromJson(response).data!.userData!.uuid;
          await getProfile();
          appCtrl.isHeart = true;
          appCtrl.isCart = true;
          appCtrl.isShare = false;
          appCtrl.isSearch = true;
          appCtrl.isNotification = false;
          appCtrl.storage.write(Session.isGuest, false);
          appCtrl.storage.write(Session.isGuestLoginToken, "");
          appCtrl.storage.write(Session.isLogin, true);
          appCtrl.storage
              .write(Session.isRegularLoginToken, UserSingleton().token);
          appCtrl.storage.write(Session.id, UserSingleton().uuidFcm);
          appCtrl.storage.write(Session.userName, UserSingleton().firstName);
          Get.back();
          Get.toNamed(routeName.dashboard);
        } else {
          showProgressDialog(false);
          Fluttertoast.showToast(msg: "Unable to Register User");
        }
        return response;
      } catch (e) {
        showProgressDialog(false);
        rethrow;
      }
    } else {
      showProgressDialog(false);
      log('No Valid');
    }
  }

  checkMobileExist(String mobileNo) async {
    socialLoginCtrl.showLoading();
    try {
      HashMap<String, dynamic> params = HashMap();
      params['phone_number'] = mobileNo;
      dynamic response = await apiCall.postRequestWithNoToken(
          ApiMethodList.checkMobileNumber, params);
      socialLoginCtrl.hideLoading();
      return CheckMobileModel.fromJson(response).data!.isExists ?? false;
    } catch (e) {
      socialLoginCtrl.hideLoading();
      rethrow;
    }
  }

  sendOTP(String mobileNo) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$mobileNo',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Fluttertoast.showToast(
              msg: ('The provided phone number is not valid.'));
        } else {
          Fluttertoast.showToast(msg: e.message ?? "Something Went Wrong");
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        sendOtp(mobileNo, verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  getProfile() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.userProfile);
      UserProfileModel data = UserProfileModel.fromJson(response);
      UserSingleton().userId = data.data!.id.toString();
      UserSingleton().firstName = data.data!.firstName;
      UserSingleton().displayName = data.data!.firstName;
      UserSingleton().lastName = data.data!.lastName;
      UserSingleton().digitsPhone = data.data!.phoneNumber.toString();
    } catch (e) {
      rethrow;
    }
  }

//sign in tap function
  signInClick({context}) async {
    socialLoginCtrl.showLoading();
    update();
    FocusScopeNode currentFocus = FocusScope.of(Get.context!);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
    try {
      // var user = await auth.createUserWithEmailAndPassword(email: txtMobileNo.text, password: txtPassword.text);
      // await user.user!.getIdToken();
      // socialLoginCtrl.hideLoading();
      // update();
      // txtName.text = "";
      // txtMobileNo.text = "";
      FocusScope.of(Get.context!).requestFocus(FocusNode());
      update();
      Get.back();
    } catch (e) {
      socialLoginCtrl.hideLoading();
      update();
      socialLoginCtrl.showToast(e.toString());
    }
  }

  verifyToken(FirebaseAuth auth, String? firebaseToken) async {
    try {
      dynamic response =
          await ApiServiceCall().getResponse(ApiMethodList.verifyToken);
      showProgressDialog(false);
      if (VerifyTokenModel.fromJson(response).isSuccess != null &&
          VerifyTokenModel.fromJson(response).isSuccess == true) {
        final signUpCtrl = Get.put(SignUpController());
        await signUpCtrl.getProfile();
        appCtrl.isHeart = true;
        appCtrl.isCart = true;
        appCtrl.isShare = false;
        appCtrl.isSearch = true;
        appCtrl.isNotification = false;
        appCtrl.storage.write(Session.isGuest, false);
        appCtrl.storage.write(Session.isGuestLoginToken, "");
        appCtrl.storage.write(Session.isLogin, true);
        appCtrl.storage.write(Session.isRegularLoginToken,
            await auth.currentUser!.getIdToken(true));
        UserSingleton().token = await auth.currentUser!.getIdToken(true);
        Get.back();
        Get.toNamed(routeName.dashboard);
      } else {
        Fluttertoast.showToast(msg: "Something Went Wrong!");
      }
    } catch (e) {
      rethrow;
    }
  }
}
