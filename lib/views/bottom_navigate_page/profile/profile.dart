import 'package:dapperz/common_methods.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:dapperz/views/bottom_navigate_page/profile/profile_layouts/profile_card.dart';
import 'package:dapperz/views/bottom_navigate_page/profile/profile_layouts/profile_user.dart';
import 'package:dapperz/widgets/common/login_button.dart';

import '../../../config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileCtrl = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (_) {
      return Directionality(
        textDirection:
            profileCtrl.appCtrl.isRTL ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          body: WillPopScope(
            onWillPop: () async {
              appCtrl.isHeart = true;
              appCtrl.isCart = true;
              appCtrl.isShare = false;
              appCtrl.isSearch = true;
              appCtrl.isNotification = false;
              appCtrl.selectedIndex = 0;
              appCtrl.update();
              Get.forceAppUpdate();
              return true;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //user profile layout
                  const ProfileUser(),
                  if (profileCtrl.drawerList.isNotEmpty)
                    //menu page list
                    ...profileCtrl.drawerList.asMap().entries.map((e) {
                      return ProfileCard(
                        data: e.value,
                        index: e.key,
                        lastIndex: profileCtrl.drawerList.length - 1,
                        onTap: () => UserSingleton().isGuest ?? false
                            ? profileCtrl.goToPageGuest(e.key)
                            : profileCtrl.goToPage(e.key),
                      );
                    }).toList(),
                  if (profileCtrl.drawerList.isNotEmpty &&
                      UserSingleton().token != null &&
                      UserSingleton().token != "")
                    //logout button layout
                    const LogoutButton()
                  else
                    const LogInButton()
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
