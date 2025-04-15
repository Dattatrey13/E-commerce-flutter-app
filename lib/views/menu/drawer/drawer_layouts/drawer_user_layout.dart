import 'package:dapperz/user_singleton.dart';

import '../../../../config.dart';

class DrawerUserLayout extends StatelessWidget {
  const DrawerUserLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (appCtrl) {
        return Container(
          padding: EdgeInsets.fromLTRB(
              AppScreenUtil().screenWidth(20),
              AppScreenUtil().screenHeight(30),
              AppScreenUtil().screenWidth(15),
              AppScreenUtil().screenWidth(10)),
          decoration: BoxDecoration(
            color: appCtrl.appTheme.greyLight25,
          ),
          child: Row(
            children: <Widget>[
              Container(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: const UserIcon()),
              const Space(10, 0),
              Expanded(
                child: LatoFontStyle(
                  text: UserSingleton().isGuest!
                      ? "Hello, Guest"
                      : "${UserSingleton().firstName} ${UserSingleton().lastName}",
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w700,
                  softWrap: true,
                  maxLines: 4,
                ),
              ),
              // const BackArrowIcon()
            ],
          ),
        );
      },
    );
  }
}
