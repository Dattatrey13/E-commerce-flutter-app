import '../../config.dart';

class HeartIcon extends StatelessWidget {
  final Color? color;

  const HeartIcon({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return SvgPicture.asset(
        svgAssets.heart,
        colorFilter: ColorFilter.mode(color ?? appCtrl.appTheme.contentColor, BlendMode.srcIn),
      );
    });
  }
}
