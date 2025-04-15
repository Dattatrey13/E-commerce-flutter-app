import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/controllers/pages_controller/all_brands_controller.dart';
import 'package:flutter/cupertino.dart';

class AllBrands extends StatefulWidget {
  const AllBrands({super.key});

  @override
  State<AllBrands> createState() => _AllBrandsState();
}

class _AllBrandsState extends State<AllBrands> {
  final allCtrl = Get.put(AllBrandsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllBrandsController>(builder: (allCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Directionality(
          textDirection: appCtrl.isRTL || appCtrl.languageVal == "ar"
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: RefreshIndicator(
            displacement: 100,
            backgroundColor: Colors.white,
            color: appCtrl.appTheme.primary,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              allCtrl.getData();
              allCtrl.update();
            },
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
                    text: "All Brands",
                    fontSize: FontSizes.f16,
                    fontWeight: FontWeight.w700),
              ),
              body: SingleChildScrollView(
                child: allCtrl.isLoading!
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Column(
                        children: [
                          if (allCtrl.data != null)
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: allCtrl.data!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      LatoFontStyle(
                                        text: allCtrl.data![index].categoryName,
                                        fontSize: FontSizes.f16,
                                        fontWeight: FontWeight.normal,
                                        color: appCtrl.appTheme.blackColor,
                                      ).marginSymmetric(
                                          horizontal:
                                              AppScreenUtil().screenWidth(15)),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: allCtrl.data![index].brands!
                                              .asMap()
                                              .entries
                                              .map((e) {
                                            return InkWell(
                                              onTap: () {
                                                appCtrl.isSearch = true;
                                                // appCtrl.selectedIndex = 1;
                                                appCtrl.update();
                                                var data = {
                                                  'name': e.value.brandName,
                                                  'cat_id': e.value.id!,
                                                  'brand': true
                                                };
                                                Get.toNamed(routeName.shopPage,
                                                    arguments: data);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                height: AppScreenUtil()
                                                    .screenHeight(80),
                                                width: AppScreenUtil()
                                                    .screenHeight(80),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: AppScreenUtil()
                                                        .screenHeight(10),
                                                    horizontal: 15),
                                                margin: EdgeInsets.only(
                                                  left: AppScreenUtil()
                                                      .screenWidth(15),
                                                  right: AppScreenUtil()
                                                      .screenWidth(15),
                                                  top: AppScreenUtil()
                                                      .screenHeight(15),
                                                  bottom: AppScreenUtil()
                                                      .screenHeight(10),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: appCtrl
                                                      .appTheme.greyLight25,
                                                  borderRadius: BorderRadius
                                                      .circular(AppScreenUtil()
                                                          .borderRadius(
                                                              AppScreenUtil()
                                                                  .borderRadius(
                                                                      5))),
                                                ),
                                                child: FadeInImage(
                                                  placeholder: AssetImage(
                                                      gifAssets.loading),
                                                  image: NetworkImage(
                                                      e.value.imageUrl!),
                                                  alignment: Alignment.center,
                                                  placeholderFit: BoxFit.cover,
                                                  imageErrorBuilder: (context,
                                                      error, stacktrace) {
                                                    return FadeInImage
                                                        .memoryNetwork(
                                                      fit: BoxFit.cover,
                                                      placeholder:
                                                          kTransparentImage,
                                                      image: e.value.imageUrl!,
                                                      imageErrorBuilder:
                                                          (context, error,
                                                              stacktrace) {
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
                                  );
                                })
                        ],
                      ).marginSymmetric(
                        vertical: AppScreenUtil().screenHeight(10),
                        horizontal: AppScreenUtil().screenWidth(15)),
              ),
            ),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    Get.delete<AllBrandsController>();
    super.dispose();
  }
}
