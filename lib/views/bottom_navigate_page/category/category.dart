import 'package:dapperz/common_methods.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: MasonryGridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      itemCount: categoryCtrl.categoryList.length,
                      physics: const AlwaysScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return CategoryCardLayout(
                          categoryModel: categoryCtrl.categoryList[index],
                          index: index,
                          isEven: index.isEven,
                          onTap: () async {
                            categoryCtrl.appCtrl.isShimmer = true;
                            categoryCtrl.appCtrl.update();
                            var data = categoryCtrl.categoryList[index];
                            Get.toNamed(routeName.innerCategory, arguments: data);
                            await Future.delayed(DurationsClass.s1);
                            categoryCtrl.appCtrl.isShimmer = false;
                            categoryCtrl.appCtrl.update();
                            Get.forceAppUpdate();
                          },
                        );
                      },
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
