import 'dart:collection';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/controllers/pages_controller/build_your_home_controller.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:dapperz/views/bottom_navigate_page/home/form_city_selection_dialog.dart';
import 'package:dapperz/views/category_selection_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GetQuote extends StatefulWidget {
  const GetQuote({super.key});

  @override
  State<GetQuote> createState() => _GetQuoteState();
}

class _GetQuoteState extends State<GetQuote> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAreaName = TextEditingController();
  TextEditingController txtCity = TextEditingController();
  TextEditingController txtMobileNumber = TextEditingController();
  TextEditingController txtDetails = TextEditingController();
  TextEditingController txtCategory = TextEditingController();

  //focus node
  FocusNode focusTxtName = FocusNode();
  FocusNode focusTxtAreaName = FocusNode();
  FocusNode focusTxtCity = FocusNode();
  FocusNode focusTxtMobileNumber = FocusNode();
  FocusNode focusTxtDetails = FocusNode();

  @override
  void initState() {
    super.initState();
    txtCategory.text = "Select";
    txtCity.text = UserSingleton().selectedLocation ?? "";
  }

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
                  text: "Get Quote",
                  fontSize: FontSizes.f16,
                  fontWeight: FontWeight.w700),
            ),
            body: buildCtrl.isLoading
                ? const Center(child: CircularProgressIndicator(strokeWidth: 3))
                : SingleChildScrollView(
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
                                AddAddressWidget().fieldFocusChange(context,
                                    focusTxtName, focusTxtMobileNumber);
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
                                AddAddressWidget().fieldFocusChange(context,
                                    focusTxtMobileNumber, focusTxtAreaName);
                              },
                            ),
                            const Space(0, 30),
                            // Last Name
                            CustomTextFormField(
                              radius: 5,
                              labelText: "Area",
                              controller: txtAreaName,
                              focusNode: focusTxtAreaName,
                              keyboardType: TextInputType.name,
                              hint: "Enter Your Area Here..",
                              enabled: true,
                              onFieldSubmitted: (value) {
                                AddAddressWidget().fieldFocusChange(
                                    context, focusTxtAreaName, focusTxtCity);
                              },
                            ),
                            // Last Name
                            const Space(0, 30),
                            GestureDetector(
                              onTap: () async {
                                var data = await Get.dialog(
                                    FormCitySelectionDialog(
                                        cities: buildCtrl.locationList));
                                if (data != null) {
                                  txtCity.text = data;
                                }
                              },
                              child: CustomTextFormField(
                                radius: 5,
                                labelText: "City",
                                controller: txtCity,
                                focusNode: focusTxtCity,
                                keyboardType: TextInputType.name,
                                hint: "Enter Your City Here..",
                                enabled: false,
                                onFieldSubmitted: (value) {
                                  AddAddressWidget().fieldFocusChange(
                                      context, focusTxtCity, focusTxtDetails);
                                },
                              ),
                            ),
                            const Space(0, 30),
                            // SizedBox(
                            //   child: FormField<String>(
                            //     builder: (FormFieldState<String> state) {
                            //       return InputDecorator(
                            //         decoration: InputDecoration(
                            //             labelText: "City",
                            //             labelStyle: TextStyle(
                            //               color: appCtrl.appTheme.contentColor,
                            //               fontSize: AppScreenUtil().fontSize(16),
                            //               letterSpacing: .4,
                            //             ),
                            //             contentPadding: EdgeInsets.symmetric(
                            //                 horizontal: AppScreenUtil().screenWidth(20), vertical: AppScreenUtil().screenHeight(20)),
                            //             hintText: "",
                            //             focusedBorder: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                            //               borderSide: BorderSide(style: BorderStyle.solid, color: appCtrl.appTheme.borderColor),
                            //             ),
                            //             enabledBorder: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                            //               borderSide: BorderSide(style: BorderStyle.solid, color: appCtrl.appTheme.borderColor),
                            //             ),
                            //             border: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                            //               borderSide: BorderSide(style: BorderStyle.solid, color: appCtrl.appTheme.borderColor),
                            //             )),
                            //         child: DropdownButtonHideUnderline(
                            //           child: DropdownButton<gllm.Children>(
                            //             value: buildCtrl.selectedCity,
                            //             isDense: true,
                            //             isExpanded: true,
                            //             icon: Icon(
                            //               Icons.keyboard_arrow_down,
                            //               color: appCtrl.appTheme.borderColor,
                            //             ),
                            //             onChanged: (gllm.Children? newValue) {
                            //               buildCtrl.selectedCity = newValue!;
                            //               setState(() {});
                            //             },
                            //             items: buildCtrl.locationList.map((gllm.Children value) {
                            //               return DropdownMenuItem<gllm.Children>(
                            //                   value: value,
                            //                   child: Text(
                            //                     value.locationName ?? "",
                            //                     style: TextStyle(
                            //                       fontSize: 14,
                            //                       fontFamily: GoogleFonts.lato().fontFamily,
                            //                     ),
                            //                   ));
                            //             }).toList(),
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
                            // const Space(0, 30),
                            GestureDetector(
                              onTap: () async {
                                var data = await Get.dialog(
                                    CategorySelectionDialog(
                                        category: buildCtrl.homeCategoryList));
                                if (data != null) {
                                  buildCtrl.quoteCategorySelectedValue = data;
                                  txtCategory.text = buildCtrl
                                          .quoteCategorySelectedValue!
                                          .categoryName ??
                                      "";
                                  buildCtrl.update();
                                }
                              },
                              child: CustomTextFormField(
                                radius: 5,
                                labelText: "Categories",
                                controller: txtCategory,
                                keyboardType: TextInputType.name,
                                hint: "",
                                enabled: false,
                              ),
                            ),
                            // SizedBox(
                            //   child: FormField<String>(
                            //     builder: (FormFieldState<String> state) {
                            //       return InputDecorator(
                            //         decoration: InputDecoration(
                            //             labelText: "Categories",
                            //             labelStyle: TextStyle(
                            //               color: appCtrl.appTheme.contentColor,
                            //               fontSize: AppScreenUtil().fontSize(16),
                            //               letterSpacing: .4,
                            //             ),
                            //             contentPadding: EdgeInsets.symmetric(
                            //                 horizontal: AppScreenUtil().screenWidth(20), vertical: AppScreenUtil().screenHeight(20)),
                            //             hintText: "",
                            //             focusedBorder: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                            //               borderSide: BorderSide(style: BorderStyle.solid, color: appCtrl.appTheme.borderColor),
                            //             ),
                            //             enabledBorder: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                            //               borderSide: BorderSide(style: BorderStyle.solid, color: appCtrl.appTheme.borderColor),
                            //             ),
                            //             border: OutlineInputBorder(
                            //               borderRadius: BorderRadius.circular(AppScreenUtil().borderRadius(5)),
                            //               borderSide: BorderSide(style: BorderStyle.solid, color: appCtrl.appTheme.borderColor),
                            //             )),
                            //         child: DropdownButtonHideUnderline(
                            //           child: DropdownButton<pcm.Data>(
                            //             value: buildCtrl.quoteCategorySelectedValue,
                            //             isDense: true,
                            //             isExpanded: true,
                            //             icon: Icon(
                            //               Icons.keyboard_arrow_down,
                            //               color: appCtrl.appTheme.borderColor,
                            //             ),
                            //             onChanged: (pcm.Data? newValue) {
                            //               buildCtrl.quoteCategorySelectedValue = newValue!;
                            //               setState(() {});
                            //             },
                            //             items: buildCtrl.homeCategoryList.map((pcm.Data value) {
                            //               return DropdownMenuItem<pcm.Data>(
                            //                   value: value,
                            //                   child: Text(
                            //                     value.categoryName ?? "",
                            //                     style: TextStyle(
                            //                       fontSize: 14,
                            //                       fontFamily: GoogleFonts.lato().fontFamily,
                            //                     ),
                            //                   ));
                            //             }).toList(),
                            //           ),
                            //         ),
                            //       );
                            //     },
                            //   ),
                            // ),
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
                            SizedBox(
                              height: 70,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                          child:
                                              Text("Your Dream Idea Picture:")),
                                      CustomButton(
                                        height: 40,
                                        title: "Choose File",
                                        onTap: () async {
                                          await buildCtrl.getImage();
                                        },
                                      ),
                                    ],
                                  ),
                                  Visibility(
                                    visible: buildCtrl.uploadedImage.isNotEmpty,
                                    child: const Text('Image Selected',
                                        style: TextStyle(color: Colors.green)),
                                  ),
                                ],
                              ),
                            ),
                            const Space(0, 30),
                            CustomButton(
                              title: "SUBMIT",
                              onTap: UserSingleton().isGuest ?? false
                                  ? null
                                  : () async {
                                      if (txtName.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Please Enter Name");
                                      } else if (txtMobileNumber.text.isEmpty ||
                                          txtMobileNumber.text.length != 10) {
                                        Fluttertoast.showToast(
                                            msg:
                                                "Please Enter Valid Mobile Number");
                                      } else if (txtAreaName.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Please Enter Name");
                                      } else if (txtCategory.text == "Select") {
                                        Fluttertoast.showToast(
                                            msg: "Please Select Category");
                                      } else {
                                        showProgressDialog(true);
                                        HashMap<String, String> params =
                                            HashMap();
                                        params['name'] = txtName.text.trim();
                                        params['phone_number'] =
                                            txtMobileNumber.text.trim();
                                        params['details'] =
                                            txtDetails.text.trim();
                                        params['from_page'] = "GET_QUOTE";
                                        params['city'] = buildCtrl
                                            .selectedCity!.id
                                            .toString();
                                        params['area'] =
                                            txtAreaName.text.trim();
                                        params['category_id'] = buildCtrl
                                            .quoteCategorySelectedValue!.id
                                            .toString();
                                        bool status =
                                            await buildCtrl.buildYourHomeSubmit(
                                                params,
                                                buildCtrl.uploadedImage);
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
                            const Space(0, 30),
                            Visibility(
                              visible: UserSingleton().isGuest ?? false,
                              child: Column(
                                children: [
                                  TermsConditionWidget().commonText(
                                      "You Must Login To Get Quote.",
                                      FontWeight.w400),
                                ],
                              ),
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
