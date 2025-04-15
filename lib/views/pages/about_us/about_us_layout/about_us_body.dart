import '../../../../config.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(builder: (aboutUsCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //introduction text layout
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AboutUsWidget().commonText(
                  AboutUSFont().introduction, FontWeight.w700, FontSizes.f16),
              const Space(0, 20),
              //about us image layout
              AboutUsWidget().imageLayout(imageAssets.aboutUs),
              const Space(0, 20),
              //title text layout
              AboutUsWidget().commonText(
                  "Surat's premium source for top quality construction materials",
                  FontWeight.w600,
                  FontSizes.f14),
              const Space(0, 20),
              //description1 text layout
              AboutUsWidget().commonDescText(
                  "Civilis Mart, established in Surat with the aim to provide top-quality building materials at lowest cost and with rapid service, we have designed a user friendly online store that promises an easy and enjoyable shopping experience."),
              const Space(0, 20),
              AboutUsWidget()
                  .commonText("WHY CIVILIS ?", FontWeight.w700, FontSizes.f16),
              const Space(0, 20),
              //description2 text layout
              AboutUsWidget().commonDescText(
                  "If you wants to Buy Best building material at low-price then you must have to visit our website dapperz.in Collecting building material from different sources is a hectic job, keeping this in mind, we have made all construction material available under one roof."),
              const Space(0, 20),
              AboutUsWidget()
                  .commonText("ABOUT US", FontWeight.w700, FontSizes.f16),
              const Space(0, 20),
              //description2 text layout
              AboutUsWidget().commonDescText(
                  "Civilis Mart was established on 2021 at Surat. It is an e-commerce website that serves as a platform for construction materials and other services. Civilis mart has successfully completed more than 200 orders with 75+ satisfied and happy customers. Our value lies in the trust we have established with countless builders and contractors in real estate."),
              const Space(0, 20),
              AboutUsWidget()
                  .commonText("OUR MISSION", FontWeight.w700, FontSizes.f16),
              const Space(0, 20),
              //description2 text layout
              AboutUsWidget().commonDescText(
                  "Our mission is to provide the best building materials with the lowest cost and fastest service at all construction sites. To archive excellence in service, quality, reliability, safety and customer care. To earn the trust of all the customer exceeding their expectation and make the company a respected in household name."),
              const Space(0, 20),
              AboutUsWidget()
                  .commonText("OUR VISION", FontWeight.w700, FontSizes.f16),
              const Space(0, 20),
              //description2 text layout
              AboutUsWidget().commonDescText(
                  "Our vision is to be the global leader in e-commerce for construction materials, known for our unwavering commitment to quality, innovation, and customer satisfaction. Civilis Mart aims to shape the future of construction procurement, setting new standards and redefining the way builders and contractors approach their material sourcing needs."),
              const Space(0, 30),
              //statistic layout
              const AboutUsStatistic(),
              const Space(0, 30),
              //description3 text layout
              // AboutUsWidget().commonDescText(aboutUsCtrl.aboutUsModel!.desc3.toString().tr),
              // const Space(0, 20),
              // AboutUsWidget().commonText(AboutUSFont().ourBrandTitle, FontWeight.w700, FontSizes.f16),
              // const Space(0, 20),
              //
              // //our brand text layout
              // AboutUsWidget().commonDescText(aboutUsCtrl.aboutUsModel!.ourBrand.toString().tr),
              // const Space(0, 20),
            ],
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),

          //our brand layout
          // const CommonBrandLayout()
        ],
      );
    });
  }
}
