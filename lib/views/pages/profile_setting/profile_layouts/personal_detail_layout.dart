import 'package:dapperz/config.dart';

class PersonalDetailLayout extends StatelessWidget {
  const PersonalDetailLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profileCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileWidget().commonTitleTextLayout(ProfileFont().personalDetail),
          const Space(0, 30),
          ProfileWidget().commonTextBox(
            ProfileFont().mobileNumber,
            controller: profileCtrl.txtMobileNoName,
            focusNode: profileCtrl.mobileNoFocus,
            enabled: false,
            onFieldSubmitted: (value) {
              AddAddressWidget().fieldFocusChange(
                context,
                profileCtrl.mobileNoFocus,
                profileCtrl.mobileNoFocus,
              );
            },
          ),
          const Space(0, 30),
          ProfileWidget().commonTextBox(
            ProfileFont().firstName,
            controller: profileCtrl.txtFirstName,
            focusNode: profileCtrl.firstNameFocus,
            onFieldSubmitted: (value) {
              AddAddressWidget().fieldFocusChange(
                context,
                profileCtrl.firstNameFocus,
                profileCtrl.lastNameFocus,
              );
            },
          ),
          const Space(0, 30),
          ProfileWidget().commonTextBox(
            ProfileFont().lastName,
            controller: profileCtrl.txtLastName,
            focusNode: profileCtrl.lastNameFocus,
            onFieldSubmitted: (value) {
              AddAddressWidget().fieldFocusChange(
                context,
                profileCtrl.lastNameFocus,
                profileCtrl.lastNameFocus,
              );
            },
          ),
          const Space(0, 10),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
                "This will be how your name will be displayed in the account section and in reviews"),
          ),
          const Space(0, 30),
          GestureDetector(
            onTap: () {
              Get.toNamed(routeName.deleteAccount);
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DeleteIcon(),
                Space(10, 0),
                Text('Delete Account'),
              ],
            ),
          ),
          const Space(0, 30),
        ],
      ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15));
    });
  }
}
