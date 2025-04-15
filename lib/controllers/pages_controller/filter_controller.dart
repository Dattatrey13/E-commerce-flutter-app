import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;
import 'package:dapperz/models/product/filter_data_model.dart' as fdm;
import 'package:dapperz/models/product/sort_by_list_model.dart' as sm;

import '../../api/api_method_list.dart';
import '../../config.dart';

class FilterController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());
  RangeValues? currentRangeValues = const RangeValues(0.0, 2.0);
  fdm.Data? filterDataModel;
  List<cm.Data> categoryList = [];
  List categoryFilterList = [];
  List<sm.SortByList> sortByList = [];

  List occasionFilterList = [];
  List sizeList = [];
  List colorList = [];
  String dropDownVal = "";
  int selectedBrand = -1;

  BaseApi apiCall = ApiServiceCall();
  bool isLoading = true;

  // Brand Selection
  selectBrandFunction(index) {
    selectedBrand = index;
    update();
  }

  // Reset
  resetFilter(String? listType) {
    dropDownVal = "noSorting";
    selectedBrand = -1;
    String? filterString;
    if (filterDataModel!.maxPrice! < 100000) {
      currentRangeValues = RangeValues(
        double.parse(filterDataModel!.minPrice.toString()),
        double.parse(100000.toString()),
      );
      filterDataModel!.maxPrice = 100000;
    } else {
      currentRangeValues = RangeValues(
        double.parse(filterDataModel!.minPrice.toString()),
        double.parse(filterDataModel!.maxPrice.toString()),
      );
    }
    update();
    ShopController shopCtrl = ShopController();

    if (dropDownVal != 'noSorting') {
      filterString = "&sort_by=$dropDownVal";
    }

    if (currentRangeValues!.start != 0 && currentRangeValues!.end != 100) {
      filterString =
          "$filterString&min_price=${currentRangeValues!.start.toInt()}&max_price=${currentRangeValues!.end.toInt()}";
    }

    String catId = "";
    String catIdString = "";

    if (listType == 'All' ||
        listType == 'featured_product' ||
        listType == 'best_selling' ||
        listType == 'on_sale' ||
        listType == 'on_recent' ||
        listType == 'recommended_product') {
      catId = listType ?? "All";

      if (selectedBrand == -1) {
        catIdString = "";
      } else {
        catIdString = categoryList[selectedBrand].id.toString();
      }
    }
    shopCtrl.applyFilter(catId, catIdString, filterString!);
  }

  @override
  void onReady() async {
    await getFilterData();
    update();
    super.onReady();
  }

  getFilterData() async {
    try {
      dynamic response = await apiCall.getResponse(ApiMethodList.filters);
      filterDataModel = fdm.FilterDataModel.fromJson(response).data!;
      await getCategoryList();
      await getSortList();

      if (filterDataModel != null && sortByList.isNotEmpty) {
        selectedBrand = -1;
        dropDownVal = "noSorting";
      }
      if (filterDataModel!.maxPrice! > 1000000) {
        currentRangeValues = RangeValues(
          double.parse(filterDataModel!.minPrice.toString()),
          double.parse(1000000.toString()),
        );

        filterDataModel!.maxPrice = 1000000;
      } else {
        currentRangeValues = RangeValues(
          double.parse(filterDataModel!.minPrice.toString()),
          double.parse(filterDataModel!.maxPrice.toString()),
        );
      }
      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      rethrow;
    }
  }

  bool isAlphanumeric(String input) {
    RegExp regExp = RegExp(r'^[a-zA-Z\s&]+$');
    return regExp.hasMatch(input);
  }

  getCategoryList() async {
    try {
      categoryList.clear();
      dynamic response = await apiCall.getResponse(ApiMethodList.allCategory);
      if (cm.AllCategoryModel.fromJson(response).data != null) {
        for (var element in cm.AllCategoryModel.fromJson(response).data!) {
          if (element.imageUrl != null) {
            categoryList.add(element);
          }
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  getSortList() {
    try {
      sortByList.clear();
      dynamic response = {
        "data": {
          "sort_by_list": [
            {"name": "Popularity", "key": "popularity"},
            {"name": "Average Rating", "key": "average_rating"},
            {"name": "Latest", "key": "latest"},
            {"name": "Low to High", "key": "low_to_high"},
            {"name": "High to Low", "key": "high_to_low"}
          ]
        }
      };
      if (sm.SortbyListModel.fromJson(response).data != null) {
        sortByList
            .addAll(sm.SortbyListModel.fromJson(response).data!.sortByList!);
      }
    } catch (e) {
      rethrow;
    }
  }
}
