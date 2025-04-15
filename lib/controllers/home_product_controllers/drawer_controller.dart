import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/main.dart';
import 'package:dapperz/views/chat/chat_screen.dart';
import 'package:get_storage/get_storage.dart';

class DrawerPageController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final storage = GetStorage();
  final pageCtrl = Get.isRegistered<PageListController>()
      ? Get.find<PageListController>()
      : Get.put(PageListController());

  // language bottom sheet
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

  // go to page index wise
  goToPage(index) async {
    // if (index == 1) {
    //   Get.back();
    //   Get.toNamed(routeName.allBrands);
    // } else
    if (index == 1) {
      Get.back();
      Get.toNamed(routeName.orderHistory);
    } else if (index == 2) {
      Get.back();
      DashboardController dashboardController = Get.find();
      appCtrl.isCart = true;
      appCtrl.isHeart = false;
      dashboardController.bottomNavigationChange(3, Get.context);
      await storage.write(Session.selectedIndex, index);
      appCtrl.update();
    } else if (index == 3) {
      Get.back();
      DashboardController dashboardController = Get.find();
      appCtrl.isCart = false;
      appCtrl.isHeart = false;
      dashboardController.bottomNavigationChange(4, Get.context);
      await storage.write(Session.selectedIndex, index);
      appCtrl.update();
    } else if (index == 4) {
      Get.back();
      Get.toNamed(routeName.buildYourHome);
    } else if (index == 5) {
      Get.back();
      Get.toNamed(routeName.guide);
    } else if (index == 6) {
      Get.back();
      Get.toNamed(routeName.getQuote);
    } else if (index == 7) {
      Get.toNamed(routeName.quoteList);
    } else if (index == 8) {
      Get.toNamed(routeName.vendor);
    } else if (index == 9) {
      Get.back();
      appCtrl.selectedIndex = 0;
      appCtrl.storage.erase();
      Get.forceAppUpdate();
      navigatorKey.currentState!.push(MaterialPageRoute(
          builder: (BuildContext context) =>
              const ChatScreen(id: "2", name: "Civilis Smart Support")));
    } else if (index == 10) {
      Get.back();
      Get.toNamed(routeName.contactUs);
    } else if (index == 11) {
      Get.back();
      appCtrl.selectedIndex = 0;
      appCtrl.storage.erase();
      Get.forceAppUpdate();
      Get.offAllNamed(routeName.login);
    }
    update();
  }

  goToGuestPage(index) async {
    Get.back();
    // if (index == 1) {
    //   Get.toNamed(routeName.allBrands);
    // } else

    if (index == 1) {
      DashboardController dashboardController = Get.find();
      appCtrl.isCart = true;
      appCtrl.isHeart = false;
      dashboardController.bottomNavigationChange(3, Get.context);
      await storage.write(Session.selectedIndex, index);
      appCtrl.update();
    } else if (index == 2) {
      Get.toNamed(routeName.buildYourHome);
    } else if (index == 3) {
      Get.toNamed(routeName.guide);
    } else if (index == 4) {
      Get.toNamed(routeName.getQuote);
    } else if (index == 5) {
      Get.toNamed(routeName.contactUs);
    } else if (index == 6) {
      appCtrl.selectedIndex = 0;
      appCtrl.storage.erase();
      Get.forceAppUpdate();
      Get.offAllNamed(routeName.login);
    }
    update();
  }
}
