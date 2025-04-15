//import 'package:dapperz/models/category/category_model.dart' as cm;
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;

import '../../../config.dart';

class BackgroundTextLayout extends StatelessWidget {
  final cm.Data? categoryModel;
  final int? index;
  final bool? isEven;

  const BackgroundTextLayout(
      {Key? key, this.index, this.isEven, this.categoryModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<AppController>(builder: (appCtrl) {
      return Container(
        margin: EdgeInsets.only(
            top: AppScreenUtil().screenHeight(size.height / 20),
            bottom: AppScreenUtil().screenHeight(size.height / 90)),
        height: AppScreenUtil().size(size.height / 10),
        padding: EdgeInsets.only(
            left: AppScreenUtil().screenWidth(size.width / 35),
            right: AppScreenUtil().screenWidth(size.width / 35)),
        alignment: isEven! ? Alignment.centerLeft : Alignment.centerRight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
          color: const Color(0xFFEDEFF4),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment:
              isEven! ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LatoFontStyle(
              text: categoryModel!.categoryName.toString().tr.toUpperCase(),
              fontSize: FontSizes.f16,
              color: appCtrl.isTheme
                  ? appCtrl.appTheme.whiteColor
                  : appCtrl.appTheme.blackColor,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      );
    });
  }
}
