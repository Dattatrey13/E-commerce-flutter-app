import 'package:dapperz/common_methods.dart';

import '../../config.dart';

class DeleteIcon extends StatelessWidget {
  const DeleteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      svgAssets.delete,
      height: AppScreenUtil().screenHeight(18),
      colorFilter: ColorFilter.mode(
        appCtrl.isTheme
            ? appCtrl.appTheme.whiteColor
            : appCtrl.appTheme.blackColor,
        BlendMode.srcIn,
      ),
    );
  }
}
