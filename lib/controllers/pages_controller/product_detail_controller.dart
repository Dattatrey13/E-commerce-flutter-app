import 'dart:collection';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:dapperz/api/api_config.dart';
import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/models/form_submit_model.dart';
import 'package:dapperz/models/product/create_review_model.dart';
import 'package:dapperz/models/product/product_list_model.dart' as plm;
import 'package:dapperz/models/product/product_review_list_model.dart' as prl;
import 'package:dapperz/user_singleton.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../common/array/cart_array.dart';
import '../../config.dart';
import '../../models/cart/cart_list_model.dart';
import '../../models/order/get_cart_total.dart';
import '../../models/product/delete_review_model.dart';
import '../../models/product/product_detail_model.dart' as pm;
import '../../models/cart/add_cart_model.dart';
import 'package:get_storage/get_storage.dart';

class ProductDetailController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final storage = GetStorage();
  CartModel? cartModelList;

  TextEditingController controller = TextEditingController();
  pm.Data? product;
  List<prl.Data>? productReview;
  List<String> imagesList = [];
  late String url;
  int current = 0;
  List reviewList = [];
  int currentLast = 0;
  int selectedColor = 0;
  int quantity = 1;
  int? productId;
  String slug = "";
  // String Slug  = "";
  num? selectedVariationId;

  double reviewStar = 0.0;
  TextEditingController reviewController = TextEditingController();

  final CarouselSliderController sliderController = CarouselSliderController();
  List<plm.Data> recommendedForYouList = [];
  List<plm.Data> recentlyViewedList = [];

  int colorSelected = 1;
  BaseApi apiCall = ApiServiceCall();

  bool? reviewSubmitted = false;
  List<pm.AttributeMapping> attributes = [];
  List<pm.ProductVariations> productVariation = [];
  pm.ProductVariations? selectedVariation;
  List<int> selectedIndex = [];
  bool optionSelected = false;
  String newPrice = "";
  String outOfStock = "";
  bool isLoading = true;

  @override
  void onReady() async {
  super.onReady();

  final String slug = Get.arguments as String;

  if (slug.isEmpty) {
    print("Error: Slug is empty");
    return; // Early exit if slug is invalid
  }

  reviewStar = 0.0;
  reviewController.text = "";

  await Future.delayed(DurationsClass.s1);

  await getDetails(slug);

  if (UserSingleton().redirectProductPage ?? false) {
    UserSingleton().redirectProductPage = false;
    UserSingleton().slug = '';
  }

  isLoading = false; // Set loading to false after data fetching
  update();
}


