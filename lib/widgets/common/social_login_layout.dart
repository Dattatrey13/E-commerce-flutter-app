import '../../config.dart';

class SocialLoginLayout extends StatelessWidget {
  final loginCtrl = Get.isRegistered<SocialLoginController>() ? Get.find<SocialLoginController>() : Get.put(SocialLoginController());

  SocialLoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SocialLoginController>(builder: (_) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppScreenUtil().screenWidth(15)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      );
    });
  }
}
