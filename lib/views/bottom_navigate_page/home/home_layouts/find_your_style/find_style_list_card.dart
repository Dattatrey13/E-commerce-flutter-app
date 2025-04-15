import 'dart:collection';

import 'package:dapperz/models/product/product_list_model.dart' as plm;

import '../../../../../config.dart';

class DashboardProductCard extends StatelessWidget {
  final plm.Data? data;
  final bool isFit;

  const DashboardProductCard({Key? key, this.data, this.isFit = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      double rating = double.parse((data!.averageRating ?? 0.0).toString());
      return SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    SizedBox(
                      height: 200,
                      child: data!.imageIds!.isEmpty
                          ? Image.asset(imageAssets.noData)
                          : ProductImage(
                              image: data!.imageIds!.first.url.toString(),
                              isFit: isFit),
                    ),
                    Container(
                      child: LinkHeartIcon(
                        onTap: (bool val) async {
                          HashMap<String, dynamic> params = HashMap();
                          params['product_id'] = data!.id!.toString();
                          bool? status =
                              await appCtrl.addItemToWishlist(params);
                          if (status != null && status) {
                            data!.setIsWishList =
                                !(data!.isInWishlist ?? false);
                          }
                          return data!.isInWishlist;
                        },
                        isLiked: data!.isInWishlist,
                      ).paddingOnly(
                        top: AppScreenUtil().screenHeight(10),
                        right: AppScreenUtil().screenWidth(10),
                      ),
                    )
                  ],
                ),
                // if (data!.isNew) const NewLayout()
                //if (false) const NewLayout()
              ],
            ),
            const Space(0, 5),
            Visibility(
              visible: !(rating == 0.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      LatoFontStyle(
                        text: " ${rating == 0.0 ? 0 : rating}".toString(),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        // color: appCtrl.appTheme.primary,
                      ),
                      const Space(5, 0),
                      Rating(
                        val: double.parse(data!.averageRating.toString()),
                        onRatingUpdate: (val) {},
                        ignoreGestures: true,
                      ),
                      const Space(5, 0),
                      LatoFontStyle(
                        text: "(${data!.ratingCount.toString()})".toString(),
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: appCtrl.appTheme.contentColor,
                      )
                    ],
                  ),
                  const Space(0, 5),
                ],
              ),
            ),
            LatoFontStyle(
              text: data!.productTitle!.tr,
              fontSize: FontSizes.f14,
              fontWeight: FontWeight.normal,
              color: appCtrl.appTheme.blackColor,
              overflow: TextOverflow.ellipsis,
            ).paddingOnly(left: AppScreenUtil().screenWidth(5)),
            const Space(0, 5),
            data!.id != null && (data!.isFeatured ?? false)
                ? Container()
                : PriceLayout(
                    // totalPrice: data!.salePrice != null && data!.salePrice != "" && data!.salePrice != "null"
                    //     ? '${appCtrl.priceSymbol} ${(data!.salePrice!)}'
                    //     : "",
                    totalPrice: data!.isOnSale == true &&
                            data!.salePrice != data!.price &&
                            data!.salePrice != ""
                        ? data!.salePrice
                        : null,
                    // mrp: '${appCtrl.priceSymbol} ${data!.price}'
                    mrp: data!.price,
                    //  '${(data!.isAttribute! ? data!.priceRange : isInteger(num.parse(data!.regularPrice ?? "0")) ? num.parse(data!.regularPrice ?? "0").toStringAsFixed(0) : data!.regularPrice ?? "0")}'
                    //todo: set discount price
                    discount: data!.discountPercentage.toString(),
                    // data!.salePrice != null &&
                    //         data!.salePrice != "" &&
                    //         data!.salePrice != "null"
                    //     ? isInteger(num.parse(
                    //             (double.parse(data!.regularPrice!) - double.parse(data!.salePrice!)).toString()))
                    //         ? getDiscountPercentage(
                    //                 double.parse(data!.regularPrice!), double.parse(data!.salePrice!))
                    //             .toString()
                    //         : getDiscountPercentage(
                    //                 double.parse(data!.regularPrice!), double.parse(data!.salePrice!))
                    //             .toString()
                    //     : "",
                    fontSize: data!.salePrice != null &&
                            data!.salePrice != "" &&
                            data!.salePrice != "null"
                        ? MediaQuery.of(context).size.width > 400
                            ? FontSizes.f12
                            : FontSizes.f12
                        : FontSizes.f12,
                    isDiscountShow: data!.discountPercentage != 0.0 &&
                            data!.discountPercentage != null
                        ? true
                        : false,
                  ),
          ],
        ),
      );
    });
  }
}
