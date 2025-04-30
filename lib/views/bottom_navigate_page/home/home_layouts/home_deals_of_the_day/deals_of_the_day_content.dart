import 'package:dapperz/models/wishlist/wish_list_model.dart' as wlm;
import 'package:dapperz/views/bottom_navigate_page/wishlist/widget_layouts/wishlist_action.dart';

import '../../../../../config.dart';

class DealsOfTheDayContent extends StatelessWidget {
  final wlm.Data? data;
  final bool isVariantsShow;
  final bool isActionShow;
  final GestureTapCallback? firstActionTap;
  final GestureTapCallback? secondActionTap;

  const DealsOfTheDayContent(
      {Key? key,
      this.data,
      this.isVariantsShow = false,
      this.isActionShow = false,
      this.firstActionTap,
      this.secondActionTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LatoFontStyle(
              text: data!.slug!.productTitle!.tr,
              fontWeight: FontWeight.w700,
              color: appCtrl.appTheme.blackColor,
              fontSize: FontSizes.f12,
            ),
            const Space(0, 2),
            data!.slug!.id != null &&
                    (data!.slug!.isFeatured ?? false)
                ? Container()
                : PriceLayout(
                    totalPrice: data!.slug!.isOnSale == true &&
                            data!.slug!.salePrice !=
                                data!.slug!.price &&
                            data!.slug!.salePrice != ""
                        ? data!.slug!.salePrice
                        : null,
                    mrp: data!.slug!.price,
                    discount: "",
                    // todo: set discount value once set in api
                    // discount: data!.slug!.discountPercentage.toString(),

                    // data!.slug!.salePrice != null &&
                    //         data!.slug!.salePrice != "" &&
                    //         data!.slug!.salePrice != "null"
                    //     ? isInteger(num.parse(
                    //             (double.parse(data!.slug!.regularPrice!) - double.parse(data!.slug!.salePrice!)).toString()))
                    //         ? getDiscountPercentage(
                    //                 double.parse(data!.slug!.regularPrice!), double.parse(data!.slug!.salePrice!))
                    //             .toString()
                    //         : getDiscountPercentage(
                    //                 double.parse(data!.slug!.regularPrice!), double.parse(data!.slug!.salePrice!))
                    //             .toString()
                    //     : "",
                    fontSize: data!.slug!.salePrice != null &&
                            data!.slug!.salePrice != "" &&
                            data!.slug!.salePrice != "null"
                        ? MediaQuery.of(context).size.width > 400
                            ? FontSizes.f11
                            : FontSizes.f12
                        : FontSizes.f12,
                    // isDiscountShow: data!.slug!.salePrice != null && data!.slug!.salePrice != "" && data!.slug!.salePrice != "null",
                    isDiscountShow: false,
                  ),
            const Space(0, 10),
            if (isVariantsShow)
              Variants(
                  firstActionTap: firstActionTap,
                  secondActionTap: secondActionTap),
            if (isActionShow)
              WishListAction(
                about: 'wishlist',
                firstActionTap: firstActionTap,
                secondActionTap: secondActionTap,
                isActionShow: !(data!.slug!.isFeatured ?? false),
              )
          ],
        ),
      );
    });
  }

  getDiscountPercentage(double productPrice, double productDiscount) {
    double discountPrice = productPrice - productDiscount;
    return ((discountPrice / productPrice) * 100).toStringAsFixed(0);
  }
}
