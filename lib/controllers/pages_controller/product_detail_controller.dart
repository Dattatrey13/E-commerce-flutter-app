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

class ProductDetailController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

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
  String productId = "";
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
    productId = Get.arguments;
    reviewStar = 0.0;
    reviewController.text = "";
    await Future.delayed(DurationsClass.s1);
    await getDetails(productId);
    if (UserSingleton().redirectProductPage ?? false) {
      UserSingleton().redirectProductPage = false;
      UserSingleton().productId = '';
    }
    isLoading = false;
    update();
    super.onReady();
  }

  getDetails(String productId) async {
    await getProductDetails(productId);
    await getProductReview("3", productId);
    await getRecommendedProductList(productId);
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

  getProductDetails(String productId) async {
    try {
      dynamic response =
          await apiCall.getResponse("${ApiMethodList.productById}$productId/");
      product = pm.ProductDetailModel.fromJson(response).data;
      if (product != null && product!.attributeMapping != null) {
        attributes.addAll(product!.attributeMapping!);
        productVariation.addAll(product!.productVariations!);
        url =
            "Check out product ${ApiConfig.baseUrlWeb}product/${product!.productSlug}/?product-id=${product!.id}";
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

  getProductReview(String pageSize, String productId) async {
    try {
      dynamic response = await apiCall.getResponse(
          "${ApiMethodList.getProductReview}$productId/?page_size=$pageSize");
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
      //params['post_id'] = productId;
      params['review'] = reviewController.text.trim();
      params['rating'] = reviewStar;
      dynamic response = await apiCall.postRequest(
          "${ApiMethodList.productCreateReview}$productId/", params);
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
      await getDetails(productId);
      if (UserSingleton().redirectProductPage ?? false) {
        UserSingleton().redirectProductPage = false;
        UserSingleton().productId = '';
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
      await getDetails(productId);
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
      for (var name in element.termsIds!) {
        if (value == name.termName) {
          selectedVariationId = element.id;
          selectedVariation = element;
          newPrice = element.price!;
          outOfStock = element.stockStatus!;
          update();
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

  getRecommendedProductList(String? productId) async {
    recommendedForYouList.clear();
    try {
      dynamic response = await apiCall
          .getResponse("${ApiMethodList.recommendedProductById}$productId/");
      recommendedForYouList
          .addAll(plm.ProductListModel.fromJson(response).data ?? []);
    } catch (e) {
      rethrow;
    }
  }

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
      cartList = CartListModel.fromJson(response);
      await getCartTotal();
    } catch (e) {
      rethrow;
    }
  }
}
