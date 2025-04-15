import 'dart:collection';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/controllers/pages_controller/build_your_home_controller.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BuildYourHome extends StatefulWidget {
  const BuildYourHome({super.key});

  @override
  State<BuildYourHome> createState() => _BuildYourHomeState();
}

class _BuildYourHomeState extends State<BuildYourHome> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtMobileNumber = TextEditingController();
  TextEditingController txtDetails = TextEditingController();
  TextEditingController txtAreaLength = TextEditingController();
  TextEditingController txtAreaWidth = TextEditingController();
  TextEditingController txtLivingRoomLength = TextEditingController();
  TextEditingController txtLivingRoomWidth = TextEditingController();
  TextEditingController txtBedroomLength = TextEditingController();
  TextEditingController txtBedroomWidth = TextEditingController();
  TextEditingController txtParkingLength = TextEditingController();
  TextEditingController txtParkingWidth = TextEditingController();
  TextEditingController txtKitchenLength = TextEditingController();
  TextEditingController txtKitchenWidth = TextEditingController();
  TextEditingController txtToiletBathroomLength = TextEditingController();
  TextEditingController txtToiletBathroomWidth = TextEditingController();

  //focus node
  FocusNode focusTxtName = FocusNode();
  FocusNode focusTxtMobileNumber = FocusNode();
  FocusNode focusTxtDetails = FocusNode();
  FocusNode focusAreaLength = FocusNode();
  FocusNode focusAreaWidth = FocusNode();
  FocusNode focusLivingRoomLength = FocusNode();
  FocusNode focusLivingRoomWidth = FocusNode();
  FocusNode focusBedroomLength = FocusNode();
  FocusNode focusBedroomWidth = FocusNode();
  FocusNode focusParkingLength = FocusNode();
  FocusNode focusParkingWidth = FocusNode();
  FocusNode focusKitchenLength = FocusNode();
  FocusNode focusKitchenWidth = FocusNode();
  FocusNode focusToiletBathroomLength = FocusNode();
  FocusNode focusToiletBathroomWidth = FocusNode();

  bool twoDPlan = false;
  bool threeDPlan = false;

  @override
  Widget build(BuildContext context) {
    final buildCtrl = Get.put(BuildYourHomeController());
    return GetBuilder<BuildYourHomeController>(builder: (buildCtrl) {
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
                  text: "Build Your Home",
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
                                    focusTxtMobileNumber, focusTxtDetails);
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
                                          fontSize:
                                              AppScreenUtil().fontSize(16),
                                          letterSpacing: .4,
                                        ),
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal:
                                                AppScreenUtil().screenWidth(20),
                                            vertical: AppScreenUtil()
                                                .screenHeight(20)),
                                        hintText: "",
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
                                      child: DropdownButton<String>(
                                        value: buildCtrl.stateSelectedValue,
                                        isDense: true,
                                        isExpanded: true,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down,
                                          color: appCtrl.appTheme.borderColor,
                                        ),
                                        onChanged: (String? newValue) {
                                          buildCtrl.stateSelectedValue =
                                              newValue!;
                                          if (newValue == '2D Plan Layout') {
                                            twoDPlan = true;
                                            threeDPlan = false;
                                          } else if (newValue == '3D Views') {
                                            threeDPlan = true;
                                            twoDPlan = false;
                                          } else {
                                            twoDPlan = false;
                                            threeDPlan = false;
                                          }
                                          setState(() {});
                                        },
                                        items: buildCtrl.requirements
                                            .map((String value) {
                                          return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: GoogleFonts.lato()
                                                      .fontFamily,
                                                ),
                                              ));
                                        }).toList(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Visibility(
                              visible: twoDPlan,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Space(0, 20),
                                  AboutUsWidget().commonText("  Area:",
                                      FontWeight.w600, FontSizes.f14),
                                  const Space(0, 20),
                                  CustomTextFormField(
                                    radius: 5,
                                    labelText: "Length",
                                    controller: txtAreaLength,
                                    focusNode: focusAreaLength,
                                    keyboardType: TextInputType.phone,
                                    hintText: 'Enter Length (feet)',
                                    hintStyle: const TextStyle(fontSize: 15),
                                    onFieldSubmitted: (value) {
                                      AddAddressWidget().fieldFocusChange(
                                          context,
                                          focusAreaLength,
                                          focusAreaWidth);
                                    },
                                  ),
                                  const Space(0, 20),
                                  CustomTextFormField(
                                    radius: 5,
                                    labelText: "Width",
                                    controller: txtAreaWidth,
                                    focusNode: focusAreaWidth,
                                    keyboardType: TextInputType.phone,
                                    hintText: 'Enter Width (feet)',
                                    hintStyle: const TextStyle(fontSize: 15),
                                    onFieldSubmitted: (value) {
                                      AddAddressWidget().fieldFocusChange(
                                          context,
                                          focusAreaWidth,
                                          focusAreaWidth);
                                    },
                                  ),
                                  const Space(0, 20),
                                  AboutUsWidget().commonText("  Select Any:",
                                      FontWeight.w600, FontSizes.f14),
                                  const Space(0, 15),
                                  ListView.builder(
                                    physics: const ScrollPhysics(),
                                    itemCount: buildCtrl.areaName.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return checkboxItem(
                                        buildCtrl.areaName[index],
                                        Checkbox(
                                          value: buildCtrl
                                              .areaNameSelection[index],
                                          onChanged: (value) {
                                            buildCtrl.areaNameSelection[index] =
                                                !buildCtrl
                                                    .areaNameSelection[index];
                                            setState(() {});
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: threeDPlan,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Space(0, 20),
                                  AboutUsWidget().commonText("  Living Room:",
                                      FontWeight.w600, FontSizes.f14),
                                  const Space(0, 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Length",
                                          controller: txtLivingRoomLength,
                                          focusNode: focusLivingRoomLength,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Length (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusLivingRoomLength,
                                                focusLivingRoomWidth);
                                          },
                                        ),
                                      ),
                                      const Space(20, 0),
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Width",
                                          controller: txtLivingRoomWidth,
                                          focusNode: focusLivingRoomWidth,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Width (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusLivingRoomWidth,
                                                focusBedroomLength);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Space(0, 20),
                                  AboutUsWidget().commonText("  Bedroom:",
                                      FontWeight.w600, FontSizes.f14),
                                  const Space(0, 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Length",
                                          controller: txtBedroomLength,
                                          focusNode: focusBedroomLength,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Length (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusBedroomLength,
                                                focusBedroomWidth);
                                          },
                                        ),
                                      ),
                                      const Space(20, 0),
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Width",
                                          controller: txtBedroomWidth,
                                          focusNode: focusBedroomWidth,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Width (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusBedroomWidth,
                                                focusParkingLength);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Space(0, 20),
                                  AboutUsWidget().commonText("  Parking:",
                                      FontWeight.w600, FontSizes.f14),
                                  const Space(0, 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Length",
                                          controller: txtParkingLength,
                                          focusNode: focusParkingLength,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Length (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusParkingLength,
                                                focusParkingWidth);
                                          },
                                        ),
                                      ),
                                      const Space(20, 0),
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Width",
                                          controller: txtParkingWidth,
                                          focusNode: focusParkingWidth,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Width (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusParkingWidth,
                                                focusKitchenLength);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Space(0, 20),
                                  AboutUsWidget().commonText("  Kitchen:",
                                      FontWeight.w600, FontSizes.f14),
                                  const Space(0, 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Length",
                                          controller: txtKitchenLength,
                                          focusNode: focusKitchenLength,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Length (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusKitchenLength,
                                                focusKitchenWidth);
                                          },
                                        ),
                                      ),
                                      const Space(20, 0),
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Width",
                                          controller: txtKitchenWidth,
                                          focusNode: focusKitchenWidth,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Width (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusKitchenWidth,
                                                focusToiletBathroomLength);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Space(0, 20),
                                  AboutUsWidget().commonText(
                                      "  Toilet Bathroom:",
                                      FontWeight.w600,
                                      FontSizes.f14),
                                  const Space(0, 20),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Length",
                                          controller: txtToiletBathroomLength,
                                          focusNode: focusToiletBathroomLength,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Length (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusToiletBathroomLength,
                                                focusToiletBathroomWidth);
                                          },
                                        ),
                                      ),
                                      const Space(20, 0),
                                      Expanded(
                                        child: CustomTextFormField(
                                          radius: 5,
                                          labelText: "Width",
                                          controller: txtToiletBathroomWidth,
                                          focusNode: focusToiletBathroomWidth,
                                          keyboardType: TextInputType.phone,
                                          hintText: 'Enter Width (feet)',
                                          hintStyle:
                                              const TextStyle(fontSize: 15),
                                          onFieldSubmitted: (value) {
                                            AddAddressWidget().fieldFocusChange(
                                                context,
                                                focusToiletBathroomWidth,
                                                focusToiletBathroomWidth);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Space(0, 30),
                            CustomTextFormField(
                              radius: 5,
                              labelText: "Details (optional)",
                              controller: txtDetails,
                              focusNode: focusTxtDetails,
                              keyboardType: TextInputType.text,
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
                                      String requiredFor = "";

                                      for (int i = 0;
                                          i < buildCtrl.areaName.length;
                                          i++) {
                                        if (buildCtrl.areaNameSelection[i]) {
                                          requiredFor =
                                              "$requiredFor${buildCtrl.areaName[i]},";
                                        }
                                      }

                                      if (txtName.text.isEmpty) {
                                        Fluttertoast.showToast(
                                            msg: "Please Enter Name");
                                      } else if (txtMobileNumber.text.isEmpty ||
                                          txtMobileNumber.text.length != 10) {
                                        Fluttertoast.showToast(
                                            msg: "Please Enter Mobile Number");
                                      }
                                      // else if (buildCtrl.stateSelectedValue == " -Select Option- ") {
                                      //   Fluttertoast.showToast(msg: "Please Select Requirement Type");
                                      // } else if (twoDPlan) {
                                      //   if (txtAreaLength.text.isEmpty) {
                                      //     Fluttertoast.showToast(msg: "Please Enter Area Length");
                                      //   } else if (txtAreaWidth.text.isEmpty) {
                                      //     Fluttertoast.showToast(msg: "Please Enter Area Width");
                                      //   }
                                      // }
                                      else {
                                        showProgressDialog(true);
                                        HashMap<String, String> params =
                                            HashMap();
                                        params['name'] = txtName.text.trim();
                                        params['phone_number'] =
                                            txtMobileNumber.text.trim();
                                        params['requirement'] =
                                            buildCtrl.stateSelectedValue ?? "";
                                        params['details'] =
                                            txtDetails.text.trim();
                                        params['from_page'] = "DREAM_YOUR_HOME";
                                        if (twoDPlan) {
                                          params['area_size'] =
                                              "${txtAreaLength.text.toString()}*${txtAreaWidth.text.toString()}";
                                          params['required_for'] = requiredFor;
                                        }
                                        if (threeDPlan) {
                                          params['living_room'] =
                                              "${txtLivingRoomLength.text.toString()}*${txtLivingRoomWidth.text.toString()}";
                                          params['bedroom'] =
                                              "${txtBedroomLength.text.toString()}*${txtBedroomWidth.text.toString()}";
                                          params['parking'] =
                                              "${txtParkingLength.text.toString()}*${txtParkingWidth.text.toString()}";
                                          params['kitchen'] =
                                              "${txtKitchenLength.text.toString()}*${txtKitchenWidth.text.toString()}";
                                          params['toilet_bathroom'] =
                                              "${txtToiletBathroomLength.text.toString()}*${txtToiletBathroomWidth.text.toString()}";
                                        }
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
                                      "You must login to submit this form",
                                      FontWeight.w400),
                                ],
                              ),
                            ),
                          ],
                        ).marginSymmetric(
                          vertical: AppScreenUtil().screenHeight(20),
                          horizontal: AppScreenUtil().screenWidth(15),
                        ),
                      ],
                    ).marginOnly(bottom: AppScreenUtil().screenHeight(50)),
                  ),
          ),
        );
      });
    });
  }

  Widget checkboxItem(String title, Widget checkbox) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
      child: Row(
        children: [
          SizedBox(height: 24, width: 24, child: checkbox),
          const SizedBox(width: 5),
          Text(title),
        ],
      ),
    );
  }
}
