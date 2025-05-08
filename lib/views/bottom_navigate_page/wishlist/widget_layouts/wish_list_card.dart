import 'package:dapperz/models/wishlist/wish_list_model.dart' as wlm;

import '../../../../config.dart';

class WishListCard extends StatelessWidget {
  final wlm.Data? wishlistItemDetail;
  final int? index, lastIndex;
  final GestureTapCallback? firstActionTap;
  final GestureTapCallback? secondActionTap;

  const WishListCard(
      {Key? key,
      this.wishlistItemDetail,
      this.lastIndex,
      this.index,
      this.firstActionTap,
      this.secondActionTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => appCtrl.goToProductDetail(
                    slug: wishlistItemDetail!.productId!.slug.toString(),
                  ),
                  child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          AppScreenUtil().borderRadius(3)),
                      child: FadeInImageLayout(
                        // image:
                        // wishlistItemDetail!.productId!.imageIds!.first.url,
                        image: wishlistItemDetail?.productId?.defaultImage?.productImageMeta?.mobile ?? imageAssets.noData,
                        height: AppScreenUtil().size(110),
                        width: AppScreenUtil().size(110),
                      ),
                    ),
                  ]),
                ),
                const Space(10, 0),
                DealsOfTheDayContent(
                  data: wishlistItemDetail,
                  isVariantsShow: false,
                  isActionShow: true,
                  firstActionTap: firstActionTap,
                  secondActionTap: secondActionTap,
                ),
              ],
            ).marginSymmetric(
                horizontal: AppScreenUtil().screenWidth(15),
                vertical: AppScreenUtil().screenHeight(15)),
            if (index != lastIndex) const BorderLineLayout()
          ],
        ),
      );
    });
  }
}

