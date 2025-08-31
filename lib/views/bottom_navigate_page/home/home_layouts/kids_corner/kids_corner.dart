import 'package:dapperz/common_methods.dart';

import '../../../../../config.dart';

class FeaturedCategoriesLayout extends StatefulWidget {
  final String title;

  const FeaturedCategoriesLayout({Key? key, required this.title})
      : super(key: key);

  @override
  State<FeaturedCategoriesLayout> createState() =>
      _FeaturedCategoriesLayoutState();
}

class _FeaturedCategoriesLayoutState extends State<FeaturedCategoriesLayout> {
  // Timer? timer;
  // ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // try {
    //   timer = Timer.periodic(const Duration(seconds: 2), (_) async {
    //     double currentPosition = scrollController.offset; // Assuming uniform item height
    //     double newPosition = currentPosition + (2 * 100);
    //     double itemHeight = scrollController.position.extentTotal;
    //
    //     if (newPosition >= scrollController.position.maxScrollExtent - (2 * 100)) {
    //       await Future.delayed(const Duration(seconds: 3));
    //       newPosition = 0.0; // Jump to the beginning
    //     } else {
    //       newPosition = newPosition.clamp(0.0, scrollController.position.maxScrollExtent);
    //       if (newPosition == currentPosition && newPosition < scrollController.position.maxScrollExtent) {
    //         newPosition += itemHeight; // Ensure scrolling even near the end
    //       }
    //     }
    //     if (scrollController.hasClients) {
    //       scrollController.animateTo(
    //         newPosition.clamp(0.0, scrollController.position.maxScrollExtent),
    //         curve: Curves.ease,
    //         duration: const Duration(milliseconds: 500),
    //       );
    //     }
    //   });
    // } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LatoFontStyle(
                    text: widget.title,
                    fontSize: FontSizes.f14,
                    fontWeight: FontWeight.w700,
                    color: homeCtrl.appCtrl.appTheme.blackColor),
                TextButton(
                  onPressed: () async {
                    //todo: product detail page redirect
                    var data = {
                      'name': widget.title,
                      'cat_id': "featured_product"
                    };
                    await Get.toNamed(routeName.shopPage, arguments: data)
                        ?.then((value) {
                      homeCtrl.getRecentItemList();
                    });
                  },
                  child: Text('View More',
                      style: TextStyle(
                          color: homeCtrl.appCtrl.appTheme.blackColor)),
                ),
              ],
            ),
            const Space(0, 15),
            SingleChildScrollView(
              // controller: scrollController,
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    homeCtrl.featuredCategoriesList.asMap().entries.map((e) {
                  return GestureDetector(
                    onTap: () async {
                      await appCtrl.goToProductDetail(
                          slug: homeCtrl.featuredCategoriesList[e.key].slug!,
                              // .toString(),
                          homeCtrl: homeCtrl);
                    },
                    child: DashboardProductCard(
                            data: homeCtrl.featuredCategoriesList[e.key],
                            isFit: true)
                        .paddingOnly(
                      right: AppScreenUtil().screenWidth(10),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }
}

class NewArrivalProductListLayout extends StatefulWidget {
  final String title;

  const NewArrivalProductListLayout({Key? key, required this.title}) : super(key: key);

  @override
  State<NewArrivalProductListLayout> createState() => _NewArrivalProductListLayoutState();
}

class _NewArrivalProductListLayoutState extends State<NewArrivalProductListLayout> {
  // Add any controllers or timers if needed here

  @override
  void initState() {
    super.initState();
    // Initialize any timers or controllers here
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      final productList = homeCtrl.newArrivalProductList.take(10).toList();

      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LatoFontStyle(
                  text: widget.title,
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w700,
                  color: homeCtrl.appCtrl.appTheme.blackColor,
                ),
                TextButton(
                  onPressed: () {
                    var data = {
                      'name': widget.title,
                      'cat_id': "new_arrival_product",
                    };
                    Get.toNamed(routeName.shopPage, arguments: data)?.then((value) {
                      homeCtrl.getRecentItemList();
                    });
                  },
                  child: Text(
                    'View More',
                    style: TextStyle(color: homeCtrl.appCtrl.appTheme.blackColor),
                  ),
                ),
              ],
            ),
            const Space(0, 5),
            productList.isNotEmpty
                ? SizedBox(
              height: AppScreenUtil().screenHeight(180),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productList.map((product) {
                    return GestureDetector(
                      onTap: () {
                        appCtrl.goToProductDetail(
                          slug: product.slug!,
                          homeCtrl: homeCtrl,
                        );
                      },
                      child: DashboardProductCard(
                        data: product,
                        isFit: true,
                      ).paddingOnly(
                        right: AppScreenUtil().screenWidth(10),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
                : const SizedBox(
              height: 70,
              child: Center(
                child: Text('No NewArrival'),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    // Dispose any controllers or timers here if used
    super.dispose();
  }
}


  class RecommendedForYouLayout extends StatefulWidget {
  final String title;

  const RecommendedForYouLayout({Key? key, required this.title}) : super(key: key);

  @override
  State<RecommendedForYouLayout> createState() => _RecommendedForYouLayoutState();
}

class _RecommendedForYouLayoutState extends State<RecommendedForYouLayout> {
  // Timer? timer;
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Uncomment this part to enable auto scroll
    /*
    timer = Timer.periodic(const Duration(seconds: 3), (_) async {
      double currentPosition = scrollController.offset;
      double newPosition = currentPosition + 200; // Adjust as per card width
      double maxScroll = scrollController.position.maxScrollExtent;

      if (newPosition >= maxScroll) {
        await Future.delayed(const Duration(seconds: 3));
        newPosition = 0.0; // Reset to start
      }

      if (scrollController.hasClients) {
        scrollController.animateTo(
          newPosition,
          curve: Curves.ease,
          duration: const Duration(milliseconds: 500),
        );
      }
    });
    */
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppScreenUtil().screenWidth(15),
          vertical: AppScreenUtil().screenHeight(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LatoFontStyle(
                  text: widget.title,
                  fontSize: FontSizes.f14,
                  fontWeight: FontWeight.w700,
                  color: homeCtrl.appCtrl.appTheme.blackColor,
                ),
                TextButton(
                  onPressed: () {
                    var data = {
                      'name': widget.title,
                      'cat_id': 'recommended_product',
                    };
                    Get.toNamed(routeName.shopPage, arguments: data)?.then((value) {
                      homeCtrl.getRecentItemList();
                    });
                  },
                  child: Text(
                    'View More',
                    style: TextStyle(color: homeCtrl.appCtrl.appTheme.blackColor),
                  ),
                ),
              ],
            ),
            const Space(0, 5),
            homeCtrl.recommendedForYouList.isNotEmpty
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: scrollController,
                    child: Row(
                      children:
                      // homeCtrl.recommendedForYouList
                      //     .asMap()
                      //     .entries
                      //     .map(
                      //       (e) => GestureDetector(
                      //         onTap: () {
                      //           appCtrl.goToProductDetail(
                      //             slug: e.value.slug!,
                      //             homeCtrl: homeCtrl,
                      //           );
                      //         },
                      //         child: DashboardProductCard(
                      //           data: e.value,
                      //           isFit: true,
                      //         ).paddingOnly(
                      //           right: AppScreenUtil().screenWidth(10),
                      //         ),
                      //       ),
                      //     )
                      homeCtrl.recommendedForYouList
                          .asMap()
                          .entries
                          .map((e) => GestureDetector(
                        // onTap: () {
                        //   appCtrl.goToProductDetail(slug: e.value.slug!, homeCtrl: homeCtrl);
                        // },
                        onTap: () {
                          final slug = e.value.slug;
                          if (slug != null) {
                            appCtrl.goToProductDetail(slug: slug, homeCtrl: homeCtrl);
                          } else {
                            // Optionally handle missing slug
                            print('Slug is null for product: ${e.value.slug}');
                          }
                        },
                        child: DashboardProductCard(
                          data: e.value,
                          isFit: true,
                        ).paddingOnly(
                          right: AppScreenUtil().screenWidth(10),
                        ),
                      ))
                          .toList(),
                    ),
                  )
                : const SizedBox(
                    height: 70,
                    child: Center(
                      child: Text('No Recommendation'),
                    ),
                  ),
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    // timer?.cancel();
    scrollController.dispose();
    super.dispose();
  }
}


// class keyChainLayout extends StatefulWidget {
//   final String title;
//
//   const keyChainLayout({Key? key, required this.title}) : super(key: key);
//
//   @override
//   State<keyChainLayout> createState() => _keyChainLayoutState();
// }
//
// class _keyChainLayoutState extends State<keyChainLayout> {
//   // Timer? timer;
//   // ScrollController scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     // timer = Timer.periodic(const Duration(seconds: 4), (_) async {
//     //   if (scrollController.hasClients) {
//     //     double currentPosition = scrollController.offset; // Assuming uniform item height
//     //     double newPosition = currentPosition + (2 * 100);
//     //     double itemHeight = scrollController.position.extentTotal;
//     //
//     //     if (newPosition >= scrollController.position.maxScrollExtent - (2 * 100)) {
//     //       await Future.delayed(const Duration(seconds: 3));
//     //       newPosition = 0.0; // Jump to the beginning
//     //     } else {
//     //       newPosition = newPosition.clamp(0.0, scrollController.position.maxScrollExtent);
//     //       if (newPosition == currentPosition && newPosition < scrollController.position.maxScrollExtent) {
//     //         newPosition += itemHeight; // Ensure scrolling even near the end
//     //       }
//     //     }
//     //     scrollController.animateTo(
//     //       newPosition.clamp(0.0, scrollController.position.maxScrollExtent),
//     //       curve: Curves.ease,
//     //       duration: const Duration(milliseconds: 500),
//     //     );
//     //   }
//     // });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (homeCtrl) {
//       return Padding(
//         padding: EdgeInsets.symmetric(
//             horizontal: AppScreenUtil().screenWidth(15),
//             vertical: AppScreenUtil().screenHeight(10)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     LatoFontStyle(
//                       text: widget.title,
//                       fontSize: FontSizes.f14,
//                       fontWeight: FontWeight.w700,
//                       color: homeCtrl.appCtrl.appTheme.blackColor,
//                     ),
//                     TextButton(
//                       onPressed: () async {
//                         var data = {
//                           'name': widget.title,
//                           'cat_id': "keychains"
//                         };
//                         await Get.toNamed(routeName.shopPage, arguments: data)
//                             ?.then((value) {
//                           homeCtrl.getRecentItemList();
//                         });
//                       },
//                       child: Text('View More',
//                           style: TextStyle(
//                               color: homeCtrl.appCtrl.appTheme.blackColor)),
//                     ),
//                   ],
//                 ),
//                 const Space(0, 20),
//                 homeCtrl.keyChainProductList.isNotEmpty
//                     ? SingleChildScrollView(
//                         // controller: scrollController,
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: homeCtrl.keyChainProductList
//                               .asMap()
//                               .entries
//                               .map((e) {
//                             return GestureDetector(
//                               onTap: () {
//                                 appCtrl.goToProductDetail(
//                                     slug: homeCtrl
//                                         .keyChainProductList[e.key].slug!,
//
//                                     homeCtrl: homeCtrl);
//                               },
//                               child: DashboardProductCard(
//                                 data: homeCtrl.keyChainProductList[e.key],
//                                 isFit: true,
//                               ).paddingOnly(
//                                 right: AppScreenUtil().screenWidth(10),
//                               ),
//                             );
//                           }).toList(),
//                         ),
//                       )
//                     : const SizedBox(
//                         height: 70,
//                         child: Center(
//                           child: Text('No Product Available'),
//                         ),
//                       ),
//               ],
//             )
//           ],
//         ),
//       );
//     });
//   }
//
//   @override
//   void dispose() {
//     // timer?.cancel();
//     super.dispose();
//   }
// }

class OnSaleLayout extends StatefulWidget {
  final String title;

  const OnSaleLayout({Key? key, required this.title}) : super(key: key);

  @override
  State<OnSaleLayout> createState() => _OnSaleLayoutState();
}

class _OnSaleLayoutState extends State<OnSaleLayout> {
  // Timer? timer;
  // ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(const Duration(seconds: 5), (_) async {
    //   double currentPosition = scrollController.offset; // Assuming uniform item height
    //   double newPosition = currentPosition + (2 * 100);
    //   double itemHeight = scrollController.position.extentTotal;
    //
    //   if (newPosition >= scrollController.position.maxScrollExtent - (2 * 100)) {
    //     await Future.delayed(const Duration(seconds: 3));
    //     newPosition = 0.0; // Jump to the beginning
    //   } else {
    //     newPosition = newPosition.clamp(0.0, scrollController.position.maxScrollExtent);
    //     if (newPosition == currentPosition && newPosition < scrollController.position.maxScrollExtent) {
    //       newPosition += itemHeight; // Ensure scrolling even near the end
    //     }
    //   }
    //   if (scrollController.hasClients) {
    //     scrollController.animateTo(
    //       newPosition.clamp(0.0, scrollController.position.maxScrollExtent),
    //       curve: Curves.ease,
    //       duration: const Duration(milliseconds: 500),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LatoFontStyle(
                      text: widget.title,
                      fontSize: FontSizes.f14,
                      fontWeight: FontWeight.w700,
                      color: homeCtrl.appCtrl.appTheme.blackColor,
                    ),
                    TextButton(
                      onPressed: () {
                        var data = {'name': widget.title, 'cat_id': "on_sale"};
                        Get.toNamed(routeName.shopPage, arguments: data)
                            ?.then((value) {
                          homeCtrl.getRecentItemList();
                        });
                        Get.forceAppUpdate();
                      },
                      child: Text('View More',
                          style: TextStyle(
                              color: homeCtrl.appCtrl.appTheme.blackColor)),
                    ),
                  ],
                ),
                const Space(0, 20),
                homeCtrl.onSaleProductList.isNotEmpty
                    ? SingleChildScrollView(
                        // controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: homeCtrl.onSaleProductList
                              .asMap()
                              .entries
                              .map((e) {
                            return GestureDetector(
                              onTap: () {
                                appCtrl.goToProductDetail(
                                    slug: homeCtrl
                                        .onSaleProductList[e.key].slug!,
                                        
                                    homeCtrl: homeCtrl);
                              },
                              child: DashboardProductCard(
                                data: homeCtrl.onSaleProductList[e.key],
                                isFit: true,
                              ).paddingOnly(
                                right: AppScreenUtil().screenWidth(10),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    : const SizedBox(
                        height: 70,
                        child: Center(
                          child: Text('No Product Available'),
                        ),
                      ),
              ],
            )
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }
}

class RecentlyViewedLayout extends StatefulWidget {
  final String title;

  const RecentlyViewedLayout({Key? key, required this.title}) : super(key: key);

  @override
  State<RecentlyViewedLayout> createState() => _RecentlyViewedLayoutState();
}

class _RecentlyViewedLayoutState extends State<RecentlyViewedLayout> {
  // Timer? timer;
  // ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // timer = Timer.periodic(const Duration(seconds: 6), (_) async {
    //   double currentPosition = scrollController.offset; // Assuming uniform item height
    //   double newPosition = currentPosition + (2 * 100);
    //   double itemHeight = scrollController.position.extentTotal;
    //
    //   if (newPosition >= scrollController.position.maxScrollExtent - (2 * 100)) {
    //     await Future.delayed(const Duration(seconds: 3));
    //     newPosition = 0.0; // Jump to the beginning
    //   } else {
    //     newPosition = newPosition.clamp(0.0, scrollController.position.maxScrollExtent);
    //     if (newPosition == currentPosition && newPosition < scrollController.position.maxScrollExtent) {
    //       newPosition += itemHeight; // Ensure scrolling even near the end
    //     }
    //   }
    //   if (scrollController.hasClients) {
    //     scrollController.animateTo(
    //       newPosition.clamp(0.0, scrollController.position.maxScrollExtent),
    //       curve: Curves.ease,
    //       duration: const Duration(milliseconds: 500),
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeCtrl) {
      return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppScreenUtil().screenWidth(15),
            vertical: AppScreenUtil().screenHeight(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LatoFontStyle(
                      text: widget.title,
                      fontSize: FontSizes.f14,
                      fontWeight: FontWeight.w700,
                      color: homeCtrl.appCtrl.appTheme.blackColor,
                    ),
                    TextButton(
                      onPressed: () {
                        var data = {
                          'name': widget.title,
                          'cat_id': "on_recent"
                        };
                        Get.toNamed(routeName.shopPage, arguments: data);
                      },
                      child: Text('View More',
                          style: TextStyle(
                              color: homeCtrl.appCtrl.appTheme.blackColor)),
                    ),
                  ],
                ),
                const Space(0, 15),
                homeCtrl.recentlyViewedList.isNotEmpty
                    ? SingleChildScrollView(
                        // controller: scrollController,
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: homeCtrl.recentlyViewedList
                              .asMap()
                              .entries
                              .map((e) {
                            return GestureDetector(
                              onTap: () {
                                appCtrl.goToProductDetail(
                                    slug: homeCtrl
                                        .recentlyViewedList[e.key].slug!,
                                        // .toString()
                                        );
                              },
                              child: DashboardProductCard(
                                data: homeCtrl.recentlyViewedList[e.key],
                                isFit: true,
                              ).paddingOnly(
                                right: AppScreenUtil().screenWidth(10),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    : const SizedBox(
                        height: 70,
                        child: Center(
                          child: Text('No Product Available'),
                        ),
                      ),
              ],
            )
          ],
        ),
      );
    });
  }

  @override
  void dispose() {
    // timer?.cancel();
    super.dispose();
  }
}
