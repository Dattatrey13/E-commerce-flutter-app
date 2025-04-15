import 'dart:collection';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/controllers/pages_controller/build_your_home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobileNumber = TextEditingController();
  TextEditingController txtEmailName = TextEditingController();
  TextEditingController txtDetails = TextEditingController();

  //focus node
  FocusNode focusTxtName = FocusNode();
  FocusNode focusTxtMobileNumber = FocusNode();
  FocusNode focusTxtEmail = FocusNode();
  FocusNode focusTxtDetails = FocusNode();

  @override
  Widget build(BuildContext context) {
    final buildCtrl = Get.put(BuildYourHomeController());
    return GetBuilder<BuildYourHomeController>(builder: (_) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Directionality(
          textDirection:
              buildCtrl.appCtrl.isRTL || buildCtrl.appCtrl.languageVal == "ar"
                  ? TextDirection.rtl
                  : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: buildCtrl.appCtrl.appTheme.whiteColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: buildCtrl.appCtrl.appTheme.whiteColor,
              automaticallyImplyLeading: false,
              leading: Icon(CupertinoIcons.arrow_left,
                      size: AppScreenUtil().size(25),
                      color: buildCtrl.appCtrl.appTheme.blackColor)
                  .gestures(
                onTap: () {
                  Get.back();
                },
              ),
              title: const LatoFontStyle(
                  text: "Contact Us",
                  fontSize: FontSizes.f16,
                  fontWeight: FontWeight.w700),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TermsConditionWidget()
                          .commonText("Contact Info", FontWeight.w700),
                      const Space(0, 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TermsConditionWidget()
                              .commonText("Phone Number:", FontWeight.w600),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              TermsConditionWidget()
                                  .commonSubTitle("+91 990 990 6954"),
                              TermsConditionWidget()
                                  .commonSubTitle("+91 990 990 6964"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TermsConditionWidget()
                              .commonText("Email Address: ", FontWeight.w600),
                          const SizedBox(width: 10),
                          Column(
                            children: [
                              TermsConditionWidget()
                                  .commonSubTitle("info@dapperz.in"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TermsConditionWidget()
                              .commonText("Office Address: ", FontWeight.w600),
                          const SizedBox(width: 10),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TermsConditionWidget().commonSubTitle(
                                  "dapperz Simada Nehar Junction,"),
                              TermsConditionWidget().commonSubTitle(
                                  "Vesu-Canal road, Surat Gujarat,"),
                              TermsConditionWidget()
                                  .commonSubTitle("India – 395013"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ).marginSymmetric(
                      horizontal: AppScreenUtil().screenWidth(15)),
                  const Divider(thickness: 1, color: Colors.grey)
                      .marginSymmetric(
                          horizontal: AppScreenUtil().screenWidth(15)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TermsConditionWidget()
                          .commonText("Have Question?", FontWeight.w600),
                      const SizedBox(height: 10),
                      TermsConditionWidget().commonText(
                          "Your email address will not be published.",
                          FontWeight.w400),
                      TermsConditionWidget().commonText(
                          "Required fields are marked", FontWeight.w400),
                      const SizedBox(height: 30),
                      CustomTextFormField(
                        radius: 5,
                        labelText: "Name",
                        controller: txtName,
                        focusNode: focusTxtName,
                        keyboardType: TextInputType.name,
                        enabled: true,
                        onFieldSubmitted: (value) {
                          AddAddressWidget().fieldFocusChange(
                              context, focusTxtName, focusTxtMobileNumber);
                        },
                      ),
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
                        labelText: "Your email",
                        controller: txtEmailName,
                        focusNode: focusTxtEmail,
                        keyboardType: TextInputType.name,
                        enabled: true,
                        onFieldSubmitted: (value) {
                          AddAddressWidget().fieldFocusChange(
                              context, focusTxtEmail, focusTxtDetails);
                        },
                      ),
                      // Last Name
                      const Space(0, 30),
                      SizedBox(
                        child: FormField<String>(
                          builder: (FormFieldState<String> state) {
                            return InputDecorator(
                              decoration: InputDecoration(
                                  labelText: "Requirement",
                                  labelStyle: TextStyle(
                                    color: appCtrl.appTheme.contentColor,
                                    fontSize: AppScreenUtil().fontSize(16),
                                    letterSpacing: .4,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal:
                                          AppScreenUtil().screenWidth(20),
                                      vertical:
                                          AppScreenUtil().screenHeight(20)),
                                  hintText: "",
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppScreenUtil().borderRadius(5)),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: appCtrl.appTheme.borderColor),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppScreenUtil().borderRadius(5)),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: appCtrl.appTheme.borderColor),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                        AppScreenUtil().borderRadius(5)),
                                    borderSide: BorderSide(
                                        style: BorderStyle.solid,
                                        color: appCtrl.appTheme.borderColor),
                                  )),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value:
                                      buildCtrl.quoteRequirementsSelectedValue,
                                  isDense: true,
                                  isExpanded: true,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    color: appCtrl.appTheme.borderColor,
                                  ),
                                  onChanged: (String? newValue) {
                                    buildCtrl.quoteRequirementsSelectedValue =
                                        newValue!;
                                    setState(() {});
                                  },
                                  items: buildCtrl.quoteRequirements
                                      .map((String? value) {
                                    return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value!,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily:
                                                GoogleFonts.lato().fontFamily,
                                          ),
                                        ));
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
                        labelText: "Details (optional)",
                        controller: txtDetails,
                        focusNode: focusTxtDetails,
                        keyboardType: TextInputType.emailAddress,
                        maxLines: 7,
                        minLines: 7,
                        onFieldSubmitted: (value) {
                          AddAddressWidget().fieldFocusChange(
                              context, focusTxtDetails, focusTxtDetails);
                        },
                      ),
                      const Space(0, 30),
                      CustomButton(
                        title: "SUBMIT",
                        onTap: () async {
                          if (txtName.text.isEmpty) {
                            Fluttertoast.showToast(msg: "Please Enter Name");
                          } else if (txtMobileNumber.text.isEmpty ||
                              txtMobileNumber.text.length != 10) {
                            Fluttertoast.showToast(
                                msg: "Please Enter Valid Mobile Number");
                          } else if (!isEmail(txtEmailName.text.trim())) {
                            Fluttertoast.showToast(
                                msg: "Please Enter Valid Email");
                          } else {
                            showProgressDialog(true);
                            HashMap<String, String> params = HashMap();
                            params['name'] = txtName.text.trim();
                            params['email'] = txtEmailName.text.trim();
                            params['phone_number'] =
                                txtMobileNumber.text.trim();
                            params['requirements'] =
                                buildCtrl.quoteRequirementsSelectedValue!;
                            params['details'] = txtDetails.text.trim();
                            params['from_page'] = "CONTACT_US";
                            bool status =
                                await buildCtrl.getACallSubmit(params);
                            if (status) {
                              showProgressDialog(false);
                              Fluttertoast.showToast(
                                  msg: "Submitted Successfully");
                              Get.back();
                            } else {
                              showProgressDialog(false);
                              Fluttertoast.showToast(
                                  msg: "Unable to Submit Request");
                            }
                          }
                        },
                      ),
                    ],
                  ).marginSymmetric(
                      vertical: AppScreenUtil().screenHeight(20),
                      horizontal: AppScreenUtil().screenWidth(15)),
                ],
              ).marginOnly(bottom: AppScreenUtil().screenHeight(50)),
            ),
          ),
        );
      });
    });
  }
}
