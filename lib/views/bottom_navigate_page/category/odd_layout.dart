//import 'package:dapperz/models/category/category_model.dart' as cm;
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;

import '../../../config.dart';

class CategoryCardLayout extends StatelessWidget {
  final cm.Data? categoryModel;
  final int? index;
  final bool? isEven;
  final GestureTapCallback? onTap;

  const CategoryCardLayout(
      {Key? key, this.categoryModel, this.index, this.isEven, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      Size size = MediaQuery.of(context).size;
      return categoryModel!.imageUrl != null
          ? Container(
              width: size.width,
              margin: EdgeInsets.symmetric(
                  horizontal: AppScreenUtil().screenWidth(15)),
              child: Stack(
                alignment: isEven! ? Alignment.topRight : Alignment.topLeft,
                children: [
                  BackgroundTextLayout(
                    isEven: isEven,
                    index: index,
                    categoryModel: categoryModel,
                  ),
                  Positioned(
                    top: size.width < 370
                        ? 17
                        : size.width < 385
                            ? 12
                            : size.width > 400
                                ? 13
                                : -3,
                    child: Hero(
                      tag: index.toString(),
                      child: Image.network(
                        categoryModel!.imageUrl!,
                        fit: BoxFit.contain,
                        //image height and width
                        height: AppScreenUtil().screenHeight(size.height / 6),
                        width: AppScreenUtil().screenWidth(size.width / 5),
                      ),
                    ),
                  ),
                ],
              ),
            ).gestures(onTap: onTap)
          : Container();
    });
  }
}
