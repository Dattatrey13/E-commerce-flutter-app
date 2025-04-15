import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';

import '../../config.dart';
import '../../models/address_list_model.dart' as al;

class DeliveryDetailController extends GetxController {
  final appCtrl = Get.isRegistered<AppController>()
      ? Get.find<AppController>()
      : Get.put(AppController());

  int? billingSelectRadio;
  AddressListModel? deliveryDetail;
  AddressListModel? shippingDetail;
  al.Data? selectedBAddress;
  int? shippingSelectRadio;

  // AddressListModel? deliverySDetail;
  al.Data? selectedSAddress;
  bool isLoading = true;
  String totalAmount = "0";

  BaseApi apiCall = ApiServiceCall();

  TextEditingController txtOrderNotes = TextEditingController();

  FocusNode focusTxtOrderNotes = FocusNode();

  bool? isNewShippingAddress;

  // select address
  selectBAddress(val, index) {
    selectedBAddress = val;
    billingSelectRadio = index;
    update();
  }

  // select address
  selectSAddress(val, index) {
    selectedSAddress = val;
    shippingSelectRadio = index;
    update();
  }

  @override
  void onReady() async {
    totalAmount = Get.arguments.toString();
    isNewShippingAddress = false;
    Future.delayed(const Duration(milliseconds: 100), () async {
      await getShippingAddress();
      await getAddress();
    });
    update();
    super.onReady();
  }

  getAddress() async {
    try {
      isLoading = true;
      update();
      dynamic response =
          await apiCall.getResponse(ApiMethodList.userAddressList);
      deliveryDetail = AddressListModel.fromJson(response);
      for (int i = 0; i < deliveryDetail!.data!.length; i++) {
        selectedBAddress = deliveryDetail!.data![i].isDefault! == true
            ? deliveryDetail!.data![i]
            : deliveryDetail!.data![0];
        billingSelectRadio =
            deliveryDetail!.data![i].isDefault! == true ? i : 0;
      }
      isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }

  getShippingAddress() async {
    try {
      isLoading = true;
      update();
      dynamic response = await apiCall.getResponse(
          "${ApiMethodList.userAddressList}?is_on_checkout=true&is_shipping=true");
      shippingDetail = AddressListModel.fromJson(response);
      for (int i = 0; i < shippingDetail!.data!.length; i++) {
        selectedSAddress = shippingDetail!.data![i].isDefault! == true
            ? shippingDetail!.data![i]
            : shippingDetail!.data![0];
        shippingSelectRadio =
            shippingDetail!.data![i].isDefault! == true ? i : 0;
      }
      isLoading = false;
      update();
    } catch (e) {
      rethrow;
    }
  }

// checkPincode() async {
//   try {
//     String params =
//         "?location=${UserSingleton().selectedLocation}&pincode=${isNewShippingAddress ? txtShippingPinCode.text.trim() : txtBillingPinCode.text.trim()}";
//     dynamic response = await ApiServiceCall().getResponse(ApiMethodList.productPincodeCheck + params);
//     if (CheckPincodeModel.fromJson(response).success != null && CheckPincodeModel.fromJson(response).success == true) {
//       if (CheckPincodeModel.fromJson(response).data != null && (CheckPincodeModel.fromJson(response).data!.isValid ?? false)) {
//         UserSingleton().orderNotes = txtOrderNotes.text.trim();
//         Get.toNamed(routeName.payment, arguments: totalAmount.toString());
//       } else {
//         Fluttertoast.showToast(msg: "Currently we are not delivering at this location");
//       }
//     } else {
//       Fluttertoast.showToast(msg: "Please Select Valid Pincode");
//     }
//   } catch (e) {
//     rethrow;
//   }
// }
}
