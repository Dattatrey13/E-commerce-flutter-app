import 'package:dapperz/config.dart';
import 'package:dapperz/models/cart/cart_list_model.dart';
import 'package:dapperz/views/bottom_navigate_page/home/home_layouts/home_deals_of_the_day/cart_list_item.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../models/product/delete_review_model.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (cartCtrl) {
      return cartCtrl.cartModelList != null
          ? Column(
              children: [
                ...cartCtrl.cartModelList!.data!.asMap().entries.map(
                      (e) => Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // GestureDetector(
                              //   onTap: () {
                              //     cartCtrl.appCtrl.goToProductDetail(
                              //         slug:
                              //             e.value.slug.toString());
                              //   },
                              //   child: Stack(
                              //     alignment: Alignment.topRight,
                              //     children: [
                              //       ClipRRect(
                              //         borderRadius: BorderRadius.circular(
                              //             AppScreenUtil().borderRadius(3)),
                              //         child: FadeInImageLayout(
                              //           // image: e.value.product_id!.imageId!.url,
                              //           image: e.value.product_id?.imageId == true
                              //               ? e.value.product_id!.imageId!.url
                              //               : '',
                              //           // slug: e.value.product_id?.slug ?? '',
                              //
                              //           height: AppScreenUtil().size(110),
                              //           width: AppScreenUtil().size(110),
                              //         ),
                              //       ),
                              //       // if (e.value.isTrending!) const TrendingButton()
                              //     ],
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () {
                                  cartCtrl.appCtrl.goToProductDetail(
                                    slug: e.value!.product_id!.slug.toString(),
                                  );
                                },
                                child: Stack(
                                  alignment: Alignment.topRight,
                                  children: [
                                ClipRRect(
                                borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(3)),
      child: FadeInImageLayout(
      image: e.value.product_id?.defaultImage?.productImageMeta?.mobile ??
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA2oASENe7GdCli1KnAl6cnDnuD6lGT60txQ&s",
      height: AppScreenUtil().size(110),
      width: AppScreenUtil().size(110),
      ),
      )



                                    //if (e.value.isTrending!) const TrendingButton()

                                  ],
                                ),
                              ),
                              const Space(10, 0),
                              CartListItem(
                                data: e.value,
                                isVariantsShow: true,
                                isActionShow: true,
                                firstActionTap: () {
                                  cartCtrl.bottomSheetLayout(
                                      CommonTextFont().moveToWishList);
                                },
                                secondActionTap: () async {
                                  DeleteReviewModel? status = await cartCtrl
                                      .removeFromCart(e.value.cartItemKey!);
                                  if (status.data != null &&
                                      status.message != null &&
                                      status.success != null) {
                                    Fluttertoast.showToast(
                                        msg: status.message ?? "");
                                    cartCtrl.cartModelList!.data!.remove(e);
                                    cartCtrl.isPriceLoading = true;
                                    cartCtrl.update();
                                    Get.forceAppUpdate();
                                    await cartCtrl.getDataWithOutLoading();
                                    // Redirection to Cart Page
                                    // appCtrl.isShimmer = true;
                                    // appCtrl.selectedIndex = 2;
                                    // appCtrl.goToHome();
                                    // Get.toNamed(routeName.dashboard);
                                    // await Future.delayed(DurationsClass.s1);
                                    // appCtrl.isShimmer = false;
                                    Get.forceAppUpdate();
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "Unable to Remove Item to Cart");
                                  }
                                },
                              )
                            ],
                          ).marginSymmetric(
                            horizontal: AppScreenUtil().screenWidth(14),
                            vertical: AppScreenUtil().screenHeight(15),
                          ),
                          const BorderLineLayout()
                        ],
                      ),
                    ),
              ],
            )
          : Container();
    });
  }
}


