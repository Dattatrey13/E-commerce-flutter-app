import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/main.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:video_player/video_player.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCtrl = Get.put(HomeController());

  // VideoPlayerController? _videoPlayerController;
  // Future<void>? _initializeVideoPlayerFuture;

  // @override
  // void initState() {
  //   super.initState();
  //   _videoPlayerController = VideoPlayerController.asset('assets/video/DapperBannerVideoMobile.mp4')
  //     ..setLooping(true)
  //     ..setVolume(1.0);
  //
  //   _initializeVideoPlayerFuture = _videoPlayerController!.initialize().then((_) {
  //     _videoPlayerController!.play();
  //     setState(() {}); // This rebuilds after initialization
  //   });
  // }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // @override
  // void dispose() {
  //   _videoPlayerController?.dispose();
  //   super.dispose();
  // }

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
            textDirection: homeCtrl.appCtrl.isRTL || homeCtrl.appCtrl.languageVal == "ar"
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
                      // GestureDetector(
                      //   onTap: () async {
                      //     await homeCtrl.getLocationList();
                      //   },
                      //   child: Container(
                      //     height: size.height / 18,
                      //     padding: const EdgeInsets.only(left: 15),
                      //     child: Row(
                      //       children: [
                      //         const Icon(Icons.location_on),
                      //         const SizedBox(width: 7),
                      //         Text(
                      //           UserSingleton().selectedLocation != null
                      //               ? "Deliver to ${UserSingleton().selectedLocation}"
                      //               : 'Select Location',
                      //           style: TextStyle(
                      //               fontSize: size.height / 55,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(height: 20),
                      CarouselSlider(
                        items: homeCtrl.images.map((imagePath) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  int index = homeCtrl.images.indexOf(imagePath);
                                  if (index == 0) {
                                    Get.toNamed(routeName.buildYourHome);
                                  } else if (index == 1) {
                                    Get.toNamed(routeName.getQuote);
                                  }
                                },
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width, // Full width
                                  height: 300, // Set your desired height here
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.asset(
                                      imagePath,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 200, // Same as above or adjusted value
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          viewportFraction: 1.0,
                        ),
                      ),


                      const SizedBox(height: 10),
                      // Card(
                      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      //   clipBehavior: Clip.hardEdge,
                      //   child: AspectRatio(
                      //     aspectRatio: 16 / 9,
                      //     child: GestureDetector(
                      //       onTap: () {
                      //         Get.toNamed(routeName.buildYourHome);
                      //       },
                      //       child: _videoPlayerController == null
                      //           ? const Center(child: CircularProgressIndicator())
                      //           : FutureBuilder(
                      //         future: _initializeVideoPlayerFuture,
                      //         builder: (context, snapshot) {
                      //           if (snapshot.connectionState == ConnectionState.done) {
                      //             return VideoPlayer(_videoPlayerController!);
                      //           } else {
                      //             return const Center(child: CircularProgressIndicator());
                      //           }
                      //         },
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      // const BorderLineLayout(),
                      // const SizedBox(height: 20),
                      const HomeCategoryList(),

                      const BorderLineLayout(),
                      if (homeCtrl.getAllCouponsModel != null &&
                          homeCtrl.getAllCouponsModel!.data != null &&
                          homeCtrl.getAllCouponsModel!.data!.isNotEmpty)
                        const OfferCorner(),
                      RecommendedForYouLayout(title: 'New Arrival'),

                      const BorderLineLayout(),
                      // homeCtrl.onSaleProductList.isNotEmpty
                      //     ? const OnSaleLayout(title: 'Sale Products')
                      //     : Container(),
                      Visibility(
                        visible: UserSingleton().token != null,
                        child: const Column(
                          children: [
                            BorderLineLayout(),
                            // NewArrivalProductListLayout(title: 'New Arrival'),
                            // BorderLineLayout(),
                            const keyChainLayout(title: 'keyChain'),
                            // BorderLineLayout(),
                            // RecentlyViewedLayout(title: 'Recently Viewed'),
                            // BorderLineLayout(),
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
    awesomeNotifications!.setListeners(onActionReceivedMethod: onActionReceivedMethod);
  }
}


