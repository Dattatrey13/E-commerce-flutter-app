import 'dart:developer';

import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/api_method_list.dart';
import '../../models/login/register_new_user_model.dart';

class SignUpController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final socialLoginCtrl = Get.isRegistered<SocialLoginController>()
      ? Get.find<SocialLoginController>()
      : Get.put(SocialLoginController());

  final TextEditingController txtName = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final BaseApi apiCall = ApiServiceCall();

  bool passwordVisible = false;

  void toggle() {
    passwordVisible = !passwordVisible;
    update(); // Notifies GetBuilder widgets to rebuild
  }

  Future<void> signRegister() async {
    if (signupFormKey.currentState!.validate()) {
      FocusScope.of(Get.context!).unfocus();
      update();
      socialLoginCtrl.showLoading();

      try {
        // Step 1: Firebase account creation
        final credential = await auth.createUserWithEmailAndPassword(
          email: txtEmail.text.trim(),
          password: txtPassword.text.trim(),
        );

        await credential.user?.updateDisplayName(txtName.text.trim());
        await credential.user?.reload();

              print("signUp_controller: $credential");


        final user = credential.user;
        if (user == null) throw Exception("Firebase user creation failed");

        final firebaseToken = await user.getIdToken();

        // Step 2: Call your backend to register the user
        final params = {
          "firebase_token": firebaseToken,
          "first_name": txtName.text.trim(),
          "email": txtEmail.text.trim(),
          "password": txtPassword.text.trim(),
        };

        print("signup_controller: $firebaseToken");

        final response = await apiCall.postRequest(ApiMethodList.userRegister, params);
        final loginModel = RegisterNewUserModel.fromJson(response);

        print("Sign_controller: $response");

        if (loginModel.isSuccess == true) {

          // Store in UserSingleton
          UserSingleton().isGuest = false;
          UserSingleton().token = loginModel.data!.access;
          UserSingleton().uuidFcm = loginModel.data!.userData!.uuid;
          UserSingleton().firstName = loginModel.data!.userData!.firstName ?? "";

          // Save session
          appCtrl.storage.write(Session.isGuest, false);
          appCtrl.storage.write(Session.isLogin, true);
          appCtrl.storage.write(Session.isGuestLoginToken, "");
          appCtrl.storage.write(Session.isRegularLoginToken, UserSingleton().token);
          appCtrl.storage.write(Session.id, UserSingleton().uuidFcm);
          appCtrl.storage.write(Session.userName, UserSingleton().firstName);appCtrl.storage.write(Session.password, txtPassword.text.trim());

          // App state flags
          appCtrl.isHeart = true;
          appCtrl.isCart = true;
          appCtrl.isShare = false;
          appCtrl.isSearch = true;
          appCtrl.isNotification = false;

          Fluttertoast.showToast(msg: "User Registered Successfully");
          Get.toNamed(routeName.dashboard);
        } else {
          Fluttertoast.showToast(msg: "Backend registration failed");
        }
      } on FirebaseAuthException catch (e) {
        Fluttertoast.showToast(msg: e.message ?? "Registration failed");
      } catch (e) {
        log("Sign up error: $e");
        Fluttertoast.showToast(msg: "Something went wrong");
      } finally {
        socialLoginCtrl.hideLoading();
        update();
      }
    } else {
      log('Form not valid');
    }
  }


  Future<void> signInClick() async {
    socialLoginCtrl.showLoading();
    try {
      await auth.signInWithEmailAndPassword(
        email: txtEmail.text.trim(),
        password: txtPassword.text.trim(),
      );
      socialLoginCtrl.hideLoading();
      Fluttertoast.showToast(msg: "Login Successful");
      Get.toNamed(routeName.dashboard);
    } on FirebaseAuthException catch (e) {
      socialLoginCtrl.hideLoading();
      Fluttertoast.showToast(msg: e.message ?? "Login failed");
    }
  }

  Future<void> getProfile() async {
    // Example: fetch and store profile from Firebase
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      UserSingleton().firstName = user.displayName ?? "";
      UserSingleton().uuidFcm = user.uid;
      UserSingleton().token = await user.getIdToken();
    }
  }


  @override
  void onClose() {
    txtName.dispose();
    txtEmail.dispose();
    txtPassword.dispose();
    nameFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.onClose();
  }
}


