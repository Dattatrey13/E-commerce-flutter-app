// import 'dart:collection';
//
// import 'package:dapperz/api/api_method_list.dart';
// import 'package:dapperz/api/api_service_call.dart';
// import 'package:dapperz/api/base_api_call.dart';
// import 'package:dapperz/config.dart';
// import 'package:dapperz/dependency_injection.dart';
// import 'package:dapperz/main.dart';
// import 'package:dapperz/models/login/check_mobile_model.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get_storage/get_storage.dart';
//
// class LoginController extends GetxController {
//   final appCtrl = Get.isRegistered<AppController>()
//       ? Get.find<AppController>()
//       : Get.put(AppController());
//
//   final socialLoginCtrl = Get.isRegistered<SocialLoginController>()
//       ? Get.find<SocialLoginController>()
//       : Get.put(SocialLoginController());
//
//   // TextEditingController txtMobile = TextEditingController();
//   TextEditingController txtEmail = TextEditingController();
//   TextEditingController txtPassword = TextEditingController();
//
//   bool isBack = false;
//
//   // final FocusNode mobileFocus = FocusNode();
//   final FocusNode emailFocus = FocusNode();
//   final FocusNode passwordFocus = FocusNode();
//
//   bool passwordVisible = true;
//   final storage = GetStorage();
//   BaseApi apiCall = ApiServiceCall();
//
//   // Toggle Between Password show
//   toggle() {
//     passwordVisible = !passwordVisible;
//     update();
//   }
//
//   // firebase login with email and password
//   login() async {
//     if (txtEmail.text.isEmpty || txtPassword.text.isEmpty) {
//       socialLoginCtrl.showToast('Email and Password are required');
//       return;
//     }
//
//     socialLoginCtrl.showLoading();
//     update();
//
//     try {
//       // Prepare API parameters
//       HashMap<String, dynamic> params = HashMap();
//       params['email'] = txtEmail.text.trim();
//       params['password'] = txtPassword.text.trim();
//
//       // Make API call
//       dynamic response = await apiCall.postRequest(ApiMethodList.userLogin, params);
//
//       // Parse API response
//       final loginModel = LoginModel.fromJson(response);
//
//       if (loginModel.isSuccess != null && loginModel.isSuccess == true) {
//         // Store token and user data
//         UserSingleton().isGuest = false;
//         UserSingleton().token = loginModel.data!.access;
//         UserSingleton().uuidFcm = loginModel.data!.userData!.uuid;
//
//         // Save in local storage
//         appCtrl.storage.write(Session.isGuest, false);
//         appCtrl.storage.write(Session.isGuestLoginToken, "");
//         appCtrl.storage.write(Session.isLogin, true);
//         appCtrl.storage.write(Session.isRegularLoginToken, UserSingleton().token);
//         appCtrl.storage.write(Session.id, UserSingleton().uuidFcm);
//         appCtrl.storage.write(Session.userName, UserSingleton().firstName);
//
//         // Navigate to dashboard
//         Get.offAllNamed(routeName.dashboard);
//       } else {
//         socialLoginCtrl.showToast("Login failed. Please check credentials.");
//       }
//     } catch (e) {
//       socialLoginCtrl.showToast('An error occurred. Please try again.');
//     } finally {
//       socialLoginCtrl.hideLoading();
//       update();
//     }
//   }
//
//
//   checkMobileExist(String mobileNo) async {
//     socialLoginCtrl.showLoading();
//     try {
//       HashMap<String, dynamic> params = HashMap();
//       params['phone_number'] = mobileNo;
//       dynamic response =
//           await apiCall.postRequest(ApiMethodList.checkMobileNumber, params);
//       socialLoginCtrl.hideLoading();
//       return CheckMobileModel.fromJson(response).data!.isExists ?? false;
//     } catch (e) {
//       socialLoginCtrl.hideLoading();
//       rethrow;
//     }
//   }
//
//   sendOTP(String mobileNo) async {
//     socialLoginCtrl.showLoading();
//     await auth!.verifyPhoneNumber(
//       phoneNumber: '+91$mobileNo',
//       verificationCompleted: (PhoneAuthCredential credential) {},
//       verificationFailed: (FirebaseAuthException e) {
//         socialLoginCtrl.hideLoading();
//         if (e.code == 'invalid-phone-number') {
//           Fluttertoast.showToast(
//               msg: ('The provided phone number is not valid.'));
//         } else {
//           Fluttertoast.showToast(msg: e.message ?? "Something Went Wrong");
//         }
//       },
//       codeSent: (String verificationId, int? resendToken) async {
//         socialLoginCtrl.hideLoading();
//         sendOtp(mobileNo, verificationId);
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         socialLoginCtrl.hideLoading();
//       },
//     );
//   }
//
//   @override
//   void onReady() {
//     isBack = Get.arguments ?? false;
//     update();
//     DependencyInjection.init();
//     super.onReady();
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/dependency_injection.dart';
import 'package:dapperz/main.dart';

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

  // Firebase login with email & password
  Future<void> login() async {
    socialLoginCtrl.showLoading();
    update();

    try {
      final userCredential = await auth?.signInWithEmailAndPassword(
        email: txtEmail.text.trim(),
        password: txtPassword.text.trim(),
      );

      final user = userCredential?.user;
      if (user != null) {
        await user.getIdToken();
        await storage.write('id', user.uid);

        txtEmail.clear();
        txtPassword.clear();

        socialLoginCtrl.saveData(user.uid);
        Get.toNamed(routeName.dashboard);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        socialLoginCtrl.showToast('Incorrect Password');
      } else if (e.code == 'user-not-found') {
        socialLoginCtrl.showToast('Email not found');
      } else {
        socialLoginCtrl.showToast(e.message ?? 'Login failed');
      }
    } catch (e) {
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

