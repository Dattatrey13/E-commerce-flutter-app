import '../../config.dart';

class HomerShimmer extends StatelessWidget {
  const HomerShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      // Show only GIF while loading
      if (appCtrl.isLoading) {
        return Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              'assets/gif/dapper.gif',
              fit: BoxFit.contain,
            ),
          ),
        );
      }

      // After loading (i.e., appCtrl.isLoading == false), show shimmer UI
      return SingleChildScrollView(
        primary: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Space(0, 20),
            HomeShimmerWidget().textShimmer(),
            HomeShimmerWidget().textInRowShimmer(),
            const Space(0, 10),
            const DealOfTheDayShimmer(),
            const Space(0, 10),
            const BorderLineLayout(),
            const Space(0, 10),
            HomeShimmerWidget().textInColumnShimmer(),
            const Space(0, 10),
            const CommonBoxTextShimmer(),
            const CommonGridViewList(),
            const Space(0, 20),
            HomeShimmerWidget().textInColumnShimmer(),
            const CommonBoxTextShimmer(),
            const Space(0, 10),
            const BorderLineLayout(),
            const Space(0, 10),
            HomeShimmerWidget().textInColumnShimmer(),
            const Space(0, 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...AppArray().featuredProductList.map((e) {
                    return ProductShimmer(
                      width: MediaQuery.of(context).size.width / 3,
                    ).marginOnly(right: AppScreenUtil().screenWidth(10));
                  }).toList(),
                ],
              ),
            ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
            const Space(0, 30),
            CommonShimmer(
              height: 10,
              width: 100,
              borderRadius: 2,
              color: appCtrl.appTheme.lightGray.withOpacity(.3),
              borderColor: appCtrl.appTheme.lightGray.withOpacity(.3),
            ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
            const Space(0, 30),
            const GridViewShimmer(crossAxisCount: 2, count: 4),
          ],
        ),
      );
    });
  }
}
