import 'package:dapperz/models/dashboard/parent_category_model.dart' as pcm;

import '../../../../../config.dart';

class HomeCategoryData extends StatelessWidget {
  final pcm.Data? data;
  final int? index;

  const HomeCategoryData({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width > 600 ? 8 : 6;
    double iconRadius = MediaQuery.of(context).size.width > 600 ? 43 : 33;
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return InkWell(
        onTap: () async {
          homeCtrl.appCtrl.isHeart = true;
          homeCtrl.appCtrl.isCart = true;
          homeCtrl.appCtrl.isShare = false;
          homeCtrl.appCtrl.isSearch = true;
          homeCtrl.appCtrl.isNotification = false;
          // homeCtrl.appCtrl.selectedIndex = 1;
          // homeCtrl.appCtrl.update();
          // homeCtrl.appCtrl.isShimmer = true;
          // homeCtrl.update();
          // await Future.delayed(DurationsClass.s1);
          // homeCtrl.appCtrl.isShimmer = false;
          // homeCtrl.appCtrl.update();
          // Get.forceAppUpdate();
          CategoryController categoryCtrl = CategoryController();
          await categoryCtrl.getSubCategoryList(data!.id.toString());
          categoryCtrl.appCtrl.isShimmer = true;
          categoryCtrl.appCtrl.update();
          var pageData = {
            'name': data!.categoryName,
            'cat_id': categoryCtrl.subCategoryList!.id!.toString()
          };
          print(categoryCtrl.subCategoryList!.id!.toString());
          Get.toNamed(routeName.shopPage, arguments: pageData)?.then((value) {
            homeCtrl.getRecentItemList();
          });
          // Get.toNamed(routeName.innerCategory, arguments: categoryCtrl.subCategoryList);
          // Get.toNamed(routeName.shopPage, arguments: "All");
          await Future.delayed(DurationsClass.s1);
          categoryCtrl.appCtrl.isShimmer = false;
          categoryCtrl.appCtrl.update();
          Get.forceAppUpdate();
        },
        child: Padding(
          padding: EdgeInsets.only(
            right: AppScreenUtil().screenWidth(5),
            left: AppScreenUtil().screenWidth(5),
            // top: AppScreenUtil().screenWidth(3),
          ),
          child: Column(
            children: [
              SizedBox(
                // height: AppScreenUtil().screenHeight(90),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(iconRadius),
                    child: FadeInImageLayout(
                      image: data!.imageUrl,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: size.width / width,
                  child: LatoFontStyle(
                    text: data!.categoryName,
                    fontWeight: FontWeight.w600,
                    fontSize: FontSizes.f12,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.visible,
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
