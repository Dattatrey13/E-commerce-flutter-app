import 'package:dapperz/config.dart';
import 'package:dapperz/models/cart/cart_list_model.dart';
import 'package:dapperz/models/order/get_cart_total.dart';
import 'package:dapperz/user_singleton.dart';

class CartOrderDetailLayout extends StatelessWidget {
  final GetCartTotal? cartTotal;
  final CartListModel? cartModelList;
  final bool isDeliveryShow, isApplyText;

  const CartOrderDetailLayout(
      {Key? key,
      this.isDeliveryShow = true,
      this.cartModelList,
      this.cartTotal,
      this.isApplyText = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return cartModelList!.data != null
          ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ...cartModelList!.data!.map(
                (e) {
                  String val;
                  if ((e.slug!.productTitle == "Bag savings" ||
                      e.slug!.productTitle == "बैग बचत")) {
                    val = "-${appCtrl.priceSymbol}${(e.lineTotal)}";
                  }
                  // else if ((e.value == "Apply Coupon" || e.value == "कूपन लागू करें")) {
                  //   val = e.value;
                  // }
                  else {
                    val =
                        "${appCtrl.priceSymbol}${double.parse(e.lineTotal.toString()).toStringAsFixed(2)}";
                  }
                  return CartDetail(
                    isApplyText: isApplyText,
                    totalAmount:
                        double.parse(e.lineTotal.toString()).toStringAsFixed(2),
                    val: val.tr,
                    orderDetail: e,
                  );
                },
              ).toList(),
              Divider(color: appCtrl.appTheme.greyLight25),
              if (cartTotal != null &&
                  cartTotal!.data != null &&
                  cartTotal!.data!.totalCgstTax != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LatoFontStyle(
                      text: "CGST",
                      fontSize: FontSizes.f12,
                      color: appCtrl.appTheme.contentColor,
                    ),
                    LatoFontStyle(
                      text:
                          "${appCtrl.priceSymbol}${double.parse(cartTotal!.data!.totalCgstTax!.toString()).toStringAsFixed(2)}",
                      fontSize: FontSizes.f12,
                      color: appCtrl.appTheme.contentColor,
                    )
                  ],
                ).marginOnly(
                  bottom: AppScreenUtil().screenHeight(10),
                ),
              if (cartTotal != null &&
                  cartTotal!.data != null &&
                  cartTotal!.data!.totalSgstTax != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LatoFontStyle(
                      text: "SGST",
                      fontSize: FontSizes.f12,
                      color: appCtrl.appTheme.contentColor,
                    ),
                    LatoFontStyle(
                      text:
                          "${appCtrl.priceSymbol}${double.parse(cartTotal!.data!.totalSgstTax!.toString()).toStringAsFixed(2)}",
                      fontSize: FontSizes.f12,
                      color: appCtrl.appTheme.contentColor,
                    )
                  ],
                ).marginOnly(
                  bottom: AppScreenUtil().screenHeight(10),
                ),
              if (UserSingleton().coupons != null &&
                  UserSingleton().coupons != "")
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LatoFontStyle(
                      text: "Discount",
                      fontSize: FontSizes.f14,
                      color: appCtrl.appTheme.blackColor,
                      fontWeight: FontWeight.w600,
                    ),
                    LatoFontStyle(
                      text:
                          "- ${appCtrl.priceSymbol}${double.parse(UserSingleton().couponsDiscount ?? "0.0").toStringAsFixed(2)}",
                      fontSize: FontSizes.f14,
                      color: appCtrl.appTheme.blackColor,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ).marginOnly(
                  bottom: AppScreenUtil().screenHeight(10),
                ),
              // if (cartTotal != null && cartTotal!.data != null && cartTotal!.data!.total != null)
              //   Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       LatoFontStyle(
              //         text: CartFont().totalAmount.tr,
              //         fontSize: FontSizes.f14,
              //         color: appCtrl.appTheme.blackColor,
              //         fontWeight: FontWeight.w600,
              //       ),
              //       LatoFontStyle(
              //         text:
              //             "${appCtrl.priceSymbol}${UserSingleton().displayAmount != null && UserSingleton().displayAmount != "" ? UserSingleton().displayAmount : double.parse(cartTotal!.data!.total.toString()).toStringAsFixed(2)}",
              //         fontSize: FontSizes.f14,
              //         color: appCtrl.appTheme.blackColor,
              //         fontWeight: FontWeight.w600,
              //       )
              //     ],
              //   ).marginOnly(
              //     bottom: AppScreenUtil().screenHeight(10),
              //   ),
            ]).marginSymmetric(
              horizontal: AppScreenUtil().screenWidth(15),
            )
          : Container();
    });
  }
}
