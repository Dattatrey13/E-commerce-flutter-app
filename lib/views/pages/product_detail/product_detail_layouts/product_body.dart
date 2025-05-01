import 'package:dapperz/common_methods.dart';
import 'package:dapperz/user_singleton.dart';

import '../../../../config.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({Key? key}) : super(key: key);

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // product information
            const ProductInformation(),
            // review layout
            const ProductReviewLayout(),
            // delivery offer layout
            // if (productCtrl.product.deliverOfferModel != null)
            //   DeliveryOfferLayout(
            //       deliverOfferModel: productCtrl.product.deliverOfferModel),
            const BorderLineLayout(),
            // similar product text layout
            // ProductDetailWidget().commonText(text: ProductDetailFont().similarProducts, fontSize: FontSizes.f14),
            // similar product layout
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(15),
                  vertical: AppScreenUtil().screenHeight(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LatoFontStyle(
                            text: 'Recommended Products',
                            fontSize: FontSizes.f14,
                            fontWeight: FontWeight.w700,
                            color: appCtrl.appTheme.blackColor,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.delete<ShopController>();
                              var data = {
                                'name': 'Recommended Products',
                                'cat_id': 'recommended_product_by_id',
                                'product_slug': productCtrl.slug
                              };
                              Get.toNamed(routeName.shopPage, arguments: data);
                            },
                            child: Text('View More',
                                style: TextStyle(
                                    color: appCtrl.appTheme.blackColor)),
                          ),
                        ],
                      ),
                      const Space(0, 5),
                      productCtrl.recommendedForYouList.isNotEmpty
                          ? SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: productCtrl.recommendedForYouList
                                    .asMap()
                                    .entries
                                    .map((e) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.delete<ProductDetailController>();
                                      Get.delete<ShopController>();
                                      Get.toNamed(routeName.productDetail,
                                          arguments: productCtrl
                                              .recommendedForYouList[e.key].slug
                                              .toString(),
                                          preventDuplicates: false);
                                    },
                                    child: DashboardProductCard(
                                      data: productCtrl
                                          .recommendedForYouList[e.key],
                                      isFit: true,
                                    ).paddingOnly(
                                        right: AppScreenUtil().screenWidth(10)),
                                  );
                                }).toList(),
                              ),
                            )
                          : const SizedBox(
                              height: 70,
                              child: Center(child: Text('No Recommendation'))),
                    ],
                  )
                ],
              ),
            ),
            const BorderLineLayout(),
            UserSingleton().token != null &&
                    productCtrl.recentlyViewedList.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppScreenUtil().screenWidth(15),
                        vertical: AppScreenUtil().screenHeight(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LatoFontStyle(
                              text: "Recently Viewed",
                              fontSize: FontSizes.f14,
                              fontWeight: FontWeight.w700,
                              color: productCtrl.appCtrl.appTheme.blackColor,
                            ),
                            TextButton(
                              onPressed: () {
                                Get.delete<ShopController>();
                                var data = {
                                  'name': "Recently Viewed",
                                  'cat_id': "on_recent"
                                };
                                Get.toNamed(routeName.shopPage,
                                    arguments: data);
                              },
                              child: Text('View More',
                                  style: TextStyle(
                                      color: productCtrl
                                          .appCtrl.appTheme.blackColor)),
                            ),
                          ],
                        ),
                        const Space(0, 15),
                        productCtrl.recentlyViewedList.isNotEmpty
                            ? SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: productCtrl.recentlyViewedList
                                      .asMap()
                                      .entries
                                      .map((e) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.delete<ProductDetailController>();
                                        Get.delete<ShopController>();
                                        Get.toNamed(routeName.productDetail,
                                            arguments: productCtrl
                                                .recentlyViewedList[e.key].id
                                                .toString(),
                                            preventDuplicates: false);
                                      },
                                      child: DashboardProductCard(
                                        data: productCtrl
                                            .recentlyViewedList[e.key],
                                        isFit: true,
                                      ).paddingOnly(
                                        right: AppScreenUtil().screenWidth(10),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              )
                            : const SizedBox(
                                height: 70,
                                child: Center(
                                  child: Text('No Product Available'),
                                ),
                              ),
                      ],
                    ),
                  )
                : Container(),
            const SizedBox(height: 50),
          ],
        ),
      );
    });
  }
}
