import 'package:dapperz/config.dart';
import 'package:dapperz/utilities/responsive_layout.dart';

class CustomButton extends StatelessWidget {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  final String title;
  final double padding;
  final double margin;
  final double radius;
  final double height;
  final double fontSize;
  final GestureTapCallback? onTap;
  final TextStyle? style;
  final Color? color;
  final Color? fontColor;
  final Widget? icon;
  final double? width;
  final Border? border;
  final FontWeight? fontWeight;

  CustomButton(
      {Key? key,
      required this.title,
      this.padding = 15,
      this.margin = 15,
      this.radius = 5,
      this.height = 45,
      this.fontSize = FontSizes.f14,
      this.onTap,
      this.style,
      this.color,
      this.fontColor,
      this.icon,
      this.width,
      this.border,
      this.fontWeight = FontWeight.w700})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(onTap != null
                ? (color ?? appCtrl.appTheme.primary)
                : appCtrl.appTheme.greyLight25),
            overlayColor: MaterialStateProperty.all<Color>(onTap != null
                ? (color ?? const Color(0xFFFFF7BF))
                : appCtrl.appTheme.greyLight25),
            elevation: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return 15;
              }
              return 5;
            }),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius > 0 ? radius : 0),
              ),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: AppScreenUtil().screenWidth(margin)),
            height: AppScreenUtil().screenHeight(
                ResponsiveWidget.isSmallScreen(context) ? 45 : height),
            //decoration: BoxDecoration(border: border),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Row(
                    children: [
                      icon ?? const HSpace(0),
                      const HSpace(10),
                    ],
                  ),
                Text(title, textAlign: TextAlign.center)
                    .fontSize(AppScreenUtil().fontSize(fontSize))
                    .textColor(fontColor ?? appCtrl.appTheme.blackColor)
                    .fontFamily(GoogleFonts.lato().fontFamily.toString())
                    .fontWeight(fontWeight!)
                    .letterSpacing(1),
              ],
            ),
          )),
    );
  }
}
