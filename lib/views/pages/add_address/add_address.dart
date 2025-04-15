import 'dart:collection';

import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/models/address_list_model.dart' as alm;
import 'package:dapperz/models/product/get_city_list_model.dart' as gclm;
import 'package:dapperz/models/product/get_state_list_model.dart' as gslm;
import 'package:dapperz/models/user/update_profile_model.dart';
import 'package:dapperz/models/validate_address_model.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../api/api_method_list.dart';
import '../../../config.dart';

class AddAddress extends StatefulWidget {
  final alm.Data? addressData;
  final bool isEdit;

  const AddAddress({Key? key, this.addressData, this.isEdit = false})
      : super(key: key);

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  List<gslm.Data> stateList = [];
  List<gclm.Data> cityList = [];

  bool isLoading = true;

  //text editing controllers
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  TextEditingController txtCompanyName = TextEditingController();
  TextEditingController txtStreetAddress = TextEditingController();
  TextEditingController txtApartment = TextEditingController();
  TextEditingController txtCountry = TextEditingController();
  TextEditingController txtMobileNumber = TextEditingController();
  TextEditingController txtPinCode = TextEditingController();
  TextEditingController txtEmail = TextEditingController();

  //focus node
  FocusNode focusTxtFirstName = FocusNode();
  FocusNode focusTxtLastName = FocusNode();
  FocusNode focusTxtCompanyName = FocusNode();
  FocusNode focusStreetAddress = FocusNode();
  FocusNode focusApartment = FocusNode();
  FocusNode focusTxtCountry = FocusNode();
  FocusNode focusTxtMobileNumber = FocusNode();
  FocusNode focusTxtPinCode = FocusNode();
  FocusNode focusTxtEmail = FocusNode();

  BaseApi apiCall = ApiServiceCall();

  //country list
  gslm.Data? stateSelectedValue;
  gclm.Data? citySelectedValue;

