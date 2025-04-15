import 'package:flutter/cupertino.dart';

import '../../../config.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final productCtrl = Get.put(ProductDetailController());
    return GetBuilder<ProductDetailController>(builder: (_) {
      return Directionality(
        textDirection: productCtrl.appCtrl.isRTL || productCtrl.appCtrl.languageVal == "ar" ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: productCtrl.appCtrl.appTheme.whiteColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: productCtrl.appCtrl.appTheme.whiteColor,
            automaticallyImplyLeading: false,
            leading: Icon(
              CupertinoIcons.arrow_left,
              size: AppScreenUtil().size(25),
              color: productCtrl.appCtrl.appTheme.blackColor,
            ).gestures(onTap: () {
              productCtrl.appCtrl.goToHome();
              Get.back();
            }),
            title: productCtrl.product != null
                ? LatoFontStyle(
                    text: productCtrl.product!.productTitle != null ? productCtrl.product!.productTitle.toString().tr : "",
                    fontSize: FontSizes.f16,
                    fontWeight: FontWeight.w700,
                  )
                : const LatoFontStyle(
                    text: "",
                    fontSize: FontSizes.f16,
                    fontWeight: FontWeight.w700,
                  ),
            actions: const [
              AppBarActionLayout(),
            ],
          ),
          body: productCtrl.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    productCtrl.product != null ? const ProductBody() : Container(),
                    productCtrl.product != null ? const ProductBottom() : Container(),
                  ],
                ),
        ),
      );
    });
  }

  @override
  void dispose() {
    Get.delete<ProductDetailController>();
    super.dispose();
  }
}
