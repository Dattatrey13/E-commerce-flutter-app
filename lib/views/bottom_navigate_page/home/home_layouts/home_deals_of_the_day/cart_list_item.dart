import 'package:dapperz/models/cart/cart_list_model.dart' as acm;
import 'package:dapperz/views/bottom_navigate_page/wishlist/widget_layouts/wishlist_action.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../config.dart';

class CartListItem extends StatelessWidget {
  final acm.Data? data;
  final bool isVariantsShow;
  final bool isActionShow;
  final GestureTapCallback? firstActionTap;
  final GestureTapCallback? secondActionTap;

  const CartListItem(
      {Key? key,
      this.data,
      this.isVariantsShow = false,
      this.isActionShow = false,
      this.firstActionTap,
      this.secondActionTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LatoFontStyle(
                text: data!.productId!.productTitle!,
                fontWeight: FontWeight.w700,
                color: appCtrl.appTheme.blackColor,
                fontSize: FontSizes.f12,
              ),
              const Space(0, 2),
              PriceLayout(
                totalPrice:
                    data!.lineTotal != null ? data!.lineTotal.toString() : "",
                mrp: "",
                // discount: productCtrl.selectedVariationId != null
                //     ? productCtrl.selectedVariation!.discountPercentage.toString()
                //     : productCtrl.product!.discountPercentage.toString(),
                fontSize: FontSizes.f16,
                isBold: false,
                isDiscountShow: false,
                // isDiscountShow: productCtrl.product!.discountPercentage != 0.0 && productCtrl.product!.discountPercentage != null ? true : false,

                // totalPrice: data!.slug!.price,
                // totalPrice: data!.variationId != null ? data!.slug!.price.toString() : '',
                // mrp: data!.variationId!.isOnSale == true && data!.variationId!.salePrice != data!.variationId!.price
                //     ? data!.variationId!.salePrice
                //     : data!.variationId!.price,
                // discount: "",
                // fontSize: FontSizes.f12,
              ),
              const Space(0, 10),
              if (isVariantsShow)
                Container(
                  child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        CommonIncDecButton(
                            icon: CupertinoIcons.minus,
                            onTap: () => cartCtrl.quantityDecrease(data!)),
                        LatoFontStyle(
                          text: data!.quantity!.toString(),
                        ).marginSymmetric(
                            horizontal: AppScreenUtil().screenWidth(30)),
                        CommonIncDecButton(
                            icon: CupertinoIcons.plus,
                            onTap: () => cartCtrl.quantityIncrease(data!)),
                      ])
                      .width(AppScreenUtil().screenWidth(150))
                      .height(AppScreenUtil().screenHeight(40))
                      .decorated(
                          borderRadius: BorderRadius.circular(
                              AppScreenUtil().borderRadius(5)),
                          color: appCtrl.appTheme.lightGray)
                      .marginSymmetric(
                          horizontal: AppScreenUtil().screenWidth(15),
                          vertical: AppScreenUtil().screenHeight(10))
                      .alignment(Alignment.centerLeft),
                ).marginOnly(
                  bottom: AppScreenUtil().screenHeight(10),
                ),
              if (isActionShow)
                WishListAction(
                  about: "cart",
                  firstActionTap: firstActionTap,
                  secondActionTap: secondActionTap,
                  isActionShow: true,
                )
            ],
          ),
        );
      });
    });
  }
}


