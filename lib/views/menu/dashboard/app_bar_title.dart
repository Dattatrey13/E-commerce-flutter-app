import 'package:dapperz/controllers/home_product_controllers/wishlist_controller.dart';

import '../../../config.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wishListCtrl = Get.put(WishlistController());
    return GetBuilder<AppController>(builder: (appCtrl) {
      return appCtrl.selectedIndex == 1 ||
              appCtrl.selectedIndex == 3 ||
              appCtrl.selectedIndex == 4
          ? LatoFontStyle(
              text: appCtrl.selectedIndex == 1
                  ? DashboardFont().categories
                  : appCtrl.selectedIndex == 3
                      ? wishListCtrl.wishlist.isNotEmpty
                          ? "${DashboardFont().shoppingCart} (${wishListCtrl.wishlist.length})"
                          : DashboardFont().shoppingCart
                      : DashboardFont().profile,
              color: appCtrl.appTheme.blackColor,
              fontWeight: FontWeight.w700,
              fontSize: FontSizes.f16,
            )
          : CommonAppBarTitle(
              title: DashboardFont().myCart,
              desc: DashboardFont().steps,
            );
    });
  }
}
