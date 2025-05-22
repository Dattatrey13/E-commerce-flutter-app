import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/main.dart';
import 'package:dapperz/models/dashboard/brands_model.dart' as bm;
import 'package:dapperz/models/dashboard/count_model.dart';
import 'package:dapperz/models/dashboard/parent_category_model.dart' as pcm;
import 'package:dapperz/models/order/get_all_coupons_model.dart';
import 'package:dapperz/models/product/get_location_list_model.dart' as gllm;
import 'package:dapperz/models/product/product_list_model.dart' as plm;
import 'package:dapperz/user_singleton.dart';
import 'package:dapperz/views/bottom_navigate_page/home/city_selection_dialog.dart';
import 'package:get_storage/get_storage.dart';

import '../../api/api_method_list.dart';
import '../../config.dart';

class HomeController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final storage = GetStorage();
  double loginWidth = 40.0;
  double loginHeight = 40.0;

  List<pcm.Data> homeCategoryList = [];
  List<dynamic> slidersList = [];
  List<dynamic> discountForYouList = [];

  List<plm.Data> featuredCategoriesList = [];
  List<bm.Data> brandsList = [];
  List<plm.Data> recommendedForYouList = [];
  List<plm.Data> bestSellingProductList = [];
  List<plm.Data> onSaleProductList = [];
  List<plm.Data> recentlyViewedList = [];
  List<gllm.Children> locationList = [];

  List<HomeBannerModel> bannerList = [];
  List<HomeDealOfTheDayModel> dealOfTheDayList = [];

  // List sliderDataList = [];
  List offerCornerList = [];
  List<HomeFindStyleCategoryModel> findStyleCategoryList = [];
  List<HomeFindStyleCategoryModel> findStyleCategoryCategoryWiseList = [];
  List<HomeFindStyleCategoryModel> homeKidsCornerList = [];
  int current = 0;
  List<int> selectedStyleCategory = [0];
  bool selected = false;

  GetAllCouponsModel? getAllCouponsModel;

  BaseApi apiCall = ApiServiceCall();

  late PageController pageController;

List<String> images = [
  'assets/image/home_5.png',
  'assets/image/home_1.png',
  'assets/image/home_2.png',
];

  @override
  void onReady() async {
    pageController = PageController(viewportFraction: 0.8);
    await getData(getLocation: true);
    super.onReady();
  }



