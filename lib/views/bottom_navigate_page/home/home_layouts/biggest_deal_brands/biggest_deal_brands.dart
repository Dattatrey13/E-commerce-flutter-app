import 'dart:async';

import 'package:dapperz/common_methods.dart';

import '../../../../../config.dart';

class Brands extends StatefulWidget {
  const Brands({Key? key}) : super(key: key);

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  Timer? timer;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 2), (_) async {
      double currentPosition =
          scrollController.offset; // Assuming uniform item height
      double newPosition = currentPosition + (2 * 100);
      double itemHeight = scrollController.position.extentTotal;

      if (newPosition >=
          scrollController.position.maxScrollExtent - (2 * 100)) {
        await Future.delayed(const Duration(seconds: 3));
        newPosition = 0.0; // Jump to the beginning
      } else {
        newPosition =
            newPosition.clamp(0.0, scrollController.position.maxScrollExtent);
        if (newPosition == currentPosition &&
            newPosition < scrollController.position.maxScrollExtent) {
          newPosition += itemHeight; // Ensure scrolling even near the end
        }
      }
      if (scrollController.hasClients) {
        scrollController.animateTo(
          newPosition.clamp(0.0, scrollController.position.maxScrollExtent),
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LatoFontStyle(
            text: "Brands",
            fontSize: FontSizes.f16,
            fontWeight: FontWeight.normal,
            color: homeCtrl.appCtrl.appTheme.blackColor,
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
          SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            child: Row(
              children: homeCtrl.brandsList.asMap().entries.map((e) {
                return InkWell(
                  onTap: () async {
                    homeCtrl.appCtrl.isSearch = true;
                    // homeCtrl.appCtrl.selectedIndex = 1;
                    homeCtrl.appCtrl.update();
                    var data = {
                      'name': homeCtrl.brandsList[e.key].brandName,
                      'cat_id': homeCtrl.brandsList[e.key].id,
                      'brand': true,
                    };
                    await Get.toNamed(routeName.shopPage, arguments: data)
                        ?.then((value) {
                      homeCtrl.getRecentItemList();
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: size.longestSide / 8.5,
                    width: size.longestSide / 8.5,
                    padding: EdgeInsets.symmetric(
                        vertical: AppScreenUtil().screenHeight(0),
                        horizontal: 15),
                    margin: EdgeInsets.only(
                      left: AppScreenUtil().screenWidth(15),
                      right: AppScreenUtil().screenWidth(15),
                      top: AppScreenUtil().screenHeight(15),
                      bottom: AppScreenUtil().screenHeight(10),
                    ),
                    decoration: BoxDecoration(
                      color: homeCtrl.appCtrl.appTheme.greyLight25,
                      borderRadius: BorderRadius.circular(AppScreenUtil()
                          .borderRadius(AppScreenUtil().borderRadius(5))),
                    ),
                    child: FadeInImage(
                      placeholder: AssetImage(gifAssets.loading),
                      image: NetworkImage(homeCtrl.brandsList[e.key].imageUrl!),
                      alignment: Alignment.center,
                      placeholderFit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stacktrace) {
                        return FadeInImage.memoryNetwork(
                          fit: BoxFit.cover,
                          placeholder: kTransparentImage,
                          image: homeCtrl.brandsList[e.key].imageUrl!,
                          imageErrorBuilder: (context, error, stacktrace) {
                            return const SizedBox(
                              child: Center(
                                child: Text(
                                  'Image Not Available',
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ).marginOnly(
        top: AppScreenUtil().screenHeight(20),
        bottom: AppScreenUtil().screenHeight(20),
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

class SliderData extends StatefulWidget {
  const SliderData({Key? key}) : super(key: key);

  @override
  State<SliderData> createState() => _SliderDataState();
}

class _SliderDataState extends State<SliderData> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      Size size = MediaQuery.of(context).size;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: AppArray().homeSliderList.asMap().entries.map((e) {
                return InkWell(
                  onTap: () {
                    homeCtrl.appCtrl.isSearch = true;
                    homeCtrl.appCtrl.update();
                    var data = {
                      'name': e.value['text'],
                      'cat_id': e.value['cat_id']
                    };
                    Get.toNamed(routeName.shopPage, arguments: data)
                        ?.then((value) {
                      homeCtrl.getRecentItemList();
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: size.longestSide / 5.5,
                    width: size.longestSide / 9,
                    margin: EdgeInsets.only(
                        left: AppScreenUtil().screenWidth(15),
                        right: AppScreenUtil().screenWidth(15),
                        top: AppScreenUtil().screenHeight(5),
                        bottom: AppScreenUtil().screenHeight(5)),
                    decoration: BoxDecoration(
                      color: homeCtrl.appCtrl.appTheme.greyLight25,
                      borderRadius: BorderRadius.circular(AppScreenUtil()
                          .borderRadius(AppScreenUtil().borderRadius(5))),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 120,
                          child: Image.asset(
                            e.value['image_asset'].toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          child: Text(
                            e.value['text'] ?? "",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ).marginOnly(
            bottom: AppScreenUtil().screenHeight(10),
            top: AppScreenUtil().screenHeight(10)),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
