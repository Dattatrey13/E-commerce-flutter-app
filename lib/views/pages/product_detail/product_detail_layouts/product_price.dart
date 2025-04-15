import '../../../../config.dart';

class ProductPrice extends StatelessWidget {
  final String? productPrice;
  final String? productDiscount;

  const ProductPrice({Key? key, this.productPrice, this.productDiscount = "0.0"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return productPrice != null
          ? PriceLayout(
              totalPrice:
                  productDiscount != null && productDiscount != "" && productDiscount != "null" ? '${appCtrl.priceSymbol} ${(productDiscount)}' : "",
              mrp: '${appCtrl.priceSymbol} ${(productPrice!)}',
              discount: productDiscount,
              fontSize: FontSizes.f16,
              isBold: false,
              isDiscountShow: productDiscount != null && double.parse(productDiscount!) != 0.0  ? true : false,
            ).marginOnly(
              left: AppScreenUtil().screenWidth(10),
              right: AppScreenUtil().screenWidth(10),
            )
          : Container();
    });
  }

  // getDiscountPercentage(double productPrice, double productDiscount) {
  //   double discountPrice = productPrice - productDiscount;
  //   return ((discountPrice / productPrice) * 100).toStringAsFixed(0);
  // }
}
