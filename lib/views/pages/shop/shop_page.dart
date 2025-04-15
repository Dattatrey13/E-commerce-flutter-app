import 'package:dapperz/common/array/profile_list.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/shimmer_layouts/category_shimmer/shop_shimmer.dart';
import 'package:dapperz/views/pages/shop/shop_list_layout.dart';
import 'package:flutter/cupertino.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final shopCtrl = Get.put(ShopController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(builder: (_) {
      return Directionality(
        textDirection:
            shopCtrl.appCtrl.isRTL || shopCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: shopCtrl.appCtrl.appTheme.whiteColor,
            automaticallyImplyLeading: false,
            leading: Icon(CupertinoIcons.arrow_left,
                    size: AppScreenUtil().size(25),
                    color: shopCtrl.appCtrl.appTheme.blackColor)
                .gestures(
              onTap: () {
                Get.back();
              },
            ),
            title: shopCtrl.isLoading
                ? Container()
                : CommonAppBarTitle(
                    title: shopCtrl.name.tr,
                    desc: "${shopCtrl.totalProducts} ${ShopFont().products}",
                  ),
            actions: [
              const SearchIcon().paddingSymmetric(
                horizontal: AppScreenUtil().screenWidth(appCtrl.isSearch
                    ? appCtrl.isNotification
                        ? 0
                        : 10
                    : 10),
              ),
            ],
          ),
          body: RefreshIndicator(
            displacement: 100,
            backgroundColor: Colors.white,
            color: appCtrl.appTheme.primary,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              shopCtrl.getData();
            },
            child: SingleChildScrollView(
              controller: shopCtrl.scrollController,
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        //search text box layout
                        Expanded(
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              // FloatingSearchBar(
                              //   hint: 'Ex. Name',
                              //   scrollPadding: const EdgeInsets.only(top: 10, bottom: 56),
                              //   transitionDuration: const Duration(milliseconds: 800),
                              //   transitionCurve: Curves.easeInOut,
                              //   physics: const BouncingScrollPhysics(),
                              //   axisAlignment: true ? 0.0 : -1.0,
                              //   openAxisAlignment: 0.0,
                              //   width: true ? 600 : 500,
                              //   debounceDelay: const Duration(milliseconds: 500),
                              //   onQueryChanged: (query) async {
                              //     // if (query.isNotEmpty) {
                              //     //   searchVm.searchByKeyword(context, query);
                              //     // } else {
                              //     //   profileList.clear();
                              //     // }
                              //     // setState(() {});
                              //   },
                              //   transition: CircularFloatingSearchBarTransition(),
                              //   actions: [
                              //     FloatingSearchBarAction(
                              //       showIfOpened: false,
                              //       child: CircularButton(
                              //         icon: const Icon(Icons.person),
                              //         onPressed: () {},
                              //       ),
                              //     ),
                              //     FloatingSearchBarAction.searchToClear(
                              //       showIfClosed: false,
                              //     ),
                              //   ],
                              //   builder: (context, transition) {
                              //     return ClipRRect(
                              //       borderRadius: BorderRadius.circular(8),
                              //       child: Material(
                              //         color: Colors.white,
                              //         elevation: 4.0,
                              //         child: Column(
                              //           mainAxisSize: MainAxisSize.min,
                              //           children: [
                              //             SizedBox(
                              //               child: profileList.isNotEmpty
                              //                   ? ListView.builder(
                              //                       shrinkWrap: true,
                              //                       itemCount: profileList.length,
                              //                       physics: const ScrollPhysics(),
                              //                       itemBuilder: (context, index) {
                              //                         return Padding(
                              //                           padding: const EdgeInsets.all(10.0),
                              //                           child: GestureDetector(
                              //                             onTap: () {
                              //                               // Navigator.push(
                              //                               //   context,
                              //                               //   MaterialPageRoute(
                              //                               //     builder: (context) => ViewProfile(data, false),
                              //                               //   ),
                              //                               // );
                              //                             },
                              //                             child: const Text(
                              //                               "{profileList[index]} {profileList[index].middleName} {profileList[index].surName}",
                              //                             ),
                              //                           ),
                              //                         );
                              //                       },
                              //                     )
                              //                   : const SizedBox(
                              //                       height: 60.0,
                              //                       child: Center(
                              //                         child: Text('No Result Found'),
                              //                       ),
                              //                     ),
                              //             ),
                              //           ],
                              //         ),
                              //       ),
                              //     );
                              //   },
                              // ),
                              Visibility(
                                visible: profileList.isEmpty,
                                child: const Center(
                                  child: Text('Search people here...'),
                                ),
                              ),
                            ],
                          ),
                          // child: SearchTextBox(
                          //   controller: shopCtrl.controller,
                          //   suffixIcon: SearchWidget().suffixIcon(),
                          //   prefixIcon: SearchWidget().prefixIcon(),
                          // ),
                        ),
                        //filter icon layout
                        const FilterIconLayout().gestures(
                          onTap: () async {
                            var filterApplied = await Navigator.of(context)
                                .push(shopCtrl.createRoute());
                            if (filterApplied != null) {
                              // if(filterApplied['cat_id'] == null)
                              //
                              // {
                              //   filterApplied['cat_id'] = ;
                              // }
                              shopCtrl.getProductList(
                                filterApplied['current_page'],
                                filterApplied['cat_id'],
                                filterApplied['cat_id_string'],
                                true,
                                filterApplied['filterString'],
                                brand: shopCtrl.isBrand,
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  const Space(0, 20),
                  // shop list layout
                  shopCtrl.appCtrl.isShimmer
                      ? const ShopShimmer()
                      : const ShopListLayout(),
                  shopCtrl.lastPage && shopCtrl.productList.isNotEmpty
                      ? const SizedBox(
                          height: 50,
                          child: Column(
                            children: [
                              Text('No more products'),
                            ],
                          ),
                        )
                      : !shopCtrl.isLoading &&
                              shopCtrl.lastListLoader &&
                              shopCtrl.productList.isNotEmpty
                          ? const SizedBox(
                              height: 60,
                              child: Center(child: CircularProgressIndicator()))
                          : Container(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    Get.delete<ShopController>();
    Get.delete<FilterController>();
    super.dispose();
  }
}