//   // get data list
//   getData({bool getLocation = false}) async {
//   appCtrl.isShimmer = true;
//   appCtrl.update();
//   homeCategoryList.clear();
//   featuredCategoriesList.clear();
//   recommendedForYouList.clear();
//   bestSellingProductList.clear();
//   onSaleProductList.clear();
//
//   try {
//     if (!UserSingleton().isGuest!) {
//       await getRecommendedProductList("1");
//       update();
//     }
//
//     await getFeaturedCategoryList("1");
//     update();
//
//
//     await getBestSellingList("1");
//     update();
//
//     await getOnSaleList("1");
//     update();
//   } catch (e) {
//     print("⚠️ Error loading product data: $e");
//   }
//   print("Home data: $getData");
//
//   appCtrl.isShimmer = false;
//   appCtrl.update();
// }

  getData({bool getLocation = false}) async {
    appCtrl.isShimmer = true;
    appCtrl.update();
    homeCategoryList.clear();
    slidersList.clear();
    discountForYouList.clear();
    featuredCategoriesList.clear();
    brandsList.clear();
    recommendedForYouList.clear();
    bestSellingProductList.clear();
    onSaleProductList.clear();
    recentlyViewedList.clear();

    if (!UserSingleton().isGuest!) {
      await getRecommendedProductList("1");
      update();
      await getRecentProduct("1");
      update();
    }
    await getParentCategoryList();
    update();
    await getFeaturedCategoryList("1");
    update();
    // await getBrandsList();
    // update();
    await getBestSellingList("1");
    update();
    await getOnSaleList("1");
    update();
    await getWishlistCount();
    await getCartCount();
    await getCouponsList();
    bannerList = AppArray().homeBanner;
    dealOfTheDayList = AppArray().homeDealOfTheDayList;
    findStyleCategoryList = AppArray().homeFindStyleCategoryList;
    offerCornerList = AppArray().offerCornerList;
    loginWidth = ScreenUtil().screenWidth;
    loginHeight = 500.w;
    update();
    // subCategoryList(0, 1);
    // update();
    await Future.delayed(const Duration(milliseconds: 500));
    appCtrl.isShimmer = false;
    appCtrl.update();
    Get.forceAppUpdate();
  }

  getParentCategoryList() async {
    try {
      dynamic response =
          await apiCall.getResponse(ApiMethodList.parentCategory);
      homeCategoryList
          .addAll(pcm.ParentCategoryModel.fromJson(response).data ?? []);
      AppArray()
          .homeCategory
          .addAll(pcm.ParentCategoryModel.fromJson(response).data ?? []);
      print("Parent Category in home: $response");
    } catch (e) {
      rethrow;
    }
  }

  getFeaturedCategoryList(String currentPage) async {
    try {
      dynamic response = await apiCall.getResponse(
          "${ApiMethodList.featuredProduct}&page=$currentPage&filter_type=featured");
      featuredCategoriesList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
      AppArray()
          .featuredProductList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
    } catch (e) {
      rethrow;
    }
  }

  getRecommendedProductList(String currentPage) async {
    try {
      dynamic response = await apiCall.getResponse(
          "${ApiMethodList.recommendedProduct}&page=$currentPage&filter_type=recommended");
      recommendedForYouList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
      AppArray()
          .recommendedList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
    } catch (e) {
      rethrow;
    }
  }

  getBrandsList() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.brandList);
      brandsList.addAll(bm.BrandsModel.fromJson(response).data ?? []);
      AppArray()
          .homeBrandList
          .addAll(bm.BrandsModel.fromJson(response).data ?? []);
    } catch (e) {
      rethrow;
    }
  }

  getBestSellingList(String currentPage) async {
    try {
      dynamic response = await apiCall.getResponse(
          "${ApiMethodList.bestSellingList}&page=$currentPage&filter_type=best_selling");
      bestSellingProductList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
      AppArray()
          .bestSellingList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
    } catch (e) {
      rethrow;
    }
  }

  getOnSaleList(String currentPage) async {
    try {
      dynamic response = await apiCall.getResponse(
          "${ApiMethodList.bestSellingList}&page=$currentPage&filter_type=on_sale");
      onSaleProductList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
      AppArray()
          .onSaleList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
    } catch (e) {
      rethrow;
    }
  }

  getRecentProduct(String currentPage) async {
    try {
      dynamic response = await apiCall.getResponse(
          "${ApiMethodList.recentProduct}&page=$currentPage&filter_type=recent");
      recentlyViewedList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
      AppArray()
          .recentlyViewedList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
    } catch (e) {
      rethrow;
    }
  }

  getCartCount() async {
    try {
      dynamic response = UserSingleton().token != null
          ? await apiCall.getResponse(ApiMethodList.cartCount)
          : await apiCall.getResponse(ApiMethodList.guestCartCount);
      UserSingleton().cartCount =
          (CountModel.fromJson(response).data!.total ?? 0).toInt();
    } catch (e) {
      rethrow;
    }
  }

  getWishlistCount() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.wishlistCount);
      print("WishList is Home: $response");
      UserSingleton().wishListCount =
          (CountModel.fromJson(response).data!.total ?? 0).toInt();
    } catch (e) {
      rethrow;
    }
  }

  getLocationList() async {
    try {
      showProgressDialog(true);
      locationList.clear();
      dynamic response = await apiCall
          .getResponse("${ApiMethodList.locationList}?is_main=true");
      for (var element in gllm.GetLocationListModel.fromJson(response)
          .data!
          .first
          .children!) {
        locationList.addAll(element.children ?? []);
      }
      showProgressDialog(false);
      var data = await Get.dialog(CitySelectionDialog(cities: locationList));
      if (data != null && data) {
        update();
      }
    } catch (e) {
      rethrow;
    }
  }

  getRecentItemList() async {
    if (UserSingleton().token != null) {
      appCtrl.isShimmer = true;
      appCtrl.update();
      recentlyViewedList.clear();
      await getRecentProduct("1");
      appCtrl.isShimmer = false;
      appCtrl.update();
      update();
    }
  }

  Future getCouponsList() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.getAllCoupons);
      getAllCouponsModel = GetAllCouponsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

//add to wishlist
  Future<bool?> addToWishList(index, val) async {
    dealOfTheDayList[index].isFav = !val;
    update();
    return dealOfTheDayList[index].isFav;
  }

//sub category list by category id
  subCategoryList(index, categoryId) async {
    loginWidth = 40.0;
    loginHeight = 40.0;

    update();
    await Future.delayed(DurationsClass.s1);
    selected = !selected;
    findStyleCategoryCategoryWiseList = [];
    selectedStyleCategory.add(index);

    update();
    for (var i = 0; i < findStyleCategoryList.length; i++) {
      if (categoryId.toString() ==
          findStyleCategoryList[i].categoryId.toString()) {
        findStyleCategoryCategoryWiseList.add(findStyleCategoryList[i]);
      }
    }
    loginWidth = ScreenUtil().screenWidth;
    loginHeight = 500.w;
    update();
  }
}
