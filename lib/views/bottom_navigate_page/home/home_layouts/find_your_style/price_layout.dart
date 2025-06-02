import '../../../../../config.dart';

class PriceLayout extends StatelessWidget {
  final String? totalPrice, mrp, discount;
  final bool isDiscountShow;
  final bool isBold;
  final double fontSize;

  const PriceLayout(
      {Key? key, this.discount, this.mrp, this.totalPrice, this.isDiscountShow = true, this.isBold = true, this.fontSize = FontSizes.f12})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return FittedBox(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Visibility(
                //   visible: totalPrice != null,
                //   child:
                LatoFontStyle(
                  text: totalPrice != null ? '${appCtrl.priceSymbol} $totalPrice' : '${appCtrl.priceSymbol} $mrp',
                  fontSize: fontSize,
                  fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                  color: appCtrl.appTheme.blackColor,
                  // ),
                ),
                const Space(5, 0),
                Visibility(
                  visible: totalPrice != null,
                  child: mrp != null && mrp!.contains("-") && mrp != "${appCtrl.priceSymbol} outofstock"
                      ? Row(
                          children: [
                            LatoFontStyle(
                              text: mrp!.split("-")[0],
                              fontSize: fontSize,
                              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                              color: appCtrl.appTheme.contentColor,
                              textDecoration: TextDecoration.lineThrough,
                            ),
                            LatoFontStyle(
                              text: " - ",
                              fontSize: fontSize,
                              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                              color: appCtrl.appTheme.contentColor,
                            ),
                            LatoFontStyle(
                              text: mrp!.split("-")[1],
                              fontSize: fontSize,
                              fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                              color: appCtrl.appTheme.contentColor,
                              textDecoration: TextDecoration.lineThrough,
                            ),
                          ],
                        )
                      : LatoFontStyle(
                          text: mrp == "${appCtrl.priceSymbol} outofstock" ? "Out of Stock" : "${appCtrl.priceSymbol}$mrp",
                          // text: mrp == "${appCtrl.priceSymbol} outofstock" ? "Out of Stock" : mrp,
                          fontSize: fontSize,
                          fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                          color: appCtrl.appTheme.contentColor,
                          textDecoration: TextDecoration.lineThrough,
                        ),
                ),
                const Space(5, 0),
                // if (isDiscountShow)
                //   LatoFontStyle(
                //     text: '($discount % ${CommonTextFont().off})',
                //     fontSize: fontSize,
                //     fontWeight: isBold ? FontWeight.w600 : FontWeight.normal,
                //     color: appCtrl.appTheme.blackColor,
                //   ),
              ],
            ).paddingOnly(left: AppScreenUtil().screenWidth(5)),
          ],
        ),
      );
    });
  }
}
