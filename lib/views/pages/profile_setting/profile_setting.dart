import 'package:dapperz/config.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProfileSetting extends StatelessWidget {
  const ProfileSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileCtrl) {
      return Directionality(
        textDirection:
            profileCtrl.appCtrl.isRTL || profileCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: const BackArrowButton(),
            backgroundColor: profileCtrl.appCtrl.appTheme.whiteColor,
            title: LatoFontStyle(
              text: ProfileFont().profileSetting,
              color: profileCtrl.appCtrl.appTheme.blackColor,
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // User image
                  const UserImage().alignment(Alignment.center),
                  const Space(0, 30),
                  // Personal detail
                  const PersonalDetailLayout(),
                  const BorderLineLayout(),
                  const Space(0, 30),
                ],
              )
                  .width(MediaQuery.of(context).size.width)
                  .marginOnly(top: Insets.i20, bottom: Insets.i30),
              //cancel and save detail layout
              BottomLayout(
                firstButtonText: ProfileFont().cancel,
                secondButtonText: ProfileFont().saveDetails,
                firstTap: () => Get.back(),
                secondTap: () async {
                  bool? status = await profileCtrl.saveUserDetails();
                  if (status != null && status) {
                    UserSingleton().firstName =
                        profileCtrl.txtFirstName.text.trim();
                    UserSingleton().lastName =
                        profileCtrl.txtLastName.text.trim();
                    Fluttertoast.showToast(
                        msg: "Profile Details Updated Successfully");
                    Get.back();
                  } else {
                    Fluttertoast.showToast(
                        msg: "Unable to Update Profile Details");
                  }
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
