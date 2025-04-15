import 'package:dapperz/config.dart';

class WalletLayout extends StatelessWidget {
  const WalletLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
              text: CommonTextFont().wallets,
              color: appCtrl.appTheme.blackColor,
              fontWeight: FontWeight.w700,
              fontSize: FontSizes.f16),
        ],
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
