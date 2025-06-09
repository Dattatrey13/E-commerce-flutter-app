import 'package:dapperz/models/dashboard/parent_category_model.dart' as pcm;

import '../../../../../config.dart';

class HomeCategoryData extends StatelessWidget {
  final pcm.Data? data;
  final int? index;

  const HomeCategoryData({Key? key, this.data, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (homeCtrl) {
        return InkWell(
          onTap: () async {
            homeCtrl.appCtrl.isHeart = true;
            homeCtrl.appCtrl.isCart = true;
            homeCtrl.appCtrl.isShare = false;
            homeCtrl.appCtrl.isSearch = true;
            homeCtrl.appCtrl.isNotification = false;

            CategoryController categoryCtrl = CategoryController();
            await categoryCtrl.getSubCategoryList(data!.id.toString());
            categoryCtrl.appCtrl.isShimmer = true;
            categoryCtrl.appCtrl.update();

            var pageData = {
              'name': data!.categoryName,
              'cat_id': categoryCtrl.subCategoryList!.id!.toString()
            };

            Get.toNamed(routeName.shopPage, arguments: pageData)?.then((value) {
              homeCtrl.getRecentItemList();
            });

            await Future.delayed(DurationsClass.s1);
            categoryCtrl.appCtrl.isShimmer = false;
            categoryCtrl.appCtrl.update();
            Get.forceAppUpdate();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                FadeInImageLayout(
                  image: data!.imageUrl,
                  fit: BoxFit.cover,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  child: Text(
                    data!.categoryName ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
