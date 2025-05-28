import 'dart:collection';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/models/cart/add_cart_model.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../config.dart';

class ProductBottom extends StatelessWidget {
  const ProductBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return GetBuilder<AppController>(
        builder: (appCtrl) {
          return Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(
                vertical: AppScreenUtil().screenHeight(12),
                horizontal: AppScreenUtil().screenWidth(15)),
            decoration: BoxDecoration(
              color: appCtrl.appTheme.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: appCtrl.appTheme.lightGray,
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: const Offset(0, 7), // changes position of shadow
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  productCtrl.product != null &&
                          ((productCtrl.product!.isFeatured ?? false) ||
                              productCtrl.outOfStock == "outofstock")
                      ? Container()
                      : Expanded(
                          child: InkWell(
                            onTap: () async {
                              HashMap<String, dynamic> params = HashMap();
                              params['productId'] =
                                  productCtrl.product!.id.toString();
                              params['quantity'] =
                                  productCtrl.quantity.toString();
                              if (productCtrl.selectedIndex.isNotEmpty) {
                                if (productCtrl.selectedIndex.contains(-1)) {
                                  Fluttertoast.showToast(
                                      msg: "Please Select Variant");
                                  return;
                                }
                                params['variationId'] =
                                    productCtrl.selectedVariationId;
                              }
                              AddCartModel? status =
                                  await appCtrl.addToCart(params);
                              if (status?.data != null &&
                                  status?.success != null &&
                                  status?.data!.productId != null) {
                                Fluttertoast.showToast(
                                    msg: "Product Added to Cart Successfully");
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Unable to Add Item to Cart");
                              }
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_bag),
                                Space(10, 0),
                                LatoFontStyle(
                                    text: "Add To Cart",
                                    fontWeight: FontWeight.w600,
                                    fontSize: FontSizes.f14)
                              ],
                            ),
                          ),
                        ),
                  VerticalDivider(color: appCtrl.appTheme.greyLight25),
                  Expanded(
                    child: productCtrl.product != null &&
                            ((productCtrl.product!.isFeatured ?? false) ||
                                productCtrl.outOfStock == "outofstock")
                        ? InkWell(
                            onTap: () async {
                              Get.toNamed(routeName.getACall);
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.call),
                                Space(10, 0),
                                LatoFontStyle(
                                    text: "Get a call",
                                    fontWeight: FontWeight.w600,
                                    fontSize: FontSizes.f14)
                              ],
                            ),
                          )
                        : InkWell(
                            onTap: () async {
                              if (UserSingleton().isGuest ?? false) {
                                Get.forceAppUpdate();
                                Get.offAllNamed(routeName.login);
                              } else {
                                HashMap<String, dynamic> params = HashMap();
                                params['product_id'] =
                                    productCtrl.product!.id.toString();
                                params['quantity'] =
                                    productCtrl.quantity.toString();
                                params['is_buy_now'] = "true";
                                if (productCtrl.selectedIndex.isNotEmpty) {
                                  if (productCtrl.selectedIndex.contains(-1)) {
                                    Fluttertoast.showToast(
                                        msg: "Please Select Variant");
                                    return;
                                  }
                                  params['variation_id'] =
                                      productCtrl.selectedVariationId;
                                }
                                AddCartModel? status =
                                    await appCtrl.addToCart(params);
                                if (status?.data != null &&
                                    status?.success != null &&
                                    status?.data!.productId != null) {
                                  showProgressDialog(true);
                                  productCtrl.getCartDetails();
                                } else {}
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                UserSingleton().isGuest!
                                    ? Container()
                                    : const IgnorePointer(child: BuyIcon()),
                                UserSingleton().isGuest!
                                    ? Container()
                                    : const Space(10, 0),
                                LatoFontStyle(
                                    text: UserSingleton().isGuest!
                                        ? "LOGIN"
                                        : ProductDetailFont().placeOrder,
                                        // : ProductDetailFont().addToBag,
                                    fontWeight: FontWeight.w600,
                                    fontSize: FontSizes.f14)
                              ],
                            ),
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