  @override
  void initState() {
    super.initState();
    txtCountry.text = "India";
    Future.delayed(const Duration(milliseconds: 100), () async {
      if (widget.isEdit) {
        txtFirstName.text = widget.addressData!.firstName ?? "";
        txtLastName.text = widget.addressData!.lastName ?? "";
        txtCompanyName.text = widget.addressData!.companyName ?? "";
        txtStreetAddress.text = widget.addressData!.address1 ?? "";
        txtApartment.text = widget.addressData!.address2 ?? "";
        txtCountry.text = widget.addressData!.country ?? "India";
        txtMobileNumber.text = widget.addressData!.phoneNumber ?? "";
        txtPinCode.text = widget.addressData!.pincode ?? "";
        txtEmail.text = widget.addressData!.email ?? "";
      }
      getStateList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: const BackArrowButton(),
        backgroundColor: appCtrl.appTheme.whiteColor,
        title: LatoFontStyle(
          text: widget.isEdit ? "Edit Address" : "Add Address",
          color: appCtrl.appTheme.blackColor,
        ),
      ),
      body: isLoading
          ? Container()
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //form text box
                      Column(
                        children: [
                          CustomTextFormField(
                            radius: 5,
                            labelText: AddAddressFont().firstName,
                            controller: txtFirstName,
                            focusNode: focusTxtFirstName,
                            keyboardType: TextInputType.name,
                            onFieldSubmitted: (value) {
                              AddAddressWidget().fieldFocusChange(
                                  context, focusTxtFirstName, focusTxtLastName);
                            },
                          ),
                          // Last Name
                          const Space(0, 30),
                          CustomTextFormField(
                            radius: 5,
                            labelText: AddAddressFont().lastName,
                            controller: txtLastName,
                            focusNode: focusTxtLastName,
                            keyboardType: TextInputType.name,
                            onFieldSubmitted: (value) {
                              AddAddressWidget().fieldFocusChange(context,
                                  focusTxtLastName, focusTxtCompanyName);
                            },
                          ),
                          // Company Name
                          const Space(0, 30),
                          CustomTextFormField(
                            radius: 5,
                            labelText: "Company Name",
                            controller: txtCompanyName,
                            focusNode: focusTxtCompanyName,
                            onFieldSubmitted: (value) {
                              AddAddressWidget().fieldFocusChange(context,
                                  focusTxtCompanyName, focusStreetAddress);
                            },
                          ),
                          const Space(0, 30),
                          CustomTextFormField(
                            radius: 5,
                            labelText: "Street Address",
                            controller: txtStreetAddress,
                            focusNode: focusStreetAddress,
                            onFieldSubmitted: (value) {
                              AddAddressWidget().fieldFocusChange(
                                  context, focusStreetAddress, focusTxtCountry);
                            },
                          ),
                          const Space(0, 30),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(42),
                            child: FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      labelText: "State",
                                      labelStyle: TextStyle(
                                          color: appCtrl.appTheme.contentColor,
                                          fontSize:
                                              AppScreenUtil().fontSize(16),
                                          letterSpacing: .4),
                                      contentPadding: EdgeInsets.only(
                                        left: AppScreenUtil().screenHeight(18),
                                        right: AppScreenUtil().size(11),
                                      ),
                                      hintText:
                                          DeliveryDetailFont().selectState,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppScreenUtil().borderRadius(5)),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                appCtrl.appTheme.borderColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppScreenUtil().borderRadius(5)),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                appCtrl.appTheme.borderColor),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppScreenUtil().borderRadius(5)),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                appCtrl.appTheme.borderColor),
                                      )),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<gslm.Data>(
                                      value: stateSelectedValue,
                                      isDense: true,
                                      isExpanded: true,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: appCtrl.appTheme.borderColor,
                                      ),
                                      onChanged: (gslm.Data? newValue) {
                                        stateSelectedValue = newValue!;
                                        getCityList(
                                            stateSelectedValue!.id.toString());
                                        setState(() {});
                                      },
                                      items: stateList.map((gslm.Data value) {
                                        return DropdownMenuItem<gslm.Data>(
                                          value: value,
                                          child: Text(
                                            (value.locationName).toString(),
                                            style: TextStyle(
                                                fontFamily: GoogleFonts.lato()
                                                    .fontFamily),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Space(0, 30),
                          SizedBox(
                            height: AppScreenUtil().screenHeight(42),
                            child: FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                      labelText: "Town/City",
                                      labelStyle: TextStyle(
                                          color: appCtrl.appTheme.contentColor,
                                          fontSize:
                                              AppScreenUtil().fontSize(16),
                                          letterSpacing: .4),
                                      contentPadding: EdgeInsets.only(
                                        left: AppScreenUtil().screenHeight(18),
                                        right: AppScreenUtil().size(11),
                                      ),
                                      hintText:
                                          DeliveryDetailFont().selectState,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppScreenUtil().borderRadius(5)),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                appCtrl.appTheme.borderColor),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppScreenUtil().borderRadius(5)),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                appCtrl.appTheme.borderColor),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppScreenUtil().borderRadius(5)),
                                        borderSide: BorderSide(
                                            style: BorderStyle.solid,
                                            color:
                                                appCtrl.appTheme.borderColor),
                                      )),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<gclm.Data>(
                                      value: citySelectedValue,
                                      isDense: true,
                                      isExpanded: true,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: appCtrl.appTheme.borderColor,
                                      ),
                                      onChanged: (gclm.Data? newValue) {
                                        citySelectedValue = newValue!;
                                        setState(() {});
                                      },
                                      items: cityList.map((gclm.Data value) {
                                        return DropdownMenuItem<gclm.Data>(
                                          value: value,
                                          child: Text(
                                            (value.locationName).toString(),
                                            style: TextStyle(
                                                fontFamily: GoogleFonts.lato()
                                                    .fontFamily),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const Space(0, 30),
                          CustomTextFormField(
                            radius: 5,
                            labelText: "Country",
                            controller: txtCountry,
                            enabled: false,
                            focusNode: focusTxtCountry,
                            keyboardType: TextInputType.name,
                            onFieldSubmitted: (value) {
                              AddAddressWidget().fieldFocusChange(context,
                                  focusTxtCountry, focusTxtMobileNumber);
                            },
                          ),
                          Column(
                            children: [
                              const Space(0, 30),
                              CustomTextFormField(
                                radius: 5,
                                labelText: AddAddressFont().mobileNumber,
                                controller: txtMobileNumber,
                                focusNode: focusTxtMobileNumber,
                                maxLength: 10,
                                keyboardType: TextInputType.number,
                                onFieldSubmitted: (value) {
                                  AddAddressWidget().fieldFocusChange(context,
                                      focusTxtMobileNumber, focusTxtEmail);
                                },
                              ),
                              const Space(0, 30),
                              CustomTextFormField(
                                radius: 5,
                                labelText: "Email",
                                controller: txtEmail,
                                focusNode: focusTxtEmail,
                                keyboardType: TextInputType.name,
                                onFieldSubmitted: (value) {
                                  AddAddressWidget().fieldFocusChange(
                                      context, focusTxtEmail, focusTxtPinCode);
                                },
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Space(0, 30),
                              CustomTextFormField(
                                radius: 5,
                                labelText: "Pincode",
                                controller: txtPinCode,
                                focusNode: focusTxtPinCode,
                                keyboardType: TextInputType.number,
                                maxLength: 6,
                                onFieldSubmitted: (value) {
                                  AddAddressWidget().fieldFocusChange(context,
                                      focusTxtPinCode, focusTxtPinCode);
                                },
                              ),
                            ],
                          ),
                          const Space(0, 30),
                        ],
                      ).marginSymmetric(
                        vertical: AppScreenUtil().screenHeight(20),
                        horizontal: AppScreenUtil().screenWidth(15),
                      ),
                      // address list layout
                      // AddressTypeLayout()
                    ],
                  ).marginOnly(bottom: AppScreenUtil().screenHeight(50)),
                ),
                //reset and add address layout
                BottomLayout(
                  firstButtonText: DeliveryDetailFont().reset,
                  secondButtonText: widget.isEdit
                      ? "Update Address".tr
                      : DeliveryDetailFont().addAddress,
                  firstTap: () {
                    Navigator.pop(context, false);
                  },
                  secondTap: () async {
                    if (txtFirstName.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: "Please Enter First Name");
                      return;
                    }
                    if (txtLastName.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: "Please Enter Last Name");
                      return;
                    }
                    if (txtStreetAddress.text.trim().isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Please Enter Street Address");
                      return;
                    }
                    if (txtCountry.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: "Please Enter Country");
                      return;
                    }
                    if (txtMobileNumber.text.trim().isEmpty ||
                        txtMobileNumber.text.length < 10) {
                      Fluttertoast.showToast(msg: "Please Enter Mobile Number");
                      return;
                    }
                    if (txtPinCode.text.trim().isEmpty ||
                        txtPinCode.text.length < 6) {
                      Fluttertoast.showToast(msg: "Please Enter Pincode");
                      return;
                    }
                    if (txtEmail.text.trim().isEmpty) {
                      Fluttertoast.showToast(msg: "Please Enter Email");
                      return;
                    }

                    validatePincode(txtPinCode.text.trim());
                  },
                )
              ],
            ),
    );
  }

  Future<bool?> saveDetails(HashMap<String, dynamic> params) async {
    try {
      dynamic response =
          await apiCall.postRequest(ApiMethodList.userAddress, params);
      return UpdateProfileModel.fromJson(response).isSuccess ?? false;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updateDetails(
      String id, HashMap<String, dynamic> params) async {
    try {
      dynamic response = await apiCall.patchRequest(
          "${ApiMethodList.userAddress}$id/", params);
      return UpdateProfileModel.fromJson(response).isSuccess ?? false;
    } catch (e) {
      rethrow;
    }
  }

  getStateList() async {
    try {
      showProgressDialog(true);
      stateList.clear();
      dynamic response = await apiCall.getResponse(ApiMethodList.statesList);
      stateList.addAll(gslm.GetStateListModel.fromJson(response).data ?? []);
      if (widget.addressData != null &&
          widget.addressData!.state != null &&
          widget.addressData!.state != "") {
        stateList.forEach((_element) {
          if (_element.locationName == widget.addressData!.state) {
            stateSelectedValue = _element;
          }
        });

        if (stateSelectedValue != null) {
          stateSelectedValue = stateList.first;
        }
      } else {
        stateSelectedValue = stateList.first;
      }

      if (UserSingleton().parentId != null) {
        stateList.forEach((_element) {
          if (_element.id.toString() == UserSingleton().parentId) {
            stateSelectedValue = _element;
          }
        });
      }

      await getCityList(stateSelectedValue!.id.toString());
      showProgressDialog(false);
    } catch (e) {
      rethrow;
    }
  }

  getCityList(String stateId) async {
    try {
      showProgressDialog(true);
      cityList.clear();
      dynamic response =
          await apiCall.getResponse(ApiMethodList.cityList + stateId);
      cityList.addAll(gclm.GetCityListModel.fromJson(response).data ?? []);
      if (widget.addressData != null &&
          widget.addressData!.city != null &&
          widget.addressData!.city != "") {
        cityList.forEach((_element) {
          if (_element.locationName == widget.addressData!.city) {
            citySelectedValue = _element;
          }
        });
      } else {
        citySelectedValue = cityList.first;
      }

      if (UserSingleton().selectedLocation != null) {
        cityList.forEach((_element) {
          if (_element.locationName == UserSingleton().selectedLocation) {
            citySelectedValue = _element;
          }
        });
      }
      isLoading = false;
      setState(() {});
      showProgressDialog(false);
    } catch (e) {
      rethrow;
    }
  }

  validatePincode(String pincode) async {
    try {
      dynamic response = await apiCall.getResponseWithNoToken(
          "${ApiMethodList.validatePincode}$pincode&location=${citySelectedValue!.locationName}");
      var data = ValidateAddressModel.fromJson(response);
      if (data.data != null && (data.data!.isValid ?? false)) {
        HashMap<String, dynamic> params = HashMap();
        params['first_name'] = txtFirstName.text.trim();
        params['last_name'] = txtLastName.text.trim();
        params['company_name'] = txtCompanyName.text.trim();
        params['address_1'] = txtStreetAddress.text.trim();
        params['city'] = citySelectedValue!.locationName;
        params['state'] = stateSelectedValue!.locationName;
        params['country'] = txtCountry.text.trim();
        params['phone_number'] = txtMobileNumber.text.trim();
        params['email'] = txtEmail.text.trim();
        params['pincode'] = txtPinCode.text.trim();
        params['is_default'] = "true";
        showProgressDialog(true);
        bool status = false;
        if (widget.isEdit) {
          status =
              await updateDetails(widget.addressData!.id!.toString(), params) ??
                  false;
        } else {
          status = await saveDetails(params) ?? false;
        }
        if (status) {
          showProgressDialog(false);
          Get.back(result: true);
          Fluttertoast.showToast(
              msg:
                  "Address ${widget.isEdit ? "Updated" : "Saved"} Successfully");
        } else {
          showProgressDialog(false);
          Fluttertoast.showToast(
              msg: "Unable To ${widget.isEdit ? "Update" : "Save"} Address");
        }
      } else {
        Fluttertoast.showToast(msg: "Please enter a valid pincode");
        return;
      }
    } catch (e) {
      rethrow;
    }
  }
}
