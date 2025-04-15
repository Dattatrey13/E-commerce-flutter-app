import '../../../../config.dart';

class StatusLayout extends StatelessWidget {
  final String? title;
  double? height = AppScreenUtil().screenHeight(20);

  StatusLayout({Key? key, this.title, this.height = 30}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return CustomButton(
        padding: 0,
        margin: 0,
        height: height!,
        title: title!,
        color: appCtrl.appTheme.greyLight25,
        fontSize: FontSizes.f8,
        fontColor: appCtrl.appTheme.blackColor,
        fontWeight: FontWeight.w700,
      );
    });
  }
}
