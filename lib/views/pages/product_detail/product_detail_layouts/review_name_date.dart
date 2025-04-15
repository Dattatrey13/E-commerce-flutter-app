import 'package:dapperz/common_methods.dart';
import 'package:dapperz/models/product/product_review_list_model.dart' as prl;
import 'package:intl/intl.dart';

import '../../../../config.dart';
import '../../../../user_singleton.dart';

class ReviewNameDate extends StatelessWidget {
  final prl.Data? reviews;

  const ReviewNameDate({Key? key, this.reviews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LatoFontStyle(
                    text: reviews!.createdBy!.firstName.toString(),
                    fontWeight: FontWeight.normal,
                    fontSize: FontSizes.f14,
                    color: appCtrl.appTheme.blackColor,
                  ),
                  LatoFontStyle(
                    text: "|",
                    fontWeight: FontWeight.normal,
                    fontSize: FontSizes.f14,
                    color: appCtrl.appTheme.blackColor,
                  ).marginSymmetric(
                      horizontal: AppScreenUtil().screenWidth(10)),
                  LatoFontStyle(
                    text: getDateAndTime(reviews!.createdAt.toString()),
                    fontWeight: FontWeight.normal,
                    fontSize: FontSizes.f14,
                    color: appCtrl.appTheme.blackColor,
                  ),

                  // )
                ],
              ),
              Rating(
                val: double.parse(reviews!.rating.toString()),
                onRatingUpdate: (val) {},
                ignoreGestures: true,
              )
            ],
          ),
          Visibility(
            visible: reviews!.createdBy!.firstName == UserSingleton().firstName,
            child: IconButton(
              onPressed: () async {
                await productCtrl.deleteReview(reviews!.id.toString(), reviews);
              },
              icon: const Icon(Icons.delete),
            ),
          ),
        ],
      );
    });
  }

  getDateAndTime(String string) {
    DateTime dt = DateTime.parse(string);
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(dt);
  }
}
