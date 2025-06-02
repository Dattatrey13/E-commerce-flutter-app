import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/cart/add_cart_model.dart';
import 'package:dapperz/models/dashboard/count_model.dart';
import 'package:dapperz/models/product/delete_review_model.dart';
import 'package:dapperz/models/wishlist/add_to_wishlist_model.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:dapperz/views/bottom_navigate_page/cart/cart.dart';
import 'package:dapperz/views/bottom_navigate_page/category/category.dart';
import 'package:dapperz/views/bottom_navigate_page/home/home.dart';
import 'package:dapperz/views/bottom_navigate_page/profile/profile.dart';
import 'package:dapperz/views/bottom_navigate_page/wishlist/wishlist.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/config/session.dart';
import '../../config.dart';

class AppController extends GetxController {
  AppTheme _appTheme = AppTheme.fromType(ThemeType.light);
  bool isLoading = false;
  int selectedIndex = 0;
  bool isTheme = false;
  bool isRTL = false;
  bool isNotificationShow = false;
  String languageVal = "en";
  List bottomList = [];
  bool isSearch = true;
  bool isNotification = false;
  bool isCart = true;
  bool isHeart = true;
  bool isShare = false;
  bool isShimmer = true;
  double rightValue = 15;
  final storage = GetStorage();

  BaseApi apiCall = ApiServiceCall();

  AppTheme get appTheme => _appTheme;
  double rateValue = 0.0;
  String priceSymbol = "₹";

  //list of bottom most page
  List<Widget> widgetOptions = <Widget>[
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const WishlistScreen(),
    const ProfileScreen()
  ];

  @override
  void onReady() async {
    bottomList = AppArray().bottomSheet;
    rateValue = double.parse(AppArray().currencyList[0]['INR'].toString());
    getData();

    super.onReady();
  }

  //go to product detail screen
 goToProductDetail({
  required String slug,
  HomeController? homeCtrl,
}) {
  isNotification = false;
  isSearch = false;
  isCart = true;
  isShare = false;
  isHeart = true;
  update();

Get.toNamed(
  routeName.productDetail,
  arguments: slug,
  preventDuplicates: false,
)?.then((value) {
    homeCtrl?.getRecentItemList();
  });
}


  //go to shop page
  goToShopPage(name) {
    isNotification = false;
    update();
    Get.toNamed(routeName.shopPage, arguments: name);
  }

  //go to home screen
  goToHome() {
    isHeart = true;
    isCart = true;
    isShare = false;
    isSearch = true;
    isNotification = false;
    update();
  }

  //get data from storage
  getData() async {
    String? token = storage.read(Session.isRegularLoginToken);
    bool isLogin = storage.read(Session.isLogin) ?? false;
    String? languageCode = storage.read(Session.languageCode);
    languageVal = storage.read(Session.languageCode) ?? 'en';
    String? countryCode = storage.read(Session.countryCode);

    if (languageCode != null && countryCode != null) {
      var locale = Locale(languageCode, countryCode);
      Get.updateLocale(locale);
    } else {
      Get.updateLocale(Get.deviceLocale ?? const Locale('en', 'US'));
    }
    update();

    //theme check
    bool loadThemeFromStorage = storage.read('isDarkMode') ?? false;
    if (loadThemeFromStorage) {
      isTheme = true;
    } else {
      isTheme = false;
    }

    if (isLogin && token != null && token.isNotEmpty) {
      print("User is logged in with token: $token");
      UserSingleton().token = token;
      // Load user info from storage if needed
    } else {
      print("User not logged in or token missing");
    }

    update();
    await storage.write("isDarkMode", isTheme);
    ThemeService().switchTheme(isTheme);
    Get.forceAppUpdate();

    await storage.read('isDarkMode');
  }

  //update theme
  updateTheme(theme) {
    _appTheme = theme;
    Get.forceAppUpdate();
  }

  Future<bool?> addItemToWishlist(HashMap<String, dynamic> params) async {
    try {
      dynamic response = await apiCall.postRequest(
          ApiMethodList.createWishListForUser, params);
      if (AddToWishlistModel.fromJson(response).success ?? false) {
        getWishlistCount();
      }
      return AddToWishlistModel.fromJson(response).success ?? false;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> removeItemFromWishList(String id) async {
    try {
      dynamic response = await apiCall
          .deleteRequest("${ApiMethodList.removeItemWishListForUser}$id/");
      if (DeleteReviewModel.fromJson(response).success ?? false) {
        getWishlistCount();
      }
      return DeleteReviewModel.fromJson(response).success ?? false;
    } catch (e) {
      rethrow;
    }
  }

  // Future<AddCartModel> addToCart(HashMap<String, dynamic> params) async {
  //   try {
  //     dynamic response =
  //         await apiCall.postRequest(ApiMethodList.userAddCart, params);
  //     if (AddCartModel.fromJson(response).success ?? false) {
  //       getCartCount();
  //     }
  //     print("Cart Response: $response");
  //     print("Params being sent: $params");
  //     return AddCartModel.fromJson(response);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  Future<AddCartModel?> addToCart(HashMap<String, dynamic> params) async {
    try {
      final response = await apiCall.postRequest(ApiMethodList.userAddCart, params);

      print("Add to Cart - Params: $params");
      print("Add to Cart - Response: $response");

      final model = AddCartModel.fromJson(response);
      if (model.success ?? false) {
        getCartCount();
      }

      print("Add to Cart - Params: ${params.toString()}");
      return model;
    } catch (e, stackTrace) {
      print("Error in addToCart: $e");
      print("StackTrace: $stackTrace");
      return null; // Optional: or rethrow if you want to handle it at a higher level
    }
  }


  getWishlistCount() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.wishlistCount);
      UserSingleton().wishListCount =
          (CountModel.fromJson(response).data!.total ?? 0).toInt();
      Get.forceAppUpdate();
    } catch (e) {
      rethrow;
    }
  }

  getCartCount() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.cartCount);
      UserSingleton().cartCount =
          (CountModel.fromJson(response).data!.total ?? 0).toInt();
      Get.forceAppUpdate();
    } catch (e) {
      rethrow;
    }
  }

  getGuestCartCount() async {
    try {
      dynamic response =
          await apiCall.getResponse(ApiMethodList.guestCartCount);
      UserSingleton().cartCount =
          (CountModel.fromJson(response).data!.total ?? 0).toInt();
      Get.forceAppUpdate();
    } catch (e) {
      rethrow;
    }
  }
}
