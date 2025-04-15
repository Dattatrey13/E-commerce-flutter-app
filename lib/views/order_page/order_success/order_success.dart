import 'dart:collection';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';

class OrderSuccess extends StatefulWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  State<OrderSuccess> createState() => _OrderSuccessState();
}

class _OrderSuccessState extends State<OrderSuccess> {
  final orderSuccessCtrl = Get.put(OrderSuccessController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderSuccessController>(builder: (orderSucCtrl) {
      return Directionality(
        textDirection: orderSuccessCtrl.appCtrl.isRTL ||
                orderSuccessCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: PopScope(
          canPop: false,
          child: Scaffold(
            appBar: AppBar(
                centerTitle: false,
                elevation: 0,
                automaticallyImplyLeading: false,
                // leading: const BackArrowButton(),
                backgroundColor: orderSuccessCtrl.appCtrl.appTheme.whiteColor,
                title: Text(OrderSuccessFont().orderPlaced)),
            body: orderSucCtrl.isLoading
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            //check gif layout
                            Image.asset(gifAssets.checkCircle),
                            const Space(0, 20),
                            //order success text layout
                            LatoFontStyle(
                              text: OrderSuccessFont().orderSuccess,
                              fontSize: FontSizes.f22,
                              color: orderSuccessCtrl.appCtrl.appTheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                            const Space(0, 20),
                            //order desc layout
                            LatoFontStyle(
                              text: OrderSuccessFont().orderDesc,
                              fontSize: FontSizes.f16,
                              color:
                                  orderSuccessCtrl.appCtrl.appTheme.blackColor,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.center,
                            ).paddingSymmetric(
                                horizontal: AppScreenUtil().screenWidth(15)),
                            const Space(0, 30),

                            //order success detail layout
                            OrderSuccessDetail(
                              orderId: orderSucCtrl.status!.data!.id != null
                                  ? orderSucCtrl.status!.data!.id!.toString()
                                  : "",
                              orderMode: orderSucCtrl
                                  .status!.data!.paymentMethodTitle
                                  .toString(),
                              address1: orderSucCtrl.address1 ?? "",
                              address2: orderSucCtrl.address2 ?? "",
                            ),
                            // TextButton(
                            //   onPressed: () async {
                            //     String url =
                            //         "https://www.dapperz.in/add-invoice/${orderSucCtrl.status!.data!.id!.toString()}?token=${UserSingleton().token}";
                            //     launchURL(Uri.parse(url));
                            //   },
                            //   child: Row(
                            //     crossAxisAlignment: CrossAxisAlignment.center,
                            //     mainAxisAlignment: MainAxisAlignment.end,
                            //     children: [
                            //       LatoFontStyle(
                            //         text: "Download Invoice",
                            //         fontWeight: FontWeight.w600,
                            //         fontSize: FontSizes.f14,
                            //         color: appCtrl.appTheme.blackColor,
                            //       ),
                            //       const SizedBox(width: 10),
                            //       const Icon(Icons.download, color: Colors.black),
                            //     ],
                            //   ),
                            // ).padding(right: 10),
                            const Space(0, 10),
                            const BorderLineLayout(),

                            //order summary layout
                            const OrderSummary(),
                            const Space(0, 30)
                          ],
                        ).width(MediaQuery.of(context).size.width),
                      ),
                      BottomLayout(
                        firstButtonText: OrderSuccessFont().trackOrder,
                        firstTap: () {
                          Get.delete<ProductDetailController>();
                          Get.delete<CartController>();
                          Get.delete<DeliveryDetailController>();
                          Get.delete<PaymentController>();
                          appCtrl.update();
                          Get.forceAppUpdate();
                          // Get.toNamed(routeName.orderDetail, arguments: orderSucCtrl.status!.data!.id!.toString());
                          HashMap<String, dynamic> Nparams = HashMap();
                          Nparams['id'] =
                              orderSucCtrl.status!.data!.id!.toString();
                          Nparams['is_cancelable'] = true;
                          Get.toNamed(routeName.orderDetail,
                              arguments: Nparams, preventDuplicates: false);
                        },
                        secondTap: () {
                          appCtrl.isHeart = true;
                          appCtrl.isCart = true;
                          appCtrl.isShare = false;
                          appCtrl.isSearch = true;
                          appCtrl.isNotification = false;
                          appCtrl.selectedIndex = 0;
                          UserSingleton().cartCount = 0;
                          Get.delete<ProductDetailController>();
                          Get.delete<CartController>();
                          Get.delete<DeliveryDetailController>();
                          Get.delete<PaymentController>();
                          appCtrl.update();
                          Get.forceAppUpdate();
                          Get.offAndToNamed(routeName.dashboard);
                        },
                        secondButtonText: OrderSuccessFont().continueShopping,
                      )
                    ],
                  ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    Get.delete<OrderSuccessController>();
    super.dispose();
  }
}
