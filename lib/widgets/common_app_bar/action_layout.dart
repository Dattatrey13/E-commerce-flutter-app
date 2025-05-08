import 'package:dapperz/user_singleton.dart';

import '../../config.dart';

class AppBarActionLayout extends StatelessWidget {
  const AppBarActionLayout({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        children: [
          if (appCtrl.isShare)
            const ShareIcon()
                .paddingSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          if (appCtrl.isSearch)
            const SearchIcon().paddingSymmetric(
              horizontal: AppScreenUtil().screenWidth(appCtrl.isSearch
                  ? appCtrl.isNotification
                      ? 0
                      : 10
                  : 10),
            ),
          if (appCtrl.isHeart)
            Stack(
              children: [
                HeartIcon(
                  color: appCtrl.appTheme.blackColor,
                ).gestures(onTap: () async {
                  appCtrl.isShimmer = true;
                  appCtrl.selectedIndex = 3;
                  appCtrl.isHeart = false;
                  appCtrl.isCart = true;
                  appCtrl.isShare = false;
                  appCtrl.isSearch = false;
                  appCtrl.isNotification = false;
                  appCtrl.update();
                  Get.toNamed(routeName.dashboard);
                  await Future.delayed(DurationsClass.s1);
                  appCtrl.isShimmer = false;
                  Get.forceAppUpdate();
                }).paddingSymmetric(
                  horizontal: AppScreenUtil().screenWidth(15),
                  vertical: AppScreenUtil().screenHeight(15),
                ),
                if (UserSingleton().wishListCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(210, 239, 154, 1.0),
                          borderRadius: BorderRadius.circular(25)),
                      constraints:
                          const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text(
                        UserSingleton().wishListCount.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
          if (appCtrl.isCart)
            Stack(
              children: [
                const BuyIcon().paddingSymmetric(
                    horizontal: AppScreenUtil().screenWidth(15),
                    vertical: AppScreenUtil().screenHeight(15)),
                if (UserSingleton().cartCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(210, 239, 154, 1.0),
                          borderRadius: BorderRadius.circular(25)),
                      constraints:
                          const BoxConstraints(minWidth: 20, minHeight: 20),
                      child: Text(
                        UserSingleton().cartCount.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
        ],
      );
    });
  }
}
