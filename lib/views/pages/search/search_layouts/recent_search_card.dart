import 'package:dapperz/models/dashboard/auto_complete_search_model.dart'
as acsm;

import '../../../../config.dart';

class RecentSearchCard extends StatelessWidget {
  final acsm.PItems? data;

  const RecentSearchCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () =>
        {appCtrl.goToProductDetail(slug: data!.slug.toString())},
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              const Icon(Icons.search),
              Flexible(
                child: LatoFontStyle(
                  text: data!.productTitle ?? "",
                  fontSize: FontSizes.f12,
                  color: appCtrl.appTheme.contentColor,
                  overflow: TextOverflow.ellipsis,
                ).marginSymmetric(
                    horizontal: AppScreenUtil().screenWidth(15),
                    vertical: AppScreenUtil().screenHeight(5)),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class RecentCategoryCard extends StatelessWidget {
  final acsm.CItems? data;

  const RecentCategoryCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () {
          var pageData = {'name': data!.categoryName, 'cat_id': data!.id};
          Get.toNamed(routeName.shopPage, arguments: pageData);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              const Icon(Icons.search),
              Flexible(
                child: LatoFontStyle(
                  text: data!.categoryName ?? "",
                  fontSize: FontSizes.f12,
                  color: appCtrl.appTheme.contentColor,
                  overflow: TextOverflow.ellipsis,
                ).marginSymmetric(
                    horizontal: AppScreenUtil().screenWidth(15),
                    vertical: AppScreenUtil().screenHeight(5)),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class RecentBrandsCard extends StatelessWidget {
  final acsm.BItems? data;

  const RecentBrandsCard({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () {
          var pageData = {'name': data!.brandName, 'cat_id': data!.id!};
          Get.toNamed(routeName.shopPage, arguments: pageData);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              const Icon(Icons.search),
              Flexible(
                child: LatoFontStyle(
                  text: data!.brandName ?? "",
                  fontSize: FontSizes.f12,
                  color: appCtrl.appTheme.contentColor,
                  overflow: TextOverflow.ellipsis,
                ).marginSymmetric(
                    horizontal: AppScreenUtil().screenWidth(15),
                    vertical: AppScreenUtil().screenHeight(5)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
