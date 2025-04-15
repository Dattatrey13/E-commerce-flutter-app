import 'package:dapperz/config.dart';
//import 'package:dapperz/models/category/category_model.dart' as cm;
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;

class InnerCategoryController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  cm.Data? categoryModel;
  int index = 0;
  bool expand = false;
  int? tapped = 0;
  List<cm.Children> innerCategoryList = [];
  List innerCategoryProduct = [];
  List innerCategoryBrandList = [];

  @override
  void onReady() {
    categoryModel = Get.arguments;
    innerCategoryList =
        categoryModel != null ? categoryModel!.children ?? [] : [];
    innerCategoryProduct = AppArray().innerCategoryProduct;
    innerCategoryBrandList = AppArray().innerCategoryBrandList;
    update();
    super.onReady();
  }

  //expanded
  expandBox(index) {
    expand =
        ((tapped == null) || ((index == tapped) || !expand)) ? !expand : expand;
    tapped = index;
    update();
  }

  //go to shop page
  goToShopPage(name) {
    appCtrl.isNotification = false;
    appCtrl.update();
    Get.toNamed(routeName.shopPage, arguments: name);
  }
}
