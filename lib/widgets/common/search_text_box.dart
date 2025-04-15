import 'dart:collection';

import '../../config.dart';

class SearchTextBox extends StatelessWidget {
  final TextEditingController? controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hinText;

  const SearchTextBox({Key? key, this.controller, this.suffixIcon, this.prefixIcon, this.hinText = "Search"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (appCtrl) {
      return GetBuilder<SearchScreenController>(builder: (searchCtrl) {
        return SizedBox(
          height: AppScreenUtil().screenHeight(40),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: hinText.tr,
                    hintStyle: TextStyle(
                      fontSize: FontSizes.f16,
                      color: appCtrl.appTheme.contentColor,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.zero,
                    prefix: const Space(10, 0),
                    suffixIconConstraints: BoxConstraints(
                      minHeight: AppScreenUtil().size(45),
                      minWidth: AppScreenUtil().size(45),
                    ),
                    fillColor: appCtrl.appTheme.greyLight25.withOpacity(.6),
                  ),
                  onChanged: (String? val) {
                    String text = searchCtrl.controller.text;
                    searchCtrl.recentSearchList?.pitems?.clear();
                    searchCtrl.autoCompleteSearch(text);
                    searchCtrl.update();
                  },
                  onEditingComplete: () {
                    searchCtrl.autoCompleteSearch(searchCtrl.controller.text.trim());
                  },
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  if (searchCtrl.controller.text.isNotEmpty) {
                    HashMap<String, dynamic> params = HashMap();
                    params['current_page'] = "1";
                    params['name'] = "Search Result";
                    params['cat_id'] = "All";
                    params['cat_id_string'] = "";
                    params['filterString'] = "&q=${searchCtrl.controller.text.trim()}";
                    Get.delete<ShopController>();
                    Get.toNamed(routeName.shopPage, arguments: params);
                  }
                },
                child: const Icon(Icons.search),
              ),
            ],
          ).marginSymmetric(horizontal: AppScreenUtil().screenWidth(15)),
        );
      });
    });
  }
}
