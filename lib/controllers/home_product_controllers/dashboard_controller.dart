import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/controllers/home_product_controllers/drawer_controller.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:get_storage/get_storage.dart';

import '../../config.dart';

class DashboardController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  final homeCtrl = Get.put(HomeController());
  AnimationController? drawerSlideController;

  final drawerCtrl = Get.isRegistered<DrawerPageController>()
      ? Get.find<DrawerPageController>()
      : Get.put(DrawerPageController());

  List drawerList = [];
  final storage = GetStorage();

  @override
  void onReady() async {
    appCtrl.isShimmer = true;
    appCtrl.update();
    drawerList = UserSingleton().isGuest ?? false
        ? AppArray().guestDrawerList
        : AppArray().drawerList;
    update();
    appCtrl.isShimmer = false;
    appCtrl.update();
    Get.forceAppUpdate();
    super.onReady();
  }

  //bottom change
  bottomNavigationChange(val, context) async {
    appCtrl.selectedIndex = val;
    appCtrl.isLoading = true;
    appCtrl.isShimmer = true;
    appCtrl.isShare = false;
    appCtrl.isNotification = false;
    appCtrl.update();
    await storage.write(Session.selectedIndex, val);
    appCtrl.rightValue = MediaQuery.of(context).size.width;
    if (appCtrl.selectedIndex == 0 || appCtrl.selectedIndex == 1) {
      appCtrl.isHeart = true;
      appCtrl.isCart = true;
      appCtrl.isSearch = true;
    } else if (appCtrl.selectedIndex == 2) {
      appCtrl.isHeart = true;
      appCtrl.isCart = false;
      appCtrl.isSearch = false;
    } else if (appCtrl.selectedIndex == 3) {
      appCtrl.isHeart = false;
      appCtrl.isCart = true;
      appCtrl.isSearch = false;
    } else if (appCtrl.selectedIndex == 4) {
      appCtrl.isHeart = false;
      appCtrl.isCart = false;
      appCtrl.isSearch = false;
    }
    appCtrl.isLoading = false;
    update();
    if (appCtrl.selectedIndex != 4) {
      await Future.delayed(DurationsClass.s1);
    }
    appCtrl.isShimmer = false;
    appCtrl.update();
    update();
    Get.forceAppUpdate();

    if (appCtrl.selectedIndex == 0) {
      await homeCtrl.getData();
    }
  }

  //app bar leading action
  appBarLeadingAction() async {
    if (appCtrl.selectedIndex == 3 || appCtrl.selectedIndex == 2) {
      homeCtrl.getData();
    }
    appCtrl.goToHome();
    await storage.write(Session.selectedIndex, 0);
    appCtrl.selectedIndex = 0;
    update();
  }
}
