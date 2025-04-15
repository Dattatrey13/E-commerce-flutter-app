import 'package:dapperz/controllers/pages_controller/all_reviews_controller.dart';
import 'package:flutter/cupertino.dart';

import '../../../config.dart';

class AllReviews extends StatelessWidget {
  final productCtrl = Get.put(AllReviewsController());

  AllReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllReviewsController>(builder: (ctrl) {
      return Directionality(
        textDirection: ctrl.appCtrl.isRTL || ctrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: ctrl.appCtrl.appTheme.whiteColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: ctrl.appCtrl.appTheme.whiteColor,
            automaticallyImplyLeading: false,
            leading: Icon(
              CupertinoIcons.arrow_left,
              size: AppScreenUtil().size(25),
              color: ctrl.appCtrl.appTheme.blackColor,
            ).gestures(
              onTap: () {
                Get.back();
              },
            ),
            title: const LatoFontStyle(
              text: "All Reviews",
              fontSize: FontSizes.f16,
              fontWeight: FontWeight.w700,
            ),
          ),
          body: ctrl.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...ctrl.productReviewAll!.asMap().entries.map((e) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ReviewCard(
                            reviews: e.value,
                            index: e.key,
                            lastIndex: ctrl.productReviewAll!.length - 1,
                          ),
                        );
                      }).toList(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
