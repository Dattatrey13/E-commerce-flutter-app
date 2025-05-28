import 'dart:collection';

import 'package:dapperz/common/array/cart_array.dart';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/user_singleton.dart';

import '../../../config.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final paymentCtrl = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PaymentController>(builder: (_) {
      Size size = MediaQuery.of(context).size;
      return Directionality(
        textDirection:
            paymentCtrl.appCtrl.isRTL || paymentCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          appBar: HomeProductAppBar(
            onTap: () => Get.back(),
            titleChild: CommonAppBarTitle(
              title: PaymentFont().paymentDetails,
              desc: PaymentFont().steps3Of3,
            ),
          ),
          body: paymentCtrl.appCtrl.isShimmer
              ? const CartShimmer()
              : Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // payment method layout
                          LatoFontStyle(
                                  text: CartFont().coupons,
                                  fontSize: FontSizes.f16,
                                  fontWeight: FontWeight.w700)
                              .marginSymmetric(
                                  horizontal: AppScreenUtil().screenWidth(15)),
                          const Space(0, 10),
                          SizedBox(
                            height: AppScreenUtil()
                                .screenHeight(size.longestSide / 20),
                            child: TextFormField(
                              controller: paymentCtrl.txtCouponApplied,
                              decoration: InputDecoration(
                                filled: true,
                                enabled: true,
                                hintText: CartFont().applyCoupons,
                                hintStyle: TextStyle(
                                  fontSize: FontSizes.f16,
                                  color: appCtrl.appTheme.blackColor,
                                  fontWeight: FontWeight.w500,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      AppScreenUtil().borderRadius(5)),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: EdgeInsets.zero,
                                suffixIcon: GestureDetector(
                                  onTap: () async {
                                    if (paymentCtrl.txtCouponApplied.text !=
                                        "") {
                                      showProgressDialog(true);
                                      HashMap<String, dynamic> params =
                                          HashMap();
                                      params['unique_id'] = paymentCtrl
                                          .cartTotalData!.data!.uniqueId;
                                      params['coupon_codes'] = [
                                        UserSingleton().coupons
                                      ];
                                      params['is_buy_now'] =
                                          UserSingleton().isBuyNow;
                                      await paymentCtrl.removeCoupon(
                                          params, "", "", false);
                                      await paymentCtrl.getCartTotal();
                                      showProgressDialog(false);
                                    }
                                  },
                                  child: Icon(Icons.close,
                                      size: AppScreenUtil().size(16),
                                      color: appCtrl.appTheme.blackColor),
                                ),
                                prefixIcon: SvgPicture.asset(svgAssets.discount)
                                    .paddingSymmetric(
                                        horizontal:
                                            AppScreenUtil().screenWidth(10)),
                                fillColor: appCtrl.appTheme.greyLight25
                                    .withOpacity(.6),
                              ),
                            ).marginSymmetric(
                                horizontal: AppScreenUtil().screenWidth(15)),
                          ).marginOnly(
                              bottom: AppScreenUtil().screenHeight(20)),
                          if (paymentCtrl.getAllCouponsModel != null &&
                              paymentCtrl.getAllCouponsModel!.data != null &&
                              paymentCtrl.getAllCouponsModel!.data!.isNotEmpty)
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        AppScreenUtil().screenWidth(10)),
                                height: size.longestSide / 20,
                                child: Row(
                                  children: paymentCtrl
                                      .getAllCouponsModel!.data!
                                      .map((e) {
                                    return GestureDetector(
                                      onTap: () async {
                                        if (UserSingleton().coupons != e.code) {
                                          showProgressDialog(true);
                                          HashMap<String, dynamic> params =
                                              HashMap();
                                          HashMap<String, dynamic> params2 =
                                              HashMap();
                                          params2['coupon_codes'] = [e.code];
                                          params2['unique_id'] = paymentCtrl
                                              .cartTotalData!.data!.uniqueId;
                                          params2['is_buy_now'] =
                                              UserSingleton()
                                                  .isBuyNow;
                                          if (UserSingleton().coupons != null &&
                                              UserSingleton().coupons != "") {
                                            params['unique_id'] = paymentCtrl
                                                .cartTotalData!.data!.uniqueId;
                                            params['coupon_codes'] = [
                                              UserSingleton().coupons
                                            ];
                                            params['is_buy_now'] =
                                                UserSingleton()
                                                    .isBuyNow;
                                            await paymentCtrl.removeCoupon(
                                                params, params2, e, true);
                                          } else {
                                            await paymentCtrl.applyCoupon(
                                                params2, e);
                                          }
                                          await paymentCtrl.getCartTotal();
                                          showProgressDialog(false);
                                        }
                                      },
                                      child: StatusLayout(
                                              title: e.code!.toUpperCase())
                                          .marginOnly(right: 10),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          if (paymentCtrl.getAllCouponsModel != null &&
                              paymentCtrl.getAllCouponsModel!.data != null &&
                              paymentCtrl
                                  .getAllCouponsModel!.data!.isNotEmpty &&
                              UserSingleton().couponsDesc != null &&
                              UserSingleton().couponsDesc != "null" &&
                              UserSingleton().couponsDesc != "")
                            Column(children: [
                              Text(UserSingleton().couponsDesc ?? "")
                            ]).marginOnly(
                                left: AppScreenUtil().screenWidth(15),
                                right: AppScreenUtil().screenWidth(15),
                                top: AppScreenUtil().screenHeight(20)),
                          const Space(0, 30),
                          const BorderLineLayout(),
                          const Space(0, 20),
                          const PaymentMethod(),
                          const Space(0, 30),
                          // cart order detail(price)
                          CartOrderDetailLayout(
                            cartTotal: paymentCtrl.cartTotalData,
                            cartModelList: cartList,
                            isDeliveryShow: false,
                          ),
                          const Space(0, 100)
                        ],
                      ).marginSymmetric(vertical: Insets.i20),
                    ),
                    // view detail and pay now layout
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: CartBottomLayout(
                          desc: CartFont().viewDetail,
                          buttonName: paymentCtrl.selectRadio == 0
                              ? "Place Order"
                              : PaymentFont().payNow,
                          totalAmount: double.parse(
                                  (paymentCtrl.cartTotalData?.data!.total ??
                                          0.0)
                                      .toString())
                              .toStringAsFixed(2),
                          onTap: () async {
                            showProgressDialog(true);
                            if (paymentCtrl.selectRadio == 0) {
                              await paymentCtrl.payNow();
                            } else if (paymentCtrl.selectRadio == 1) {
                              await paymentCtrl.payNowOnline();
                            }
                          }),
                    )
                  ],
                ),
        ),
      );
    });
  }

  @override
  void dispose() {
    Get.delete<PaymentController>();
    super.dispose();
  }
}
