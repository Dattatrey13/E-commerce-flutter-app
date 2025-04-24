import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/main.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCtrl = Get.put(HomeController());

  @override
  void initState() {
    listen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double tabletMobile = MediaQuery.of(context).size.width > 600 ? 4.3 : 5.3;
    return GetBuilder<HomeController>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () async {
            Get.dialog(
              AlertDialog(
                content: const SizedBox(
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Do you want to exit?"),
                    ],
                  ),
                ),
                shape: const Border.symmetric(),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("No"),
                  ),
                  TextButton(
                    onPressed: () {
                      Future.delayed(const Duration(seconds: 1));
                      Get.back();
                      exit(0);
                    },
                    child: const Text("Yes"),
                  ),
                ],
              ),
            );

            return false;
          },
          child: Directionality(
            textDirection:
                homeCtrl.appCtrl.isRTL || homeCtrl.appCtrl.languageVal == "ar"
                    ? TextDirection.rtl
                    : TextDirection.ltr,
            child: RefreshIndicator(
              displacement: 100,
              backgroundColor: Colors.white,
              color: appCtrl.appTheme.primary,
              strokeWidth: 3,
              triggerMode: RefreshIndicatorTriggerMode.onEdge,
              onRefresh: () async {
                homeCtrl.getData();
                homeCtrl.update();
              },
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: homeCtrl.appCtrl.isShimmer
                    ? const HomerShimmer()
                    : SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Done
                            GestureDetector(
                              onTap: () async {
                                await homeCtrl.getLocationList();
                              },
                              child: Container(
                                // color: Colors.green,
                                height: size.height / 18,
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  children: [
                                    const Icon(Icons.location_on),
                                    const SizedBox(width: 7),
                                    Text(
                                      UserSingleton().selectedLocation != null
                                          ? "Deliver to ${UserSingleton().selectedLocation}"
                                          : 'Select Location',
                                      style: TextStyle(
                                          fontSize: size.height / 55,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // const SizedBox(height: 15),
                            const HomeCategoryList(),
                            const SizedBox(height: 15),
                            // CarouselSlider(
                            //   items: homeCtrl.images.map((i) {
                            //     return Builder(
                            //       builder: (BuildContext context) {
                            //         return GestureDetector(
                            //           onTap: () {
                            //             int index = homeCtrl.images.indexOf(i);
                            //             if (index == 0) {
                            //               Get.toNamed(routeName.buildYourHome);
                            //             } else if (index == 1) {
                            //               Get.toNamed(routeName.getQuote);
                            //             }
                            //           },
                            //           child: Card(
                            //             shape: RoundedRectangleBorder(
                            //                 borderRadius:
                            //                     BorderRadius.circular(10)),
                            //             clipBehavior: Clip.hardEdge,
                            //             child:
                            //                 Image.network(i, fit: BoxFit.fill),
                            //           ),
                            //         );
                            //       },
                            //     );
                            //   }).toList(),
                            //   options: CarouselOptions(
                            //     height: size.longestSide / tabletMobile,
                            //     autoPlay: true,
                            //     autoPlayInterval: const Duration(seconds: 3),
                            //     autoPlayAnimationDuration:
                            //         const Duration(milliseconds: 800),
                            //     autoPlayCurve: Curves.fastOutSlowIn,
                            //   ),
                            // ),
                            const SizedBox(height: 15),
                            const BorderLineLayout(),
                            // Remaining
                            const SliderData(),
                            const BorderLineLayout(),
                            if (homeCtrl.getAllCouponsModel != null &&
                                homeCtrl.getAllCouponsModel!.data != null &&
                                homeCtrl.getAllCouponsModel!.data!.isNotEmpty)
                              const OfferCorner(),
                            const BorderLineLayout(),
                            // Remaining
                            // FeaturedCategoriesLayout(title: 'Discount for you'),
                            // BorderLineLayout(),
                            // Done
                            const FeaturedCategoriesLayout(
                                title: 'Featured Products'),
                            const BorderLineLayout(),
                            // Remaining
                            // const Brands(),
                            // const BorderLineLayout(),
                            const BestSellingLayout(
                                title: 'Best Selling Products'),
                            const BorderLineLayout(),
                            homeCtrl.onSaleProductList.isNotEmpty
                                ? const OnSaleLayout(title: 'Sale Products')
                                : Container(),
                            Visibility(
                              visible: UserSingleton().token != null,
                              child: const Column(
                                children: [
                                  BorderLineLayout(),
                                  RecommendedForYouLayout(
                                      title: 'Recommended For You'),
                                  BorderLineLayout(),
                                  RecentlyViewedLayout(
                                      title: 'Recently Viewed'),
                                  BorderLineLayout(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        );
      },
    );
  }

  void listen() {
    FirebaseMessaging.instance.getInitialMessage().then((message) async {
      if (message != null) {
        await notification(message);
      }
    });
    awesomeNotifications!
        .setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }
}