getDetails(String slug) async {
  await getProductDetails(slug);
  await getProductReview("3", slug);
  await getRecommendedProductList(slug);
  // await getNewArrivalProductList(slug);
  if (UserSingleton().token != null) {
    await getRecentProduct("1");
  }
}

  //on quantity increase
  quantityIncrease() {
    int val = quantity;
    val++;
    quantity = val;
    update();
  }

  //on quantity decrease
  quantityDecrease() {
    int val = quantity;
    val--;
    if (quantity <= 1) {
      quantity = 1;
    } else {
      quantity = val;
    }
    update();
  }

  getProductDetails(String slug ) async {
    try {
      dynamic response =
          // ignore: unnecessary_brace_in_string_interps
          await apiCall.getResponse("${ApiMethodList.productByslug}${slug}/");
        print("Fetching product by slug: $slug");
      print(
          "ProductDetalis API Response: ${response.toString()}"); // Print raw response to check if it is valid

      // Ensure response is a Map before decoding
      if (response is! Map<String, dynamic>) {
        throw Exception("Invalid response format: not JSON");
      }

      print("product Details Response: $response");
      product = pm.ProductDetailModel.fromJson(response).data;

      product = pm.ProductDetailModel.fromJson(response).data;
      if (product != null && product!.attributeMapping != null) {
        attributes.addAll(product!.attributeMapping!);
        productVariation.addAll(product!.productVariations!);
        url =
            "Check out product ${ApiConfig.baseUrlWeb}product/${product!.slug}/?product-id=${product!.slug}";
      }
      if (product != null && product!.imageIds != null) {
        for (int i = 0; i < product!.imageIds!.length; i++) {
          imagesList.add(product!.imageIds![i].url!);
        }
      }
      for (int i = 0; i < attributes.length; i++) {
        selectedIndex.add(-1);
      }
    } catch (e) {
      rethrow;
    }
  }

  getProductReview(String pageSize, String slug) async {
    try {
      dynamic response = await apiCall.getResponse(
          "${ApiMethodList.getProductReview}$slug/?page_size=$pageSize");
      productReview = prl.ProductReviewListModel.fromJson(response).data!;
    } catch (e) {
      rethrow;
    }
  }

  getDescription(String text) {
    List<String> lines = text.split("\r\n");
    if (lines.length == 1) {
      lines.clear();
      lines.addAll(text.split("\n"));
    }
    return lines.map((line) {
      if (line.isEmpty || line == '&nbsp;') {
        return Container();
      }
      return HtmlWidget(
        line
            .replaceAll("\t", "  ")
            .replaceAll("<p><b>Product Description:</b></p>", ""),
        textStyle: const TextStyle(overflow: TextOverflow.ellipsis),
      );
      //return ProductDetailWidget().descriptionText(line);
    }).toList();
  }

  submitReview() async {
    try {
      reviewSubmitted = true;
      update();
      HashMap<String, dynamic> params = HashMap();
      //params['post_id'] = slug;
      params['review'] = reviewController.text.trim();
      params['rating'] = reviewStar;
      dynamic response = await apiCall.postRequest(
          "${ApiMethodList.productCreateReview}/product_id/", params);
      bool status = CreateReviewModel.fromJson(response).success ?? false;
      if (status) {
        reviewStar = 0.0;
        reviewController.text = "";
        Fluttertoast.showToast(msg: "Review Posted Successfully");
      } else {
        Fluttertoast.showToast(msg: "Review Doesn't Post");
      }
      reviewSubmitted = false;
      isLoading = true;
      update();
      await getDetails(product?.slug ?? "");
      if (UserSingleton().redirectProductPage ?? false) {
        UserSingleton().redirectProductPage = false;
        UserSingleton().slug = '';
      }
      isLoading = false;
      update();
    } catch (e) {
      Fluttertoast.showToast(msg: "Review Doesn't Post");
      reviewSubmitted = false;
      update();
      rethrow;
    }
  }

  deleteReview(String id, prl.Data? review) async {
    try {
      dynamic response =
          await apiCall.deleteRequest("${ApiMethodList.deleteReview}$id/");
      if (DeleteReviewModel.fromJson(response).success == false) {
        Fluttertoast.showToast(msg: "Unable to delete your review");
      } else {
        reviewList.remove(review);
        Fluttertoast.showToast(msg: "Review deleted Successfully");
      }
      await getDetails(slug);
      isLoading = false;
      update();
      // Get.forceAppUpdate();
    } catch (e) {
      Fluttertoast.showToast(msg: "unable to delete your review");
      reviewSubmitted = false;
      update();
      rethrow;
    }
  }

  setVariable(String value) async {
    for (var element in productVariation) {
      for (var name in element.termsIds ?? []) {
        if (value == name.termName) {
          selectedVariationId = element.id;
          selectedVariation = element;
          // newPrice = element.price ?? '0'; // Safely set a fallback value
          outOfStock = element.stockStatus ?? "out_of_stock";
          update();
          return; // stop loop once found
        }
      }
    }
  }


  getACallSubmit(HashMap<String, dynamic> params) async {
    try {
      dynamic response = await apiCall.uploadImageWithDataRequest(
          ApiMethodList.productGetACall, params, []);
      return FormSubmitModel.fromJson(response).success ?? false;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to Submit Request");
      rethrow;
    }
  }

  getRecommendedProductList(String? slug) async {
    recommendedForYouList.clear();
    try {
      dynamic response = await apiCall
          .getResponse("${ApiMethodList.recommendedProductById}$slug/");
      recommendedForYouList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
    } catch (e) {
      rethrow;
    }
  }
// getNewArrivalProductList(String? slug) async {
//     recommendedForYouList.clear();
//     try {
//       dynamic response = await apiCall
//           .getResponse("${ApiMethodList.NewArrivalProductById}$slug/");
//       recommendedForYouList
//           .addAll(plm.ProductListModel.fromJson(response).data ?? []);
//       print("Fetched NewArrival: ${response}");
//
//     } catch (e) {
//       rethrow;
//     }
//   }

  getRecentProduct(String currentPage) async {
    try {
      dynamic response = await apiCall
          .getResponse("${ApiMethodList.recentProduct}?page=$currentPage");
      recentlyViewedList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
    } catch (e) {
      rethrow;
    }
  }

  getCartTotal() async {
    try {
      dynamic response = await apiCall
          .getResponse("${ApiMethodList.userCartTotal}?is_buy_now=true");
      print("Cart Total Response: $response");
      cartTotal = GetCartTotal.fromJson(response);
      showProgressDialog(false);
      if (cartTotal.data != null) {
        UserSingleton().isBuyNow = true;
        appCtrl.isHeart = false;
        appCtrl.update();
        Get.toNamed(routeName.deliveryDetail,
            arguments: cartTotal.data!.total.toString());
      } else {
        Fluttertoast.showToast(msg: "Unable to Buy Product");
      }
    } catch (e) {
      rethrow;
    }
  }

  getCartDetails() async {
    try {
      dynamic response = await apiCall
          .getResponse("${ApiMethodList.getUserCartDetails}?is_buy_now=true");
      print("Cart Response in ProsuctDetalis page: $response");
      cartList = CartListModel.fromJson(response);
      await getCartTotal();
    } catch (e) {
      rethrow;
    }
  }
}
