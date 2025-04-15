import 'package:dapperz/models/cart/cart_list_model.dart' as acm;

import '../../../../config.dart';

class CartDetail extends StatelessWidget {
  final acm.Data? orderDetail;
  final bool? isApplyText;
  final String? val, totalAmount;

  const CartDetail(
      {Key? key,
      this.orderDetail,
      this.isApplyText,
      this.totalAmount,
      this.val})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: LatoFontStyle(
              text: orderDetail!.productId!.productTitle,
              fontSize: FontSizes.f14,
              color: appCtrl.appTheme.contentColor,
              softWrap: true,
            ),
          ),
          const SizedBox(width: 20),
          LatoFontStyle(
            text: orderDetail!.productId!.productTitle == "Coupon Discount" ||
                    orderDetail!.productId!.productTitle == "कूपन छूट"
                ? isApplyText!
                    ? val
                    : "-${appCtrl.priceSymbol}20.0"
                : val,
            fontSize: FontSizes.f14,
            color: orderDetail!.productId!.productTitle == "Bag savings"
                ? appCtrl.appTheme.greenColor
                : orderDetail!.productId!.productTitle == "Coupon Discount" ||
                        orderDetail!.productId!.productTitle == "कूपन छूट"
                    ? isApplyText!
                        ? appCtrl.appTheme.primary
                        : appCtrl.appTheme.contentColor
                    : appCtrl.appTheme.contentColor,
          ).gestures(
            onTap: () {
              // if (orderDetail!.value == "Apply Coupon") {
              //   Get.toNamed(routeName.coupons, arguments: totalAmount);
              // }
            },
          ),
        ],
      ).marginOnly(bottom: AppScreenUtil().screenHeight(10));
    });
  }
}
