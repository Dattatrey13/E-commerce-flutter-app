import 'package:dapperz/common_methods.dart';
import 'package:dapperz/views/pages/add_address/add_address.dart';
import 'package:dapperz/widgets/common/address_layout.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../config.dart';

class DeliveryDetail extends StatefulWidget {
  const DeliveryDetail({Key? key}) : super(key: key);

  @override
  State<DeliveryDetail> createState() => _DeliveryDetailState();
}

class _DeliveryDetailState extends State<DeliveryDetail> {
  final deliveryDetailCtrl = Get.put(DeliveryDetailController());

  // int selectBillingRadio = 0;
  // int selectShippingRadio = 0;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeliveryDetailController>(builder: (_) {
      return Directionality(
        textDirection: deliveryDetailCtrl.appCtrl.isRTL ||
                deliveryDetailCtrl.appCtrl.languageVal == "ar"
            ? TextDirection.rtl
            : TextDirection.ltr,
        child: Scaffold(
          appBar: HomeProductAppBar(
            onTap: () => Get.back(),
            titleChild: CommonAppBarTitle(
              title: DeliveryDetailFont().deliveryDetails,
              desc: DeliveryDetailFont().steps2Of3,
            ),
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: appCtrl.isShimmer || deliveryDetailCtrl.isLoading
                    ? const AddressListShimmer()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //address list layout
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LatoFontStyle(
                                text: "Select Shipping Address",
                                fontWeight: FontWeight.w700,
                                fontSize: FontSizes.f14,
                                color: appCtrl.appTheme.blackColor,
                              ).marginOnly(
                                left: AppScreenUtil().screenWidth(15),
                                right: AppScreenUtil().screenWidth(15),
                                top: AppScreenUtil().screenHeight(10),
                                bottom: AppScreenUtil().screenHeight(20),
                              ),
                              //form text box
                              if (deliveryDetailCtrl.shippingDetail != null)
                                ...deliveryDetailCtrl.shippingDetail!.data!
                                    .asMap()
                                    .entries
                                    .map((e) {
                                  int? selectBillingRadio = deliveryDetailCtrl
                                              .shippingDetail!
                                              .data![e.key]
                                              .isDefault! ==
                                          true
                                      ? e.key
                                      : null;
                                  return Row(
                                    children: [
                                      CustomRadio(
                                        index: e.key,
                                        selectRadio: deliveryDetailCtrl
                                            .shippingSelectRadio,
                                        onTap: () {
                                          deliveryDetailCtrl.selectedSAddress =
                                              deliveryDetailCtrl
                                                  .shippingDetail!.data![e.key];
                                          deliveryDetailCtrl
                                              .shippingSelectRadio = e.key;
                                          deliveryDetailCtrl.selectSAddress(
                                              deliveryDetailCtrl
                                                  .shippingDetail!.data![e.key],
                                              e.key);
                                          selectBillingRadio =
                                              deliveryDetailCtrl
                                                  .shippingSelectRadio;
                                        },
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: AddressLayout(
                                          atDelivery: true,
                                          selectRadio: selectBillingRadio,
                                          index: e.key,
                                          addressList: e.value,
                                        ),
                                      ),
                                    ],
                                  ).marginSymmetric(
                                      horizontal:
                                          AppScreenUtil().screenWidth(15));
                                }).toList(),
                              if (deliveryDetailCtrl.shippingDetail!.data !=
                                      null &&
                                  deliveryDetailCtrl
                                      .shippingDetail!.data!.isEmpty)
                                Align(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Space(0, 20),
                                      const Text('No Address Found'),
                                      const Space(0, 40),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: CustomButton(
                                          onTap: () async {
                                            var status = await Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddAddress(),
                                              ),
                                            );
                                            if (status != null && status) {
                                              await deliveryDetailCtrl
                                                  .getShippingAddress();
                                              await deliveryDetailCtrl
                                                  .getAddress();
                                            }
                                          },
                                          title: "+ Add New Address",
                                        ),
                                      ),
                                      const Space(0, 30),
                                    ],
                                  ),
                                ),
                              Row(
                                children: [
                                  IconButton(
                                      padding: EdgeInsets.zero,
                                      constraints: const BoxConstraints(),
                                      icon: AnimatedSwitcher(
                                        duration:
                                            const Duration(milliseconds: 350),
                                        transitionBuilder: (child, anim) =>
                                            RotationTransition(
                                                turns: child.key ==
                                                        const ValueKey('icon1')
                                                    ? Tween<double>(
                                                            begin: 1, end: 0.75)
                                                        .animate(anim)
                                                    : Tween<double>(
                                                            begin: 0.75, end: 1)
                                                        .animate(anim),
                                                child: ScaleTransition(
                                                    scale: anim, child: child)),
                                        child: deliveryDetailCtrl
                                                .isNewShippingAddress!
                                            ? Icon(Icons.check_box,
                                                color: appCtrl.appTheme.primary)
                                            : Icon(
                                                Icons.check_box_outline_blank,
                                                color: appCtrl
                                                    .appTheme.borderColor,
                                                key: const ValueKey('icon2'),
                                              ),
                                      ),
                                      onPressed: () {
                                        deliveryDetailCtrl
                                                .isNewShippingAddress =
                                            !deliveryDetailCtrl
                                                .isNewShippingAddress!;
                                        if (deliveryDetailCtrl
                                                .isNewShippingAddress ==
                                            false) {
                                          deliveryDetailCtrl.selectedSAddress =
                                              deliveryDetailCtrl
                                                  .selectedBAddress;
                                        }
                                        deliveryDetailCtrl.update();
                                      }),
                                  const Space(10, 0),
                                  const Text(
                                      'Ship to a different billing address?'),
                                ],
                              ).marginOnly(
                                left: AppScreenUtil().screenWidth(15),
                                right: AppScreenUtil().screenWidth(15),
                                bottom: AppScreenUtil().screenWidth(15),
                              ),
                            ],
                          ),
                          const BorderLineLayout(),
                          Visibility(
                            visible: deliveryDetailCtrl.isNewShippingAddress!,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //form text box
                                LatoFontStyle(
                                  text: "Select Billing Address",
                                  fontWeight: FontWeight.w700,
                                  fontSize: FontSizes.f14,
                                  color: appCtrl.appTheme.blackColor,
                                ).marginOnly(
                                  left: AppScreenUtil().screenWidth(15),
                                  right: AppScreenUtil().screenWidth(15),
                                  top: AppScreenUtil().screenHeight(20),
                                ),
                                Column(
                                  children: [
                                    if (deliveryDetailCtrl.deliveryDetail !=
                                            null &&
                                        deliveryDetailCtrl
                                                .isNewShippingAddress ==
                                            true)
                                      ...deliveryDetailCtrl
                                          .deliveryDetail!.data!
                                          .asMap()
                                          .entries
                                          .map((e) {
                                        // int? selectShippingRadio = deliveryDetailCtrl.isNewShippingAddress == true ? selectBillingRadio;
                                        int? selectShippingRadio =
                                            deliveryDetailCtrl
                                                        .deliveryDetail!
                                                        .data![e.key]
                                                        .isDefault! ==
                                                    true
                                                ? e.key
                                                : null;
                                        // int? selectShippingRadio = null;
                                        return Row(
                                          children: [
                                            CustomRadio(
                                              index: e.key,
                                              selectRadio: deliveryDetailCtrl
                                                  .billingSelectRadio,
                                              onTap: () {
                                                deliveryDetailCtrl
                                                        .selectedBAddress =
                                                    deliveryDetailCtrl
                                                        .deliveryDetail!
                                                        .data![e.key];
                                                deliveryDetailCtrl
                                                    .billingSelectRadio = e.key;
                                                deliveryDetailCtrl
                                                    .selectBAddress(
                                                        deliveryDetailCtrl
                                                            .deliveryDetail!
                                                            .data![e.key],
                                                        e.key);
                                                selectShippingRadio =
                                                    deliveryDetailCtrl
                                                        .billingSelectRadio;
                                                //deliveryDetailCtrl.update();
                                              },
                                            ),
                                            Expanded(
                                              child: AddressLayout(
                                                atDelivery: true,
                                                selectRadio:
                                                    selectShippingRadio,
                                                index: e.key,
                                                addressList: e.value,
                                                isShow: false,
                                              ).marginSymmetric(
                                                  horizontal: AppScreenUtil()
                                                      .screenWidth(15)),
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                  ],
                                ).marginSymmetric(
                                    vertical: AppScreenUtil().screenHeight(20),
                                    horizontal:
                                        AppScreenUtil().screenWidth(15)),
                              ],
                            ),
                          ),
                          const BorderLineLayout(),
                          const Space(0, 30),
                          Column(
                            children: [
                              CustomTextFormField(
                                radius: 5,
                                labelText: "Order Notes",
                                controller: deliveryDetailCtrl.txtOrderNotes,
                                focusNode:
                                    deliveryDetailCtrl.focusTxtOrderNotes,
                                minLines: 7,
                                maxLines: 7,
                                keyboardType: TextInputType.name,
                                enabled: true,
                                onFieldSubmitted: (value) {
                                  AddAddressWidget().fieldFocusChange(
                                      context,
                                      deliveryDetailCtrl.focusTxtOrderNotes,
                                      deliveryDetailCtrl.focusTxtOrderNotes);
                                },
                              ),
                              const Space(0, 30),
                            ],
                          ).marginSymmetric(
                            horizontal: AppScreenUtil().screenWidth(15),
                          )
                        ],
                      ).marginOnly(
                        bottom: AppScreenUtil().screenHeight(80),
                      ),
              ),

              //proceed to payment and view detail layout
              if (deliveryDetailCtrl.deliveryDetail != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CartBottomLayout(
                    desc: CartFont().viewDetail,
                    buttonName: CartFont().proceedToPayment,
                    totalAmount: deliveryDetailCtrl.totalAmount.toString(),
                    onTap: () async {
                      if (deliveryDetailCtrl.shippingDetail!.data != null &&
                          deliveryDetailCtrl.shippingDetail!.data!.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please Add Atleast One Shipping Address");
                        return;
                      } else if (deliveryDetailCtrl.shippingSelectRadio ==
                              null &&
                          deliveryDetailCtrl.isNewShippingAddress == true) {
                        Fluttertoast.showToast(
                            msg: "Please Select Shipping Address");
                        return;
                      } else {
                        if (deliveryDetailCtrl.isNewShippingAddress == false) {
                          deliveryDetailCtrl.selectedBAddress =
                              deliveryDetailCtrl.selectedSAddress;
                          deliveryDetailCtrl.update();
                        }
                        var data = {
                          'billingAddress': deliveryDetailCtrl.selectedBAddress,
                          'shippingAddress':
                              deliveryDetailCtrl.selectedSAddress,
                          'orderNote':
                              deliveryDetailCtrl.txtOrderNotes.text.trim(),
                          'totalAmount':
                              deliveryDetailCtrl.totalAmount.toString(),
                        };
                        Get.toNamed(routeName.payment, arguments: data);
                      }
                    },
                  ),
                )
            ],
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    Get.delete<DeliveryDetailController>();
    super.dispose();
  }
}
