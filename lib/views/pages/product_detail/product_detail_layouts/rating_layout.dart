import '../../../../config.dart';

class RatingLayout extends StatelessWidget {
  const RatingLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      double rating = double.parse((productCtrl.product!.averageRating ?? 0.0).toString());
      return Row(
        children: [
          LatoFontStyle(
            text: " ${rating == 0.0 ? 0 : rating}".toString(),
            fontSize: 12,
            fontWeight: FontWeight.normal,
            // color: appCtrl.appTheme.primary,
          ),
          const Space(5, 0),
          Rating(
            val: double.parse((productCtrl.product!.averageRating ?? 0.0).toString()),
            onRatingUpdate: (val) {},
          ),
          const Space(5, 0),
          LatoFontStyle(
            text: "(${productCtrl.product!.ratingCount ?? 0.0})",
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: productCtrl.appCtrl.appTheme.contentColor,
          )
        ],
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(12), vertical: AppScreenUtil().screenHeight(2));
    });
  }
}
