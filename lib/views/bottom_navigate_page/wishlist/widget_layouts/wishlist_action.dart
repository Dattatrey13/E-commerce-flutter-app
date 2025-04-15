import 'package:dapperz/config.dart';

class WishListAction extends StatelessWidget {
  final GestureTapCallback? firstActionTap;
  final GestureTapCallback? secondActionTap;
  final String? about;
  final bool isActionShow;

  const WishListAction({
    Key? key,
    this.firstActionTap,
    this.secondActionTap,
    this.about,
    this.isActionShow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: AppScreenUtil().screenHeight(0.5),
            margin:
                EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(3)),
            color: appCtrl.appTheme.lightGray,
            width: MediaQuery.of(context).size.width / 1.8,
          ),
          const Space(0, 10),
          isActionShow
              ? ActionLayout(
                  firstActionIcon: BuyIcon(color: appCtrl.appTheme.blackColor)
                      .height(AppScreenUtil().screenHeight(14)),
                  firstActionName: about == 'cart'
                      ? CommonTextFont().moveToWishList
                      : about == 'wishlist'
                          ? CommonTextFont().moveToCart
                          : null,
                  firstActionTap: firstActionTap,
                  secondAction: CommonTextFont().remove,
                  secondActionTap: secondActionTap,
                )
              : ActionLayout(
                  firstActionIcon:
                      const Icon(Icons.call, size: 18, color: Colors.black)
                          .height(AppScreenUtil().screenHeight(14)),
                  firstActionName: "Get a call".tr,
                  firstActionTap: firstActionTap,
                  secondAction: CommonTextFont().remove,
                  secondActionTap: secondActionTap,
                )
        ],
      );
    });
  }
}
