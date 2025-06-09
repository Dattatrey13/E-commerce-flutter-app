import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/models/category/category_model.dart';
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;
import 'package:dapperz/models/product/product_list_model.dart' as plm;
import 'package:get_storage/get_storage.dart';

import '../../config.dart';
import '../../views/pages/filter/filter.dart';

class ShopController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  TextEditingController controller = TextEditingController();
  List<HomeFindStyleCategoryModel> homeShopPageList = [];
  List<cm.Data> categoryList = [];
  List<plm.Data> productList = [];
  CategoryModel? categoryModel;
  final dashboardCtrl = Get.isRegistered<DashboardController>()
      ? Get.find<DashboardController>()
      : Get.put(DashboardController());
  String name = "";
  String listType = "";
  String slug = "";
  final storage = GetStorage();
  BaseApi apiCall = ApiServiceCall();
  bool isLoading = true;
  int totalPage = 1;
  int totalProducts = 1;
  int currentPage = 1;

//  bool brand = false;
  bool lastPage = false;

  bool lastListLoader = false;

  bool isFilterApplied = false;
  String filterString = "";
  String catIdString = "";
  bool? isBrand = false;

  ScrollController? scrollController = ScrollController();
  int listLength = 10;

  @override
  void onInit() {
    addItems();
    super.onInit();
  }

  @override
  void onReady() async {
    name = Get.arguments['name'] ?? "All";
    listType = Get.arguments['cat_id'].toString();
    filterString = Get.arguments['filterString'] ?? "";
    slug = Get.arguments['product_slug'] ?? "";
    if (name == "Search Result") {
      isBrand = false;
      await getProductList(
          currentPage.toString(),
          Get.arguments['cat_id'].toString(),
          "",
          true,
          Get.arguments['filterString'].toString());
    } else if (name == "Recommended For You") {
      isBrand = false;
      await getProductList(currentPage.toString(),
          Get.arguments['cat_id'].toString(), "", false, "");
    } else if (name == "Recommended Products") {
      isBrand = false;
      await getProductList(currentPage.toString(),
          Get.arguments['cat_id'].toString(), slug, false, "");
    } else if (Get.arguments['brand'] == true) {
      isBrand = true;
      await getProductList(currentPage.toString(),
          Get.arguments['cat_id'].toString(), "", false, "",
          brand: true);
    } else {
      isBrand = false;
      await getProductList(currentPage.toString(),
          Get.arguments['cat_id'].toString(), "", false, "");
    }

    await Future.delayed(DurationsClass.s2);
    categoryList = AppArray().categoryList;
    homeShopPageList = AppArray().homeShopPageList;
    appCtrl.isNotification = false;
    appCtrl.update();
    update();
    super.onReady();
  }

  //filter page route
  Route createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Filter(listType: listType, slug: slug),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
      maintainState: false,
    );
  }

  //bottom change
  bottomNavigationChange(val, context) async {
    Get.back();
    Get.back();
    dashboardCtrl.bottomNavigationChange(val, context);
  }

  //go back to home page
  goToHomePage() async {
    if (name == "All".tr) {
      appCtrl.goToHome();
      await storage.write(Session.selectedIndex, 0);
      appCtrl.selectedIndex = 0;
    } else {
      appCtrl.isNotification = false;
      await storage.write(Session.selectedIndex, 1);
      appCtrl.selectedIndex = 1;
    }
    update();
    appCtrl.update();
    Get.back();
  }

  getProductList(String? currentPage, String catId, String catIdString,
      bool? isFilter, String filterString,
      {bool? brand}) async {
    try {
      lastListLoader = true;
      update();
      if (isFilter!) {
        isFilterApplied = true;
        this.filterString = filterString;
        this.catIdString = catIdString;
        productList.clear();
        totalPage = 0;
        totalProducts = 0;
        isLoading = true;
        update();
      }
      String temp = "";
      if (catIdString != "") {
        if (catId == 'recommended_product_by_id') {
          temp = catIdString;
        } else {
          temp = "&category_ids=$catIdString";
        }
      }
      dynamic response;
      if (catId == 'All') {
        response = await apiCall.getResponse(
            "${ApiMethodList.productList}&page=$currentPage$temp$filterString");
      } else if (catId == 'featured_product') {
        response = await apiCall.getResponse(
            "${ApiMethodList.featuredProduct}&page=$currentPage$temp&filter_type=featured$filterString");
      // } else if (catId == 'keychains') {
      //   response = await apiCall.getResponse(
      //       "${ApiMethodList
      //           .keyChainList}&page=$currentPage$temp&filter_type=key_chains$filterString");
      }else if (catId == 'keychains') {
        response = await apiCall.getResponse(
            "${ApiMethodList.keyChainList}?page=$currentPage&page_size=20$filterString");
        } else if (catId == 'on_sale') {
          response = await apiCall.getResponse(
              "${ApiMethodList.keyChainList}&page=$currentPage$temp&filter_type=on_sale$filterString");


    } else if (catId == 'on_recent') {
        response = await apiCall.getResponse(
            "${ApiMethodList.recentProduct}&page=$currentPage$temp&filter_type=recent$filterString");
      } else if (catId == 'recommended_product') {
        response = await apiCall.getResponse(
            "${ApiMethodList.recommendedProduct}&page=$currentPage&filter_type=recommended$temp$filterString");
      } else if (catId == 'recommended_product_by_id') {
        response = await apiCall.getResponse(
            "${ApiMethodList.recommendedProductById}$slug/?page=$currentPage&filter_type=recommended$filterString");
      } else {
        if (catId != "") {
          if (brand == true) {
            temp = "&brand_ids=$catId";
          } else {
            temp = "&category_ids=$catId";
          }
        }
        response = await apiCall.getResponse(
            "${ApiMethodList.productList}&page=$currentPage&page_size=10$temp$filterString");
      }
      productList.addAll(plm.ProductListModel.fromJson(response).data ?? []);
      totalPage = plm.ProductListModel.fromJson(response)
          .pagination!
          .totalPages!
          .toInt();
      totalProducts =
          plm.ProductListModel.fromJson(response).pagination!.count!.toInt();
      isLoading = false;
      lastListLoader = false;
      if (isFilter) {
        update();
      }
      Get.forceAppUpdate();
    } catch (e) {
      isLoading = false;
      if (isFilter ?? false) {
        update();
      }
      rethrow;
    }
  }

  getData() {
    isFilterApplied = true;
    productList.clear();
    totalPage = 0;
    totalProducts = 0;
    isLoading = true;
    getProductList("1", Get.arguments['cat_id'].toString(), catIdString, true,
        filterString,
        brand: isBrand);
    update();
  }

  addItems() async {
    scrollController!.addListener(() {
      if (scrollController!.position.maxScrollExtent ==
          scrollController!.position.pixels) {
        if (currentPage < totalPage) {
          currentPage++;
          getProductList(
              currentPage.toString(),
              Get.arguments['cat_id'].toString(),
              catIdString,
              false,
              filterString,
              brand: isBrand);
        } else {
          lastPage = true;
        }
        update();
      }
    });
  }

  applyFilter(String? catId, String? catIdString, String filterString) {
    HashMap<String, dynamic> params = HashMap();
    params['current_page'] = "1";
    params['cat_id'] = catId!;
    params['cat_id_string'] = catIdString;
    params['filterString'] = filterString;
    Get.back(result: params);
  }
}
