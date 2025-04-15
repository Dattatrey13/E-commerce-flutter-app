import '../../../../config.dart';

class SizeCard extends StatelessWidget {
  final String? sizeModel;
  final int? selectSize;
  final int? index;
  final GestureTapCallback? onTap;

  const SizeCard({Key? key, this.sizeModel, this.selectSize, this.index, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: selectSize != null && selectSize == index ? null : onTap,
        child: Container(
          height: AppScreenUtil().screenHeight(40),
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(12)),
          decoration: BoxDecoration(
              color: selectSize != null && selectSize == index ? appCtrl.appTheme.primary : appCtrl.appTheme.greyLight25,
              borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5))),
          child: LatoFontStyle(
            text: sizeModel!,
            fontSize: FontSizes.f12,
            color: appCtrl.appTheme.blackColor,
          ),
        ),
      );
    });
  }
}
