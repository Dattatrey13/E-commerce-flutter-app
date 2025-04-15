import 'package:dapperz/utilities/responsive_layout.dart';

import '../../../../config.dart';

class OrderDetailWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  //dot indicator layout
  // Widget dotIndicator() => DotIndicator(
  //       color: appCtrl.appTheme.primary,
  //       child: const Icon(
  //         Icons.check,
  //         color: Colors.white,
  //         size: 12.0,
  //       ),
  //     );

  //common text
  Widget commonText(text) => LatoFontStyle(
        text: text,
        fontSize: FontSizes.f12,
        color: appCtrl.appTheme.contentColor,
      ).marginSymmetric(horizontal: Insets.i15);

  // button layout
  Widget buttonLayout(BuildContext context, text,
          {GestureTapCallback? onTap}) =>
      Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  onTap != null ? (appCtrl.appTheme.primary) : Colors.red),
              overlayColor: MaterialStateProperty.all<Color>(
                  onTap != null ? (const Color(0xFFFFF7BF)) : Colors.red),
              elevation: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return 15;
                }
                return 5;
              }),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(15)),
              height: AppScreenUtil().screenHeight(
                  ResponsiveWidget.isSmallScreen(context) ? 45 : 45),
              //decoration: BoxDecoration(border: border),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Cancel Order", textAlign: TextAlign.center)
                      .fontSize(AppScreenUtil().fontSize(FontSizes.f14))
                      .textColor(appCtrl.appTheme.white)
                      .fontFamily(GoogleFonts.lato().fontFamily.toString())
                      .fontWeight(FontWeight.w700)
                      .letterSpacing(1),
                ],
              ),
            )),
      );
}
