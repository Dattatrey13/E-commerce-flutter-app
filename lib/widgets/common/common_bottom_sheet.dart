import '../../config.dart';

class CommonBottomSheet extends StatelessWidget {
  final String? text;
  final GestureTapCallback? onTap;

  const CommonBottomSheet({Key? key, this.text, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              LatoFontStyle(text: "$text", fontSize: FontSizes.f14, fontWeight: FontWeight.w700, color: appCtrl.appTheme.blackColor),
              Visibility(
                visible: text == CommonTextFont().moveToWishList || text == CommonTextFont().moveToCart,
                child: LatoFontStyle(
                  text: text == CommonTextFont().moveToWishList
                      ? CommonTextFont().moveToWishListDesc
                      : text == CommonTextFont().moveToCart
                          ? CommonTextFont().removeDesc
                          : " ",
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w600,
                  color: appCtrl.appTheme.contentColor,
                  overflow: TextOverflow.clip,
                ),
              )
            ],
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          Container(
            width: MediaQuery.of(Get.context!).size.width,
            padding: EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(12), horizontal: AppScreenUtil().screenWidth(15)),
            decoration: BoxDecoration(
              color: appCtrl.appTheme.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: appCtrl.appTheme.lightGray,
                  spreadRadius: 10,
                  blurRadius: 5,
                  offset: const Offset(0, 7), // changes position of shadow
                )
              ],
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: LatoFontStyle(
                      text: text == CommonTextFont().moveToWishList || text == CommonTextFont().moveToCart
                          ? CommonTextFont().remove.toUpperCase()
                          : "No",
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizes.f14,
                    ),
                  ),
                  VerticalDivider(color: appCtrl.appTheme.greyLight25),
                  GestureDetector(
                    onTap: onTap,
                    child: LatoFontStyle(
                      text: text == CommonTextFont().moveToWishList
                          ? CommonTextFont().moveToCart.toUpperCase()
                          : text == CommonTextFont().moveToCart
                              ? CommonTextFont().moveToWishList.toUpperCase()
                              : "Yes",
                      color: appCtrl.appTheme.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: FontSizes.f14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ).height(AppScreenUtil().screenHeight(150));
    });
  }
}
