import 'dart:collection';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GetACall extends StatefulWidget {
  const GetACall({super.key});

  @override
  State<GetACall> createState() => _GetACallState();
}

class _GetACallState extends State<GetACall> {
  final productCtrl = Get.put(ProductDetailController());

  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobileNumber = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtRequirement = TextEditingController();
  TextEditingController txtDescription = TextEditingController();

  //focus node
  FocusNode focusTxtName = FocusNode();
  FocusNode focusTxtMobileNumber = FocusNode();
  FocusNode focusTxtEmail = FocusNode();
  FocusNode focusTxtRequirement = FocusNode();
  FocusNode focusTxtDescription = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:
          productCtrl.appCtrl.isRTL || productCtrl.appCtrl.languageVal == "ar"
              ? TextDirection.rtl
              : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: productCtrl.appCtrl.appTheme.whiteColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: productCtrl.appCtrl.appTheme.whiteColor,
          automaticallyImplyLeading: false,
          leading: Icon(CupertinoIcons.arrow_left,
                  size: AppScreenUtil().size(25),
                  color: productCtrl.appCtrl.appTheme.blackColor)
              .gestures(
            onTap: () {
              Get.back();
            },
          ),
          title: const LatoFontStyle(
              text: "Get A Call",
              fontSize: FontSizes.f16,
              fontWeight: FontWeight.w700),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //form text box
              Column(
                children: [
                  CustomTextFormField(
                    radius: 5,
                    labelText: "Name",
                    controller: txtName,
                    focusNode: focusTxtName,
                    keyboardType: TextInputType.name,
                    hint: "Enter Your Name Here..",
                    enabled: true,
                    onFieldSubmitted: (value) {
                      AddAddressWidget().fieldFocusChange(
                          context, focusTxtName, focusTxtMobileNumber);
                    },
                  ),
                  // Last Name
                  const Space(0, 30),
                  CustomTextFormField(
                    radius: 5,
                    labelText: "Phone",
                    controller: txtMobileNumber,
                    focusNode: focusTxtMobileNumber,
                    keyboardType: TextInputType.phone,
                    maxLength: 10,
                    onFieldSubmitted: (value) {
                      AddAddressWidget().fieldFocusChange(
                          context, focusTxtMobileNumber, focusTxtEmail);
                    },
                  ),
                  // Last Name
                  const Space(0, 30),
                  CustomTextFormField(
                    radius: 5,
                    labelText: "Email-Id",
                    controller: txtEmail,
                    focusNode: focusTxtEmail,
                    keyboardType: TextInputType.emailAddress,
                    onFieldSubmitted: (value) {
                      AddAddressWidget().fieldFocusChange(
                          context, focusTxtEmail, focusTxtRequirement);
                    },
                  ),
                  // Company Name
                  const Space(0, 30),
                  CustomTextFormField(
                    radius: 5,
                    labelText: "Requirement",
                    controller: txtRequirement,
                    focusNode: focusTxtRequirement,
                    keyboardType: TextInputType.name,
                    onFieldSubmitted: (value) {
                      AddAddressWidget().fieldFocusChange(
                          context, focusTxtRequirement, focusTxtDescription);
                    },
                  ),
                  // Street Address
                  const Space(0, 30),
                  CustomTextFormField(
                    radius: 5,
                    labelText: "Description",
                    controller: txtDescription,
                    focusNode: focusTxtDescription,
                    maxLines: 7,
                    minLines: 7,
                    onFieldSubmitted: (value) {
                      AddAddressWidget().fieldFocusChange(
                          context, focusTxtDescription, focusTxtDescription);
                    },
                  ),
                  const Space(0, 30),
                  CustomButton(
                    title: "SUBMIT",
                    onTap: () async {
                      if (txtName.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please Enter Name");
                      } else if (txtMobileNumber.text.isEmpty ||
                          txtMobileNumber.text.trim().length < 10) {
                        Fluttertoast.showToast(
                            msg: "Please Enter Mobile Number");
                      } else if (txtEmail.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please Enter E-mail");
                      } else if (txtRequirement.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please Enter Requirement");
                      } else if (txtDescription.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please Enter Description");
                      } else {
                        showProgressDialog(true);
                        HashMap<String, String> params = HashMap();
                        params['name'] = txtName.text.trim();
                        params['phone_number'] = txtMobileNumber.text.trim();
                        params['email'] = txtEmail.text.trim();
                        params['requirement'] = txtRequirement.text.trim();
                        params['details'] = txtDescription.text.trim();
                        params['from_page'] = "GET_A_CALL";
                        bool status = await productCtrl.getACallSubmit(params);
                        showProgressDialog(false);
                        if (status) {
                          Fluttertoast.showToast(msg: "Submitted Successfully");
                          Get.back();
                        } else {
                          Fluttertoast.showToast(
                              msg: "Unable to Submit Request");
                        }
                      }
                    },
                  ),
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
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<ProductDetailController>();
    super.dispose();
  }
}
