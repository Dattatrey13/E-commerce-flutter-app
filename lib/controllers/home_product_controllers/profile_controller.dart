import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common/array/profile_list.dart';
import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/models/user/update_profile_model.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

import '../../config.dart';

class ProfileController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  var auth = FirebaseAuth.instance;
  final storage = GetStorage();
  CartModel? cartModelList;
  List<ProfileModel> drawerList = [];
  String genderSelectedValue = "Male";

  var gender = ["Male", "Female", "Other"];

  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtMobileNoName = TextEditingController();
  TextEditingController txtReason = TextEditingController();

  TextEditingController txtDob = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  final FocusNode firstNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode mobileNoFocus = FocusNode();

  final FocusNode dobFocus = FocusNode();
  final FocusNode mobileNumberFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  BaseApi apiCall = ApiServiceCall();

  @override
  void onReady() {
    txtFirstName.text = UserSingleton().firstName ?? "";
    txtLastName.text = UserSingleton().lastName ?? "";
    txtMobileNoName.text = UserSingleton().digitsPhone ?? "";
    drawerList =
        UserSingleton().isGuest ?? false ? guestProfileList : profileList;
    update();
    super.onReady();
  }

  //language bottom sheet
  bottomSheet(isLanguage) {
    Get.bottomSheet(
      BottomSheetLayout(
          child: isLanguage ? LanguageBottomSheet() : Container()),
      backgroundColor: appCtrl.appTheme.whiteColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(AppScreenUtil().borderRadius(15)),
            topLeft: Radius.circular(AppScreenUtil().borderRadius(15))),
      ),
    );
  }

//go to page index wise
  goToPage(index) async {
    appCtrl.isShimmer = true;
    appCtrl.update();
    if (index == 0) {
      Get.toNamed(routeName.orderHistory);
    } else if (index == 1) {
      DashboardController dashboardController = Get.find();
      appCtrl.isCart = true;
      dashboardController.bottomNavigationChange(3, Get.context);
      await storage.write(Session.selectedIndex, index);
      appCtrl.update();
    } else if (index == 2) {
      Get.toNamed(routeName.saveAddress);
    } else if (index == 3) {
      Get.toNamed(routeName.profileSetting);
    } else if (index == 4) {
      Get.toNamed(routeName.termsCondition);
    } else if (index == 5) {
      Get.toNamed(routeName.help);
    } else if (index == 6) {
      Get.toNamed(routeName.privacyPolicy);
    } else if (index == 7) {
      Get.toNamed(routeName.refundAndReturnsPolicy);
    } else if (index == 8) {
      Get.toNamed(routeName.shippingPolicy);
    } else if (index == 9) {
      Get.toNamed(routeName.aboutUs);
    }
    update();
    await Future.delayed(DurationsClass.s1);
    appCtrl.isShimmer = false;
    appCtrl.update();
    Get.forceAppUpdate();
  }

  goToPageGuest(index) async {
    appCtrl.isShimmer = true;
    appCtrl.update();
    if (index == 0) {
      DashboardController dashboardController = Get.find();
      appCtrl.isCart = true;
      dashboardController.bottomNavigationChange(3, Get.context);

      await storage.write(Session.selectedIndex, index);
      appCtrl.update();
    } else if (index == 1) {
      Get.toNamed(routeName.termsCondition);
    } else if (index == 2) {
      Get.toNamed(routeName.help);
    } else if (index == 3) {
      Get.toNamed(routeName.privacyPolicy);
    } else if (index == 4) {
      Get.toNamed(routeName.refundAndReturnsPolicy);
    } else if (index == 5) {
      Get.toNamed(routeName.shippingPolicy);
    } else if (index == 6) {
      Get.toNamed(routeName.aboutUs);
    }
    update();
    await Future.delayed(DurationsClass.s1);
    appCtrl.isShimmer = false;
    appCtrl.update();
    Get.forceAppUpdate();
  }

  Future<bool?> saveUserDetails() async {
    try {
      HashMap<String, dynamic> params = HashMap();
      params['first_name'] = txtFirstName.text.trim();
      params['last_name'] = txtLastName.text.trim();
      dynamic response =
          await apiCall.patchRequest(ApiMethodList.userProfileSave, params);
      return UpdateProfileModel.fromJson(response).isSuccess ?? false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> deleteUser() async {
    try {
      showProgressDialog(true);
      HashMap<String, dynamic> params = HashMap();
      params['reason'] = txtReason.text.trim();
      dynamic response =
          await apiCall.postRequest(ApiMethodList.deleteAccount, params);
      bool? status = UpdateProfileModel.fromJson(response).isSuccess ?? false;
      if (status) {
        showProgressDialog(false);
        appCtrl.selectedIndex = 0;
        appCtrl.storage.erase();
        Get.forceAppUpdate();
        UserSingleton().token = null;
        UserSingleton().selectedLocation = null;
        UserSingleton().resetAll();
        Get.offAllNamed(routeName.login);
      } else {
        Fluttertoast.showToast(msg: "Something Went Wrong!");
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
