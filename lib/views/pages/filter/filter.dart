import '../../../config.dart';

class Filter extends StatelessWidget {
  final String? listType;
  final String? productId;
  final filterCtrl = Get.put(FilterController());

  Filter({Key? key, this.listType, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(builder: (_) {
      return Directionality(
        textDirection: filterCtrl.appCtrl.isRTL || filterCtrl.appCtrl.languageVal == "ar" ? TextDirection.rtl : TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(FilterFont().filters),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            actions: const [
              CloseSquareIcon(),
            ],
          ),
          body: filterCtrl.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FilterWidget().titleText(FilterFont().sortBy),
                          const Space(0, 20),
                          // short by layout
                          const SortByLayout(),
                          listType == 'All' ||
                                  listType == 'featured_product' ||
                                  listType == 'best_selling' ||
                                  listType == 'on_sale' ||
                                  listType == 'on_recent' ||
                                  listType == 'recommended_product'
                              ? FilterWidget().titleText(FilterFont().categoryFilter)
                              : Container(),
                          // brand layout
                          listType == 'All' ||
                                  listType == 'featured_product' ||
                                  listType == 'best_selling' ||
                                  listType == 'on_sale' ||
                                  listType == 'on_recent' ||
                                  listType == 'recommended_product'
                              ? const CategoryLayout()
                              : Container(),
                          // size layout
                          // FilterWidget().titleText(FilterFont().size),
                          // const SizeLayout(),
                          // const Space(0, 20),
                          FilterWidget().titleText(FilterFont().price),
                          const Space(0, 20),
                          // range slider
                          const RangeValueLayout(),
                          const Space(0, 20),
                          // occasion layout
                          // FilterWidget().titleText(FilterFont().occasion),
                          // const OccasionLayout(),
                          // const Space(0, 20),
                          // FilterWidget().titleText(FilterFont().colors),
                          // color layout
                          // const ColorLayout(),
                          const Space(0, 40)
                        ],
                      ).marginSymmetric(
                        horizontal: AppScreenUtil().screenWidth(15),
                      ),
                      BottomLayout(
                        firstButtonText: FilterFont().reset,
                        secondButtonText: FilterFont().applyFilter,
                        firstTap: () => filterCtrl.resetFilter(listType),
                        secondTap: () {
                          ShopController shopCtrl = ShopController();

                          String? filterString = "&sort_by=${filterCtrl.dropDownVal}";
                          filterString =
                              "$filterString&min_price=${filterCtrl.currentRangeValues!.start.toInt()}&max_price=${filterCtrl.currentRangeValues!.end.toInt()}";

                          String catId = "";
                          String catIdString = "";

                          if (listType == 'All' ||
                              listType == 'featured_product' ||
                              listType == 'best_selling' ||
                              listType == 'on_sale' ||
                              listType == 'on_recent' ||
                              listType == 'recommended_product') {
                            catId = listType ?? "All";
                            // if (filterCtrl.selectedBrand.isNotEmpty) {
                            //   if (filterCtrl.selectedBrand.length > 1) {
                            //     for (var element in filterCtrl.selectedBrand) {
                            //       if (filterCtrl.selectedBrand.indexOf(element) == filterCtrl.selectedBrand.length - 1) {
                            //         catIdString = "$catIdString${filterCtrl.categoryList[element].id.toString()}";
                            //       } else {
                            //         catIdString = "$catIdString${filterCtrl.categoryList[element].id.toString()},";
                            //       }
                            //     }
                            //   } else
                              if (filterCtrl.selectedBrand == -1) {
                                catIdString = "";
                              } else {
                                catIdString = filterCtrl.categoryList[filterCtrl.selectedBrand].id.toString();
                              }
                            }
                          else {
                            catId = listType!;
                            // catIdString = productId!;
                          }

                          shopCtrl.applyFilter(catId, catIdString, filterString);
                        },
                      )
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
