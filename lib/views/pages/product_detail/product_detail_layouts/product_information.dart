import 'dart:collection';

import 'package:dapperz/common_methods.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../config.dart';

class ProductInformation extends StatefulWidget {
  const ProductInformation({Key? key}) : super(key: key);

  @override
  State<ProductInformation> createState() => _ProductInformationState();
}

class _ProductInformationState extends State<ProductInformation> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      // Get selected variation (if any)
      final selectedVariation = productCtrl.selectedVariation;

      final isOnSale = selectedVariation != null
          ? selectedVariation.isOnSale == true &&
          selectedVariation.salePrice != selectedVariation.regularPrice &&
          selectedVariation.salePrice != ""
          : productCtrl.product!.isOnSale == true &&
          productCtrl.product!.salePrice != productCtrl.product!.regularPrice &&
          productCtrl.product!.salePrice != "";

      final salePrice = selectedVariation?.salePrice ?? productCtrl.product!.salePrice;
      final regularPrice = selectedVariation?.regularPrice ?? productCtrl.product!.regularPrice;
      final discount = selectedVariation?.discountPercentage?.toString() ??
          productCtrl.product!.discountPercentage.toString();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image list with share button
          Stack(
            alignment: Alignment.topRight,
            children: [
              const ImageListLayout(),
              GestureDetector(
                onTap: () async {
                  await Share.share(productCtrl.url);
                },
                child: Container(
                  width: AppScreenUtil().screenWidth(30),
                  height: AppScreenUtil().screenHeight(30),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppScreenUtil().size(5),
                    vertical: AppScreenUtil().size(5),
                  ),
                  decoration: BoxDecoration(
                    color: appCtrl.appTheme.bgColor,
                    shape: BoxShape.circle,
                  ),
                  child: const ShareIcon(),
                ).paddingOnly(
                  top: AppScreenUtil().screenHeight(10),
                  right: AppScreenUtil().screenWidth(15),
                ),
              ),
            ],
          ),

          // Product Title
          ProductDetailWidget().commonText(
            text: productCtrl.product!.productTitle.toString().tr,
            fontSize: FontSizes.f16,
          ),

          const SizedBox(height: 10),

          // Short description
          Padding(
            padding: EdgeInsets.only(left: AppScreenUtil().screenWidth(5)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: productCtrl.getDescription(
                productCtrl.product!.productShortDescription != ""
                    ? productCtrl.product!.productShortDescription.toString()
                    : "No Description Available",
              ),
            ).marginOnly(left: AppScreenUtil().screenWidth(10)),
          ),

          const SizedBox(height: 10),

          const RatingLayout(),

          // Price layout (only if not featured)
          if (!(productCtrl.product?.isFeatured ?? false))
            PriceLayout(
              totalPrice: isOnSale ? salePrice : null,
              mrp: regularPrice,
              discount: discount,
              fontSize: FontSizes.f16,
              isBold: false,
              isDiscountShow: productCtrl.product!.discountPercentage != 0.0 &&
                  productCtrl.product!.discountPercentage != null,
            ).marginOnly(
              left: AppScreenUtil().screenWidth(10),
              right: AppScreenUtil().screenWidth(10),
            ),

          // Inclusive of all taxes
          if (!(productCtrl.product?.isFeatured ?? false))
            ProductDetailWidget().inclusiveTax(
              "- ${ProductDetailFont().inclusiveOfAllTaxes}",
            ),

          // Wishlist Icon
          InkWell(
            child: GestureDetector(
              onTap: () async {
                HashMap<String, dynamic> params = HashMap();
                params['product_id'] = productCtrl.product!.id!.toString();
                bool? addstatus = await appCtrl.addItemToWishlist(params);
                if (addstatus != null && addstatus) {
                  Fluttertoast.showToast(
                    msg: productCtrl.product!.isInWishlist!
                        ? "Item removed from wishlist"
                        : "Item added to Wishlist",
                  );
                  productCtrl.product!.setIsInWishlist =
                  !productCtrl.product!.isInWishlist!;
                  productCtrl.update();
                } else {
                  Fluttertoast.showToast(
                    msg: productCtrl.product!.isInWishlist!
                        ? "Unable to remove product from Wishlist"
                        : "Unable to add product to Wishlist",
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: productCtrl.product!.isInWishlist! ? 20 : 15,
                    width: 25,
                    child: productCtrl.product!.isInWishlist!
                        ? const LinkHeartIcon(onTap: null, isLiked: true)
                        : HeartIcon(color: appCtrl.appTheme.blackColor),
                  ),
                  const Space(10, 0),
                  LatoFontStyle(
                    text: productCtrl.product!.isInWishlist!
                        ? "Added to Wishlist".tr
                        : "Add to Wishlist".tr,
                    fontWeight: FontWeight.w600,
                    fontSize: FontSizes.f12,
                  ),
                ],
              ).marginOnly(right: 20, bottom: 20),
            ),
          ),

          const BorderLineLayout(),

          // Product size (if not featured and has variations)
          if (!(productCtrl.product?.isFeatured ?? false) &&
              productCtrl.attributes.isNotEmpty &&
              productCtrl.productVariation.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: productCtrl.attributes.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductSizeLayout(
                  product: productCtrl.attributes[index],
                  index: index,
                );
              },
            ),

          // Quantity
          ProductDetailWidget().commonText(
            text: ProductDetailFont().quantity,
            fontSize: FontSizes.f14,
          ),

          const QuantityIncDec(),

          const BorderLineLayout(),

          // Product Description
          ProductDetailWidget().commonText(
            text: "Product Description:",
            fontSize: FontSizes.f14,
          ),

          const SizedBox(height: 10),

          AnimatedSize(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            child: Container(
              child: productCtrl.product!.productLongDescription != ""
                  ? ConstrainedBox(
                constraints: _isExpanded
                    ? const BoxConstraints()
                    : const BoxConstraints(maxHeight: 100),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(5)),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: productCtrl.getDescription(
                      productCtrl.product!.productLongDescription
                          .toString(),
                    ),
                  ),
                ),
              )
                  : Container(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  children: productCtrl
                      .getDescription("No Description Available"),
                ),
              ),
            ).marginOnly(
              left: AppScreenUtil().screenWidth(10),
              right: AppScreenUtil().screenWidth(5),
            ),
          ),

          const SizedBox(height: 10),

          Visibility(
            visible: productCtrl.product!.productLongDescription != "",
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  _isExpanded = !_isExpanded;
                  setState(() {});
                },
                child: Text(
                  _isExpanded ? "Show Less" : "Show More",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ).marginOnly(right: AppScreenUtil().screenWidth(15)),
          ),

          const SizedBox(height: 15),

          const BorderLineLayout(),
        ],
      );
    });
  }
}
