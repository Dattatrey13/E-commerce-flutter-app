import 'package:dapperz/common_methods.dart';

import '../../../config.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categoryCtrl = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryController>(builder: (_) {
      return Directionality(
        textDirection: categoryCtrl.appCtrl.isRTL ||
                categoryCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          body: categoryCtrl.appCtrl.isShimmer
              ? const CategoryShimmer()
              : WillPopScope(
                  onWillPop: () async {
                    appCtrl.isHeart = true;
                    appCtrl.isCart = true;
                    appCtrl.isShare = false;
                    appCtrl.isSearch = true;
                    appCtrl.isNotification = false;
                    appCtrl.selectedIndex = 0;
                    appCtrl.update();
                    Get.forceAppUpdate();
                    return true;
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // category list
                        ...categoryCtrl.categoryList.asMap().entries.map((e) {
                          return CategoryCardLayout(
                            categoryModel: categoryCtrl.categoryList[e.key],
                            index: e.key,
                            isEven: e.key.isEven,
                            onTap: () async {
                              categoryCtrl.appCtrl.isShimmer = true;
                              categoryCtrl.appCtrl.update();
                              var data = categoryCtrl.categoryList[e.key];
                              Get.toNamed(routeName.innerCategory,
                                  arguments: data);
                              await Future.delayed(DurationsClass.s1);
                              categoryCtrl.appCtrl.isShimmer = false;
                              categoryCtrl.appCtrl.update();
                              Get.forceAppUpdate();
                            },
                          );
                        }).toList()
                      ],
                    ),
                  ),
                ),
        ),
      );
    });
  }

  @override
  void dispose() {
    Get.delete<CategoryController>();
    super.dispose();
  }
}
