import 'package:dapperz/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class Guide extends StatefulWidget {
  const Guide({super.key});

  @override
  State<Guide> createState() => _GuideState();
}

class _GuideState extends State<Guide> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Directionality(
        textDirection: appCtrl.isRTL || appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          backgroundColor: appCtrl.appTheme.whiteColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: appCtrl.appTheme.whiteColor,
            automaticallyImplyLeading: false,
            leading: Icon(CupertinoIcons.arrow_left,
                    size: AppScreenUtil().size(25),
                    color: appCtrl.appTheme.blackColor)
                .gestures(
              onTap: () {
                Get.back();
              },
            ),
            title: const LatoFontStyle(
                text: "Guide",
                fontSize: FontSizes.f16,
                fontWeight: FontWeight.w700),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse("https://youtu.be/WRHfUkBspao"));
                  },
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        'https://img.youtube.com/vi/WRHfUkBspao/0.jpg',
                        fit: BoxFit.fill,
                        height: size.height / 3.5,
                        width: size.width / 1.13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TermsConditionWidget().commonText(
                    "Seamless Enquiry Process Guide", FontWeight.w700),
                const Space(0, 10),
                TermsConditionWidget().commonSubTitle(
                    "Discover a hassle-free way to make inquiries with our step by step guide video. From clicking “Get a Call” to submitting your details. Simplify your enquiry experience with our user-friendly guide."),
                const Space(0, 10),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse("https://youtu.be/-MaZhLyKX_Q"));
                  },
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        'https://img.youtube.com/vi/-MaZhLyKX_Q/0.jpg',
                        fit: BoxFit.fill,
                        height: size.height / 3.5,
                        width: size.width / 1.13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TermsConditionWidget().commonText(
                    "Effortless Quoting Made Simple", FontWeight.w700),
                const Space(0, 20),
                TermsConditionWidget().commonSubTitle(
                    "Discover the ease of obtaining a quote with our “Get Quote” Guide Video. Streamline your quoting experience with this easy-to-follow guide."),
                const Space(0, 20),
                GestureDetector(
                  onTap: () {
                    launchUrl(Uri.parse("https://youtu.be/qrptToDnWFU"));
                  },
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        'https://img.youtube.com/vi/qrptToDnWFU/0.jpg',
                        fit: BoxFit.fill,
                        height: size.height / 3.5,
                        width: size.width / 1.13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TermsConditionWidget().commonText(
                    "Home Construction Plan Made Easy: Your Blueprint for Success",
                    FontWeight.w700),
                const Space(0, 10),
                TermsConditionWidget().commonSubTitle(
                    "Unveil the secrets to effortless home construction plan with our “Build your Home Plan” Guide Video. Make your dream home a reality with this user-friendly guide."),
                const Space(0, 10),
              ],
            ).marginSymmetric(
                vertical: AppScreenUtil().screenHeight(20),
                horizontal: AppScreenUtil().screenWidth(15)),
          ),
        ),
      );
    });
  }
}
