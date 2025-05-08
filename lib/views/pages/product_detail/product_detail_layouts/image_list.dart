import 'package:carousel_slider/carousel_slider.dart';
import 'package:dapperz/views/menu/full_screen_image.dart';

import '../../../../config.dart';

class ImageList extends StatelessWidget {
  const ImageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (productCtrl) {
      return productCtrl.imagesList.isNotEmpty
          ? productCtrl.imagesList.length > 1
              ? CarouselSlider.builder(
                  options: CarouselOptions(
                      height: AppScreenUtil().size(300),
                      aspectRatio: 16 / 9,
                      disableCenter: false,
                      viewportFraction: .90,
                      autoPlay: productCtrl.imagesList.length != 1,
                      enlargeCenterPage: false,
                      onPageChanged: (index, reason) {
                        productCtrl.current = index;
                        productCtrl.update();
                      }),
                  itemCount: productCtrl.imagesList.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => FullScreenImage(
                                imageUrl:
                                    productCtrl.imagesList[index].toString()),
                          ),
                        );
                      },
                      child: FadeInImageLayout(
                        image: productCtrl.imagesList[index].toString(),
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ).paddingOnly(
                        right: AppScreenUtil().screenWidth(
                            productCtrl.current == index ? 10 : 15),
                      ),
                    );
                  },
                )
              : GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => FullScreenImage(
                            imageUrl: productCtrl.imagesList.first.toString()),
                      ),
                    );
                  },
                  child: FadeInImageLayout(
                    image: productCtrl.imagesList.first.toString(),
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    fit: BoxFit.contain,
                  ).paddingOnly(
                    right: AppScreenUtil().screenWidth(10),
                    left: AppScreenUtil().screenWidth(10),
                  ),
                )
          : const NoDataImage();
    });
  }
}
