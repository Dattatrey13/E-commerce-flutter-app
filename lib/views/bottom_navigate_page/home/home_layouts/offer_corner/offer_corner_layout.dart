import '../../../../../config.dart';

class OfferCornerLayout extends StatelessWidget {
  const OfferCornerLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return GridView.builder(
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: homeCtrl.getAllCouponsModel!.data!.length,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(3)),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                homeCtrl.appCtrl.isTheme
                    ? Image.asset(imageAssets.offerCornerBG,
                        color: homeCtrl.appCtrl.appTheme.whiteColor)
                    : Image.asset(imageAssets.offerCornerBG),
                LatoFontStyle(
                  text: homeCtrl.getAllCouponsModel!.data![index].code!
                      .toUpperCase(),
                  color: homeCtrl.appCtrl.appTheme.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: MediaQuery.of(context).size.shortestSide / 60,
          mainAxisSpacing: MediaQuery.of(context).size.shortestSide / 70,
          childAspectRatio: MediaQuery.of(context).size.shortestSide /
              (MediaQuery.of(context).size.longestSide / (6)),
        ),
      );
    });
  }
}
