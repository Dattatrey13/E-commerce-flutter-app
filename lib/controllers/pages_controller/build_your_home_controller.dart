import 'dart:collection';

import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/models/dashboard/all_category_model.dart' as cm;
import 'package:dapperz/models/form_submit_model.dart';
import 'package:dapperz/models/product/get_location_list_model.dart' as gllm;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../../api/api_method_list.dart';
import '../../config.dart';

class BuildYourHomeController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  bool isLoading = true;
  List<gllm.Children> locationList = [];
  List<cm.Data> homeCategoryList = [];

  List<String> requirements = [
    " -Select Option- ",
    "2D Plan Layout",
    "3D Views",
    "Interior Design",
  ];

  List<String> areaName = [
    "Living Room",
    "Bedroom",
    "Parking",
    "Kitchen",
    "Toilet Bathroom",
  ];

  List<String> quoteRequirements = [
    "Building Material",
    "Tiles",
    "Sanitary",
    "Plumbing",
    "Colors",
    "Electricals",
    "Fabrication Material",
    "Furniture",
    "Door & Windows",
  ];

  List<bool> areaNameSelection = [false, false, false, false, false];

  String? stateSelectedValue;
  cm.Children? quoteCategorySelectedValue;
  String? quoteRequirementsSelectedValue;
  gllm.Children? selectedCity;
  List<String> uploadedImage = [];

  BaseApi apiCall = ApiServiceCall();

  @override
  void onReady() {
    stateSelectedValue = requirements.first;
    quoteRequirementsSelectedValue = quoteRequirements.first;
    getCategoryList();
    update();
    super.onReady();
  }

  getACallSubmit(HashMap<String, String> params) async {
    try {
      dynamic response =
          await apiCall.postRequest(ApiMethodList.productGetACall, params);
      return FormSubmitModel.fromJson(response).success ?? false;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to Submit Request");
      rethrow;
    }
  }

  buildYourHomeSubmit(
      HashMap<String, String> params, List<String> images) async {
    try {
      dynamic response = await apiCall.uploadImageWithDataRequest(
          ApiMethodList.buildHome, params, images);
      return FormSubmitModel.fromJson(response).success ?? false;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unable to Submit Request");
      rethrow;
    }
  }

  getImage() async {
    try {
      uploadedImage.clear();
      List<XFile>? images = await ImagePicker().pickMultiImage();
      if (images.isNotEmpty) {
        for (var element in images) {
          uploadedImage.add(element.path);
        }
        update();
      } else {
        Fluttertoast.showToast(msg: "Please Select Image First");
      }
    } catch (e) {
      //toast(TranslationService.of(context)!.translate("Something Went Wrong!"));
    }
  }

  getLocationList() async {
    try {
      locationList.clear();
      dynamic response = await apiCall.getResponse(ApiMethodList.locationList);
      for (var element in gllm.GetLocationListModel.fromJson(response)
          .data!
          .first
          .children!) {
        locationList.addAll(element.children ?? []);
      }
      selectedCity = locationList.first;
      isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }

  getCategoryList() async {
    try {
      homeCategoryList.clear();
      dynamic response = await apiCall.getResponse(ApiMethodList.allCategory);
      if (cm.AllCategoryModel.fromJson(response).data != null) {
        for (var element in cm.AllCategoryModel.fromJson(response).data!) {
          homeCategoryList.add(element);
        }
      }
      getLocationList();
    } catch (e) {
      rethrow;
    }
  }
}
