import 'package:dapperz/common/config/session.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:dapperz/widgets/common_text_widget/common_account_text.dart';
import 'package:device_uuid/device_uuid.dart';

import '../../../../config.dart';

class GuestLoginText extends StatelessWidget {
  const GuestLoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GestureDetector(
        onTap: () async {
          UserSingleton().isGuest = true;
          final uuid = await DeviceUuid().getUUID();
          UserSingleton().uuidForGuest = uuid.toString();
          appCtrl.storage.write(Session.isGuest, true);
          appCtrl.storage
              .write(Session.isGuestLoginToken, UserSingleton().uuidForGuest);
          appCtrl.storage.write(Session.isLogin, false);
          appCtrl.storage.write(Session.isRegularLoginToken, "");
          appCtrl.goToHome();
          Get.toNamed(routeName.dashboard);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.login),
            const SizedBox(width: 10),
            CommonAccountText(
              text1: CommonTextFont().continueAsGuest,
              text2: "",
              textColor: appCtrl.appTheme.whiteColor,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      );
    });
  }
}
