import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/main.dart';
import 'package:dapperz/models/login/login_model.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../config.dart';

class OtpScreen extends StatelessWidget {
  final otpCtrl = Get.put(OtpController());
  final signUpCtrl = Get.put(SignUpController());
  final String mobileNo;
  final String verificationId;

  OtpScreen({Key? key, required this.mobileNo, required this.verificationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtpController>(builder: (otpCtrl) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Directionality(
          textDirection:
              otpCtrl.appCtrl.isRTL || otpCtrl.appCtrl.languageVal == "ar"
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // body layout
              OtpBody(mobileNo: mobileNo),
              // done button layout
              CustomButton(
                  title: OtpFont().done.toUpperCase(),
                  onTap: () async {
                    String otp = otpCtrl.fieldOTP.text.trim();
                    if (otp.isNotEmpty && otp.length == 6) {
                      showProgressDialog(true);
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: verificationId, smsCode: otp);
                      try {
                        await auth!.signInWithCredential(credential);
                        if (UserSingleton().isRegister ?? false) {
                          signUpCtrl.signRegister(auth!);
                        } else {
                          await login(auth!, UserSingleton().token);
                        }
                      } on FirebaseAuthException catch (e) {
                        showProgressDialog(false);
                        //socialLoginCtrl.hideLoading();
                        //update();
                        if (e.code == 'wrong-password') {
                          Fluttertoast.showToast(msg: 'Incorrect Password');
                        } else if (e.code == 'user-not-found') {
                          Fluttertoast.showToast(msg: 'User not Found');
                        } else if (e.code == 'invalid-verification-code') {
                          Fluttertoast.showToast(
                              msg: 'Please Enter Valid Code');
                        }
                      } catch (e) {
                        //socialLoginCtrl.hideLoading();
                        //update();
                      } finally {
                        // socialLoginCtrl.hideLoading();
                        //update();
                      }
                    } else {
                      Fluttertoast.showToast(msg: "Please Enter a valid OTP");
                    }
                  }),
            ],
          ),
        ),
      );
    });
  }

  login(FirebaseAuth auth, String? firebaseToken) async {
    try {
      HashMap<String, dynamic> params = HashMap();
      params['uuid'] = auth.currentUser!.uid;
      params['phone_number'] = mobileNo;
      params['firebase_token'] = await auth.currentUser!.getIdToken(true);
      params['fcm_token'] = await FirebaseMessaging.instance.getToken();
      dynamic response =
          await ApiServiceCall().postRequest(ApiMethodList.userLogin, params);
      showProgressDialog(false);
      if (LoginModel.fromJson(response).isSuccess != null &&
          LoginModel.fromJson(response).isSuccess == false) {
        Fluttertoast.showToast(msg: "Something Went Wrong!");
      } else {
        UserSingleton().isGuest = false;
        UserSingleton().token = LoginModel.fromJson(response).data!.access;
        UserSingleton().uuidFcm =
            LoginModel.fromJson(response).data!.userData!.uuid;
        await signUpCtrl.getProfile();
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
      }
    } catch (e) {
      rethrow;
    }
  }
}
