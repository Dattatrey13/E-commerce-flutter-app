import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/models/login/verify_token_model.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  bool isTapped = false;
  final storage = GetStorage();

  @override
  void onInit() async {
    await Future.delayed(DurationsClass.s1);
    isTapped = true;
    update();
    await Future.delayed(DurationsClass.s1);
    checkLogin();
    super.onInit();
  }

  void checkLogin() async {
    //#region set Language
    String? languageCode = storage.read(Session.languageCode);
    String? countryCode = storage.read(Session.countryCode);
    bool? isLogin = storage.read(Session.isLogin) ?? false;
    bool? isGuest = storage.read(Session.isGuest) ?? false;
    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }
    //#endregion

    if (isLogin || isGuest) {
      if (isGuest) {
        String? guestToken = storage.read(Session.isGuestLoginToken);
        UserSingleton().isGuest = true;
        UserSingleton().uuidForGuest = guestToken;
        UserSingleton().selectedLocation = storage.read(Session.locationName);
        Get.toNamed(routeName.dashboard);
      } else if (isLogin) {
        String? regularToken = storage.read(Session.isRegularLoginToken);
        UserSingleton().isGuest = false;
        UserSingleton().token = regularToken;
        UserSingleton().selectedLocation = storage.read(Session.locationName);
        await verifyToken(regularToken);
      }
    } else {
      Get.toNamed(routeName.login);
    }
    // }
  }

  verifyToken(String? regularToken) async {
    try {
      dynamic response =
          await ApiServiceCall().getResponse(ApiMethodList.verifyToken);
      if (VerifyTokenModel.fromJson(response).isSuccess != null &&
          VerifyTokenModel.fromJson(response).isSuccess == false) {
        UserSingleton().isGuest = false;
        UserSingleton().token = '';
        Get.toNamed(routeName.login);
      } else {
        await SignUpController().getProfile();
        appCtrl.goToHome();
        Get.toNamed(routeName.dashboard);
      }
    } catch (e) {
      rethrow;
    }
  }
}
