import 'package:dapperz/config.dart';

class Search extends StatelessWidget {
  final searchCtrl = Get.put(SearchScreenController());

  Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(builder: (_) {
      return Directionality(
        textDirection:
            searchCtrl.appCtrl.isRTL || searchCtrl.appCtrl.languageVal == "ar"
                ? TextDirection.rtl
                : TextDirection.ltr,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchWidget().searchAndBackArrow(
                    searchCtrl.controller, searchCtrl.controller.text),
                // recent search list layout
                // SearchWidget().commonText(SearchFont().recentSearch),
                Visibility(
                  visible: searchCtrl.recentSearchList != null,
                  child: Column(
                    children: [
                      ...?searchCtrl.recentSearchList?.pitems?.map((e) {
                        return RecentSearchCard(data: e);
                      }).toList(),
                    ],
                  ),
                ),
                // SearchWidget().commonText(SearchFont().recommendedForYou),
                // recommended list layout
                // UserSingleton().token != null && HomeController().recommendedForYouList.isNotEmpty
                //     ? const RecommendedForYouLayout(title: 'Recommended For You')
                //     : Container(),
                Visibility(
                  visible: searchCtrl.categories != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Space(0, 10),
                      SearchWidget().commonText("Categories"),
                      // RecentCategoryCard(data: searchCtrl.categories!.citems),
                      ...?searchCtrl.categories?.citems?.map((e) {
                        return RecentCategoryCard(data: e);
                      }).toList(),
                    ],
                  ),
                ),
                Visibility(
                  visible: searchCtrl.brandList != null,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Space(0, 10),
                      SearchWidget().commonText("Brands"),
                      ...?searchCtrl.brandList?.bitems?.map((e) {
                        return RecentBrandsCard(data: e);
                      }).toList(),
                    ],
                  ),
                ),
                const Space(0, 20),
                SearchWidget().commonText(SearchFont().trendingCategory),
                // trending category layout
                const SliderData(),
                //SearchWidget().commonText(SearchFont().topBrandFordapperz),
                // brand list layout
                const Brands(),
                // const CommonBrandLayout()
              ],
            ),
          ),
        ),
      );
    });
  }
}
