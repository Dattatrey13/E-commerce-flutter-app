import 'package:dapperz/config.dart';

class HomeWidget {
  //banner image
  Widget bannerImage(image, context) => ClipRRect(
      borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(6)),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        height: AppScreenUtil().screenHeight(165),
        width: MediaQuery.of(context).size.width,
      ));

  //image layout
  Widget imageLayout(image) => ClipRRect(
        borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(3)),
        child: FadeInImageLayout(
          image: image,
          height: AppScreenUtil().size(80),
          width: AppScreenUtil().size(82),
        ),
      );
}
