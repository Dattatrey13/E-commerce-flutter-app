import 'package:dapperz/models/product/product_review_list_model.dart' as prl;
import 'package:dapperz/user_singleton.dart';

import '../../../../config.dart';

class ReviewCard extends StatelessWidget {
  final prl.Data? reviews;
  final int? index, lastIndex;

  const ReviewCard({Key? key, this.reviews, this.index, this.lastIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReviewNameDate(reviews: reviews)
              .marginSymmetric(vertical: AppScreenUtil().screenHeight(15)),
          LatoFontStyle(
            text: reviews!.review.toString(),
            fontWeight: FontWeight.normal,
            fontSize: FontSizes.f14,
            color: appCtrl.appTheme.contentColor,
            overflow: TextOverflow.clip,
          ),
          Visibility(
            visible: reviews!.createdBy!.firstName == UserSingleton().firstName,
            child: Align(
              alignment: Alignment.centerRight,
              child: LatoFontStyle(
                text: "Status: ${(reviews!.status ?? "").toUpperCase()}",
                fontWeight: FontWeight.normal,
                fontSize: FontSizes.f12,
                color: appCtrl.appTheme.contentColor,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
          // ProductSize(reviews: reviews!),
          if (index != lastIndex) Divider(color: appCtrl.appTheme.greyLight25)
        ],
      );
    });
  }
}
