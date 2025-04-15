import 'package:dapperz/common_methods.dart';
import 'package:dapperz/controllers/home_product_controllers/wishlist_controller.dart';
import 'package:dapperz/user_singleton.dart';

import '../../../config.dart';
import '../../../widgets/infinite_widgets/progress_indicator.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartCtrl = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (cartCtrl) {
        return Directionality(
          textDirection:
              cartCtrl.appCtrl.isRTL || cartCtrl.appCtrl.languageVal == "ar"
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          child: Scaffold(
            body: RefreshIndicator(
              displacement: 100,
              backgroundColor: Colors.white,
              color: appCtrl.appTheme.primary,
              strokeWidth: 3,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: () async {
                await cartCtrl.getData();
              },
              child: cartCtrl.appCtrl.isShimmer
                  ? const CartShimmer()
                  : cartCtrl.isLoading!
                      ? Center(child: ProgressIndicatorWidget())
                      : WillPopScope(
                          onWillPop: () async {
                            appCtrl.isHeart = true;
                            appCtrl.isCart = true;
                            appCtrl.isShare = false;
                            appCtrl.isSearch = true;
                            appCtrl.isNotification = false;
                            appCtrl.selectedIndex = 0;
                            appCtrl.update();
                            Get.forceAppUpdate();
                            return true;
                          },
                          child: cartCtrl.cartModelList != null &&
                                  cartCtrl.cartModelList!.data!.isNotEmpty
                              ? Stack(
                                  children: [
                                    const SingleChildScrollView(
                                            child: CartBody())
                                        .marginOnly(
                                            bottom: AppScreenUtil()
                                                .screenHeight(80)),
                                    if (cartCtrl.cartTotalData != null)
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: CartBottomLayout(
                                          buttonName: UserSingleton().isGuest!
                                              ? "LOGIN"
                                              : CartFont().placeOrder,
                                          totalAmount: double.parse((cartCtrl
                                                          .cartTotalData!
                                                          .data!
                                                          .total ??
                                                      0.0)
                                                  .toString())
                                              .toStringAsFixed(2),
                                          onTap: cartCtrl.isPriceLoading!
                                              ? null
                                              : () {
                                                  if (UserSingleton().isGuest ??
                                                      false) {
                                                    Get.forceAppUpdate();
                                                    Get.offAllNamed(
                                                        routeName.login);
                                                  } else {
                                                    UserSingleton().isBuyNow =
                                                        false;
                                                    cartCtrl.appCtrl.isHeart =
                                                        false;
                                                    cartCtrl.update();
                                                    Get.toNamed(
                                                        routeName
                                                            .deliveryDetail,
                                                        arguments: (cartCtrl
                                                                    .cartTotalData!
                                                                    .data!
                                                                    .total ??
                                                                0.0)
                                                            .toString());
                                                  }
                                                },
                                        ),
                                      )
                                  ],
                                )
                              : const EmptyCart(),
                        ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    Get.delete<WishlistController>();
    Get.delete<CartController>();
    super.dispose();
  }
}
