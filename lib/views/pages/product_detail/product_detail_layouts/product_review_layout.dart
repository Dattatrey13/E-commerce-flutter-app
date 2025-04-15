import 'package:dapperz/common_methods.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../config.dart';

class ProductReviewLayout extends StatelessWidget {
  const ProductReviewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: UserSingleton().token != null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LatoFontStyle(
                  text: OrderHistoryFont().writeReview,
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w700,
                  color: appCtrl.appTheme.blackColor,
                ),
                const Space(0, 10),
                Row(
                  children: [
                    LatoFontStyle(
                      text: OrderHistoryFont().yourRating,
                      fontSize: FontSizes.f14,
                      fontWeight: FontWeight.w600,
                      color: appCtrl.appTheme.contentColor,
                      overflow: TextOverflow.clip,
                    ),
                    const Space(10, 0),
                    Rating(
                      val: productCtrl.reviewStar,
                      onRatingUpdate: (val) {
                        productCtrl.reviewStar = val;
                      },
                      ignoreGestures: false,
                    )
                  ],
                ),
                const Space(0, 10),
                CustomTextFormField(
                  controller: productCtrl.reviewController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 7,
                  minLines: 7,
                ),
                // const BorderLineLayout(),
                const Space(0, 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: productCtrl.reviewSubmitted ?? false
                      ? const SizedBox(
                          height: 35,
                          width: 150,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : CustomButton(
                          height: 35,
                          title: "Post Review",
                          onTap: () {
                            if (productCtrl.reviewController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Please Write Review First");
                              return;
                            }

                            if (productCtrl.reviewStar <= 0.0) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Minimum half star is required to post review");
                              return;
                            }
                            productCtrl.submitReview();
                          },
                        ),
                ),
                const Space(0, 30),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LatoFontStyle(
                text:
                    "${ProductDetailFont().customerReviews} (${productCtrl.product!.ratingCount})",
                fontWeight: FontWeight.w700,
                fontSize: FontSizes.f14,
                color: productCtrl.appCtrl.appTheme.blackColor,
              ),
              Visibility(
                visible: productCtrl.productReview != null &&
                    productCtrl.productReview!.isNotEmpty,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(routeName.allReviews,
                        arguments: productCtrl.productId);
                  },
                  child: LatoFontStyle(
                    text: ProductDetailFont().allReviews,
                    fontSize: FontSizes.f12,
                    color: productCtrl.appCtrl.appTheme.primary,
                  ),
                ),
              )
            ],
          ),
          if (productCtrl.productReview != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...productCtrl.productReview!.asMap().entries.map((e) {
                  return ReviewCard(
                    reviews: e.value,
                    index: e.key,
                    lastIndex: productCtrl.productReview!.length - 1,
                  );
                }).toList()
              ],
            )
        ],
      ).marginSymmetric(
        horizontal: AppScreenUtil().screenWidth(15),
        vertical: AppScreenUtil().screenHeight(20),
      );
    });
  }
}
