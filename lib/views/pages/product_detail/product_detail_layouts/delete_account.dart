import 'package:dapperz/config.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

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
              text: "Delete Account",
              color: profileCtrl.appCtrl.appTheme.blackColor,
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        CustomTextFormField(
                          radius: 5,
                          labelText: "Reason to Delete Account",
                          controller: profileCtrl.txtReason,
                          minLines: 7,
                          maxLines: 7,
                          keyboardType: TextInputType.name,
                        ),
                        const Space(0, 30),
                      ],
                    ).marginSymmetric(
                      horizontal: AppScreenUtil().screenWidth(15),
                    )
                  ],
                )
                    .width(MediaQuery.of(context).size.width)
                    .marginOnly(top: Insets.i20, bottom: Insets.i30),
              ),
              BottomLayout(
                firstButtonText: ProfileFont().cancel,
                secondButtonText: "Delete Account",
                firstTap: () => Get.back(),
                secondTap: () async {
                  profileCtrl.deleteUser();
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
