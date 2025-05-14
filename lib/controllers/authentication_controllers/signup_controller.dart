import 'dart:developer';

import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  /// ✅ Add this boolean field for password visibility
  bool passwordVisible = false;

  /// ✅ Add this method to toggle password visibility
  void toggle() {
    passwordVisible = !passwordVisible;
    update(); // Notifies GetBuilder widgets to rebuild
  }

  /// Register a new user with email & password
  Future<void> signRegister() async {
    if (signupFormKey.currentState!.validate()) {
      FocusScope.of(Get.context!).unfocus();
      update();
      socialLoginCtrl.showLoading();
      try {
        final credential = await auth.createUserWithEmailAndPassword(
          email: txtEmail.text.trim(),
          password: txtPassword.text.trim(),
        );

        await credential.user?.updateDisplayName(txtName.text.trim());
        await credential.user?.reload();

        UserSingleton().isGuest = false;
        UserSingleton().token = await credential.user?.getIdToken() ?? "";
        UserSingleton().firstName = txtName.text.trim();
        UserSingleton().uuidFcm = credential.user?.uid ?? "";

        // Update app state
        appCtrl.isHeart = true;
        appCtrl.isCart = true;
        appCtrl.isShare = false;
        appCtrl.isSearch = true;
        appCtrl.isNotification = false;

        appCtrl.storage.write(Session.isGuest, false);
        appCtrl.storage.write(Session.isLogin, true);
        appCtrl.storage.write(Session.isGuestLoginToken, "");
        appCtrl.storage.write(Session.isRegularLoginToken, UserSingleton().token);
        appCtrl.storage.write(Session.id, UserSingleton().uuidFcm);
        appCtrl.storage.write(Session.userName, UserSingleton().firstName);

        socialLoginCtrl.hideLoading();
        Fluttertoast.showToast(msg: "User Registered Successfully");
        Get.toNamed(routeName.dashboard);
      } on FirebaseAuthException catch (e) {
        socialLoginCtrl.hideLoading();
        Fluttertoast.showToast(msg: e.message ?? "Registration failed");
      } catch (e) {
        socialLoginCtrl.hideLoading();
        log(e.toString());
        Fluttertoast.showToast(msg: "Something went wrong");
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


