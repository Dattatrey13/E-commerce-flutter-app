import 'package:dapperz/user_singleton.dart';

import '../../config.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return InkWell(
        onTap: () {
          appCtrl.selectedIndex = 0;
          appCtrl.storage.erase();
          UserSingleton().token = null;
          UserSingleton().selectedLocation = null;
          Get.offAllNamed(routeName.login);
        },
        child: Container(
          alignment: Alignment.center,
          padding:
              EdgeInsets.symmetric(vertical: AppScreenUtil().screenHeight(10)),
          margin: EdgeInsets.symmetric(
              horizontal: AppScreenUtil().screenWidth(15),
              vertical: AppScreenUtil().screenHeight(15)),
          decoration: BoxDecoration(
              border:
                  Border.all(color: appCtrl.appTheme.contentColor, width: 1.5),
              borderRadius:
                  BorderRadius.circular(AppScreenUtil().borderRadius(5))),
          child: LatoFontStyle(
            text: CommonTextFont().logIn,
            fontSize: FontSizes.f16,
          ),
        ),
      );
    });
  }
}
