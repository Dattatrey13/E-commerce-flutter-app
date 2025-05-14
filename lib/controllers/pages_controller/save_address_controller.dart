import 'dart:collection';

import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common_methods.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config.dart';
import '../../models/user/update_profile_model.dart';

class SaveAddressController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  String value = "address";
  int selectRadio = 0;
  AddressListModel? deliveryDetail;
  bool isLoading = true;

  BaseApi apiCall = ApiServiceCall();

  //select address
  selectAddress(val, index) {
    value = val.name!;
    selectRadio = index;
    update();
  }

  @override
  void onReady() async {
    update();
    await Future.delayed(DurationsClass.s1);
    await getAddress();
    super.onReady();
  }

  // getAddress() async {
  //   try {
  //     isLoading = true;
  //     update();
  //     dynamic response =
  //         await apiCall.getResponse(ApiMethodList.userAddressList);
  //     deliveryDetail = AddressListModel.fromJson(response);
  //     isLoading = false;
  //     update();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
  getAddress() async {
    try {
      isLoading = true;
      update();

      // Make the API call to fetch the address list
      dynamic response = await apiCall.getResponse(ApiMethodList.userAddressList);

      print("Address Response: $response");

      // Check if response is valid (not null or empty)
      if (response != null && response is Map) {
        // Check if the response contains the expected key
        if (response.containsKey('is_success') && response.containsKey('data')) {
          // Parse the response into the AddressListModel
          deliveryDetail = AddressListModel.fromJson(response);
        } else {
          // Handle error if expected keys are not found
          deliveryDetail = AddressListModel(isSuccess: false, data: [], message: 'Invalid response structure');
          Fluttertoast.showToast(msg: 'Failed to load addresses.');
        }
      } else {
        // Handle case where the response is null or not a map
        deliveryDetail = AddressListModel(isSuccess: false, data: [], message: 'No data received.');
        Fluttertoast.showToast(msg: 'Failed to load addresses.');
      }

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
      update();
      // Handle any other errors during the request
      Fluttertoast.showToast(msg: 'Error fetching addresses: $e');
      rethrow; // Optional: rethrow to handle in calling code
    }
  }


  deleteAddress(String id) async {
    try {
      showProgressDialog(true);
      dynamic response =
          await apiCall.deleteRequest("${ApiMethodList.userAddressList}$id/");
      bool? status = AddressListModel.fromJson(response).isSuccess ?? false;
      if (status) {
        showProgressDialog(false);
        Fluttertoast.showToast(msg: "Address deleted successfully");
        getAddress();
      } else {
        showProgressDialog(false);
        Fluttertoast.showToast(msg: "Unable to delete address");
      }
      update();
    } catch (e) {
      rethrow;
    }
  }

  defaultAddress(String id, HashMap<String, dynamic> params) async {
    try {
      showProgressDialog(true);
      dynamic response = await apiCall.patchRequest(
          "${ApiMethodList.userAddress}$id/", params);
      //bool? status = UpdateProfileModel.fromJson(response).success ?? false;
      if (UpdateProfileModel.fromJson(response).isSuccess != null &&
          UpdateProfileModel.fromJson(response).isSuccess!) {
        showProgressDialog(false);
        Fluttertoast.showToast(msg: "Address set default successfully");
        getAddress();
        Get.forceAppUpdate();
      } else {
        showProgressDialog(false);
        Fluttertoast.showToast(msg: "Unable to set default address");
      }
      update();
    } catch (e) {
      rethrow;
    }
  }
}
