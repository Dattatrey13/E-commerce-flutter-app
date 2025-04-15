import 'dart:collection';
import 'dart:io';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  final orderDetailCtrl = Get.put(OrderDetailController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailController>(builder: (_) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: NestedSilverCustomAppBar(
            isBack: true,
            bodyLayout: orderDetailCtrl.isLoading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 2,
                          color: appCtrl.appTheme.whiteColor,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppScreenUtil().screenWidth(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    width: 120,
                                    child: StatusLayout(
                                      title: orderDetailCtrl.getOrderByIdModel!
                                              .data!.status ??
                                          "",
                                    ),
                                  ),
                                ),
                                const Space(0, 5),
                                LatoFontStyle(
                                  text:
                                      "Order #${orderDetailCtrl.getOrderByIdModel!.data!.id ?? "-"}",
                                  fontWeight: FontWeight.w600,
                                  fontSize: FontSizes.f14,
                                  color: appCtrl.appTheme.blackColor,
                                ),
                                Row(
                                  children: [
                                    LatoFontStyle(
                                        text: "Items: ",
                                        fontWeight: FontWeight.w700,
                                        fontSize: FontSizes.f13,
                                        color: appCtrl.appTheme.contentColor),
                                    const Space(0, 5),
                                    LatoFontStyle(
                                      text: orderDetailCtrl.getOrderByIdModel!
                                          .data!.lineItems!.length
                                          .toString(),
                                      fontWeight: FontWeight.w700,
                                      fontSize: FontSizes.f13,
                                      color: appCtrl.appTheme.contentColor,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    LatoFontStyle(
                                        text: "Order Placed On: ",
                                        fontWeight: FontWeight.w700,
                                        fontSize: FontSizes.f13,
                                        color: appCtrl.appTheme.contentColor),
                                    const Space(0, 5),
                                    LatoFontStyle(
                                        text: dateTimeForOrder(orderDetailCtrl
                                            .getOrderByIdModel!
                                            .data!
                                            .lineItems!
                                            .first
                                            .createdAt
                                            .toString()),
                                        fontWeight: FontWeight.w700,
                                        fontSize: FontSizes.f13,
                                        color: appCtrl.appTheme.contentColor),
                                  ],
                                ),
                                Row(
                                  children: [
                                    LatoFontStyle(
                                      text: "Payment Method: ",
                                      fontWeight: FontWeight.w700,
                                      fontSize: FontSizes.f13,
                                      color: appCtrl.appTheme.contentColor,
                                    ),
                                    const Space(0, 5),
                                    LatoFontStyle(
                                      text: orderDetailCtrl.getOrderByIdModel!
                                          .data!.paymentMethodTitle
                                          .toString(),
                                      fontWeight: FontWeight.w700,
                                      fontSize: FontSizes.f13,
                                      color: appCtrl.appTheme.contentColor,
                                    ),
                                  ],
                                ),
                                LatoFontStyle(
                                  text:
                                      "Total: ${appCtrl.priceSymbol}${double.parse(orderDetailCtrl.getOrderByIdModel!.data!.total!)}",
                                  fontWeight: FontWeight.w600,
                                  fontSize: FontSizes.f14,
                                  color: appCtrl.appTheme.blackColor,
                                ),
                              ],
                            ).marginSymmetric(
                              horizontal: AppScreenUtil().screenWidth(5),
                            ),
                          ).marginSymmetric(
                            vertical: AppScreenUtil().screenHeight(15),
                          ),
                        ).marginSymmetric(
                          horizontal: AppScreenUtil().screenWidth(15),
                        ),
                        const Space(0, 20),
                        // //order track layout
                        // const OrderTimeLineProcess(),
                        // rating layout
                        // const OrderRating(),
                        // const Space(0, 20),
                        const BorderLineLayout(),
                        const Space(0, 10),
                        //shipping detail text layout
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OrderDetailWidget()
                                .commonText(OrderDetailFont().shippingDetail),
                            TextButton(
                              onPressed: () async {
                                if (orderDetailCtrl
                                        .getOrderByIdModel!.data!.invoiceUrl !=
                                    null) {
                                  await downloadFile(
                                      orderDetailCtrl
                                          .getOrderByIdModel!.data!.invoiceUrl!,
                                      "${orderDetailCtrl.getOrderByIdModel!.data!.id}.pdf");
                                } else {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Currently invoice is not available. Please try again after sometime");
                                  // String url =
                                  //     "https://www.dapperz.in/add-invoice/${orderDetailCtrl.getOrderByIdModel!.data!.id}?token=${UserSingleton().token}";
                                  // launchURL(Uri.parse(url));
                                }
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  LatoFontStyle(
                                    text: "Download Invoice",
                                    fontWeight: FontWeight.w600,
                                    fontSize: FontSizes.f14,
                                    color: appCtrl.appTheme.blackColor,
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(Icons.download,
                                      color: Colors.black),
                                ],
                              ),
                            ).padding(right: 10),
                          ],
                        ),
                        const Space(0, 10),
                        Divider(
                            color: appCtrl.appTheme.gray,
                            indent: 15,
                            endIndent: 15),
                        const Space(0, 10),
                        // address layout
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LatoFontStyle(
                              text:
                                  "${orderDetailCtrl.getOrderByIdModel!.data!.shipping!.firstName} ${orderDetailCtrl.getOrderByIdModel!.data!.shipping!.lastName}",
                              fontWeight: FontWeight.w600,
                              fontSize: FontSizes.f14,
                              color: appCtrl.appTheme.blackColor,
                            ),
                            const Space(0, 5),
                            DeliveryDetailWidgets().addressCommonText(
                                orderDetailCtrl.getOrderByIdModel!.data!
                                        .shipping?.address1 ??
                                    "-"),
                            DeliveryDetailWidgets().addressCommonText(
                                orderDetailCtrl.getOrderByIdModel!.data!
                                        .shipping?.address2 ??
                                    "-"),
                            Row(
                              children: [
                                DeliveryDetailWidgets().addressCommonText(
                                    orderDetailCtrl.getOrderByIdModel!.data!
                                            .shipping?.city ??
                                        "-"),
                                const SizedBox(width: 10),
                                LatoFontStyle(
                                    text: orderDetailCtrl.getOrderByIdModel!
                                            .data!.shipping?.state ??
                                        "-",
                                    fontWeight: FontWeight.normal,
                                    fontSize: FontSizes.f14,
                                    color: appCtrl.appTheme.contentColor),
                                const SizedBox(width: 10),
                                LatoFontStyle(
                                    text: orderDetailCtrl.getOrderByIdModel!
                                            .data!.shipping?.country ??
                                        "-",
                                    fontWeight: FontWeight.normal,
                                    fontSize: FontSizes.f14,
                                    color: appCtrl.appTheme.contentColor)
                              ],
                            ),
                            const Space(0, 10),
                          ],
                        ).marginSymmetric(horizontal: Insets.i15),
                        const Space(0, 20),
                        const BorderLineLayout(),
                        const Space(0, 20),
                        OrderDetailWidget().commonText("Billing Details"),
                        const Space(0, 10),
                        Divider(
                            color: appCtrl.appTheme.gray,
                            indent: 15,
                            endIndent: 15),
                        const Space(0, 10),
                        // address layout
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LatoFontStyle(
                              text:
                                  "${orderDetailCtrl.getOrderByIdModel!.data!.billing!.firstName} ${orderDetailCtrl.getOrderByIdModel!.data!.billing!.lastName}",
                              fontWeight: FontWeight.w600,
                              fontSize: FontSizes.f14,
                              color: appCtrl.appTheme.blackColor,
                            ),
                            const Space(0, 5),
                            DeliveryDetailWidgets().addressCommonText(
                                orderDetailCtrl.getOrderByIdModel!.data!
                                        .billing!.address1 ??
                                    "-"),
                            DeliveryDetailWidgets().addressCommonText(
                                orderDetailCtrl.getOrderByIdModel!.data!
                                        .billing!.address2 ??
                                    "-"),
                            Row(
                              children: [
                                DeliveryDetailWidgets().addressCommonText(
                                    orderDetailCtrl.getOrderByIdModel!.data!
                                            .billing!.city ??
                                        "-"),
                                const SizedBox(width: 10),
                                LatoFontStyle(
                                    text: orderDetailCtrl.getOrderByIdModel!
                                            .data!.billing!.state ??
                                        "-",
                                    fontWeight: FontWeight.normal,
                                    fontSize: FontSizes.f14,
                                    color: appCtrl.appTheme.contentColor),
                                const SizedBox(width: 10),
                                LatoFontStyle(
                                    text: orderDetailCtrl.getOrderByIdModel!
                                            .data!.billing!.country ??
                                        "-",
                                    fontWeight: FontWeight.normal,
                                    fontSize: FontSizes.f14,
                                    color: appCtrl.appTheme.contentColor)
                              ],
                            ),
                            const Space(0, 5),
                            DeliveryDetailWidgets().addressCommonText(
                                orderDetailCtrl.getOrderByIdModel!.data!
                                        .billing!.phone ??
                                    "-"),
                            DeliveryDetailWidgets().addressCommonText(
                                orderDetailCtrl.getOrderByIdModel!.data!
                                        .billing!.email ??
                                    "-"),
                            const Space(0, 10),
                          ],
                        ).marginSymmetric(horizontal: Insets.i15),
                        const Space(0, 20),
                        const BorderLineLayout(),
                        const Space(0, 15),
                        //price detail text layout
                        OrderDetailWidget()
                            .commonText(OrderDetailFont().priceDetails),
                        const Space(0, 10),
                        Divider(
                            color: appCtrl.appTheme.gray,
                            indent: 15,
                            endIndent: 15),
                        const Space(0, 10),
                        //price layout
                        // Get Cart List Data
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...orderDetailCtrl
                                  .getOrderByIdModel!.data!.lineItems!
                                  .map(
                                (e) {
                                  return Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(routeName.productDetail,
                                              arguments:
                                                  e.productId!.id.toString(),
                                              preventDuplicates: false);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  LatoFontStyle(
                                                    text: (e.productId!
                                                            .productTitle)!
                                                        .replaceAll(
                                                            "&amp;", "&"),
                                                    fontSize: FontSizes.f12,
                                                    color: appCtrl
                                                        .appTheme.contentColor,
                                                    softWrap: true,
                                                  ),
                                                  LatoFontStyle(
                                                    text:
                                                        "Vendor Name: ${e.vendorId?.firstName ?? "-"} ${e.vendorId?.lastName ?? ""}",
                                                    fontSize: FontSizes.f10,
                                                    color: appCtrl
                                                        .appTheme.contentColor,
                                                    softWrap: true,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            LatoFontStyle(
                                              text:
                                                  "${appCtrl.priceSymbol} ${double.parse(e.lineSubtotal!).toStringAsFixed(2)}",
                                              fontSize: FontSizes.f12,
                                              color:
                                                  appCtrl.appTheme.contentColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                          color: appCtrl.appTheme.greyLight25),
                                    ],
                                  );
                                },
                              ).toList(),
                              // ...orderDetailCtrl.getOrderByIdModel!.data!.lineItems!.map(
                              //   (e) {
                              //     return Row(
                              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //       children: [
                              //         Expanded(
                              //           child: LatoFontStyle(
                              //             text: e.productId!.productSlug,
                              //             fontSize: FontSizes.f12,
                              //             color: appCtrl.appTheme.contentColor,
                              //             softWrap: true,
                              //           ),
                              //         ),
                              //       ],
                              //     ).marginOnly(
                              //       bottom: AppScreenUtil().screenHeight(10),
                              //     );
                              //   },
                              // ).toList(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  LatoFontStyle(
                                    text: CartFont().totalAmount.tr,
                                    fontSize: FontSizes.f14,
                                    color: appCtrl.appTheme.blackColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  LatoFontStyle(
                                    text:
                                        "${appCtrl.priceSymbol}${double.parse(orderDetailCtrl.getOrderByIdModel!.data!.total!).toStringAsFixed(2)}",
                                    fontSize: FontSizes.f14,
                                    color: appCtrl.appTheme.blackColor,
                                    fontWeight: FontWeight.w600,
                                  )
                                ],
                              ).marginOnly(
                                  bottom: AppScreenUtil().screenHeight(10)),
                            ]).marginSymmetric(
                          horizontal: AppScreenUtil().screenWidth(15),
                        ),
                        const BorderLineLayout(),
                        Visibility(
                          visible: orderDetailCtrl
                                      .getOrderByIdModel!.data!.subOrders !=
                                  null &&
                              orderDetailCtrl.getOrderByIdModel!.data!
                                  .subOrders!.isNotEmpty,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Space(0, 20),
                              OrderDetailWidget().commonText("Sub Orders"),
                              const Space(0, 10),
                              Divider(
                                  color: appCtrl.appTheme.gray,
                                  indent: 15,
                                  endIndent: 15),
                              const Space(0, 10),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ...orderDetailCtrl
                                        .getOrderByIdModel!.data!.subOrders!
                                        .map(
                                      (e) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    LatoFontStyle(
                                                      text: "#${e.id ?? "-"}",
                                                      fontSize: FontSizes.f14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: appCtrl.appTheme
                                                          .contentColor,
                                                      softWrap: true,
                                                    ),
                                                    LatoFontStyle(
                                                      text: getNormalDate(
                                                          e.dateCreated ?? ""),
                                                      fontSize: FontSizes.f10,
                                                      color: appCtrl.appTheme
                                                          .contentColor,
                                                      softWrap: true,
                                                    ),
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    LatoFontStyle(
                                                      text:
                                                          "${appCtrl.priceSymbol} ${double.parse(e.total!).toStringAsFixed(2)}",
                                                      fontSize: FontSizes.f12,
                                                      color: appCtrl.appTheme
                                                          .contentColor,
                                                    ),
                                                    LatoFontStyle(
                                                      text:
                                                          "for ${e.totalLineItem} item",
                                                      fontSize: FontSizes.f10,
                                                      color: appCtrl.appTheme
                                                          .contentColor,
                                                    ),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    Get.delete<
                                                        OrderDetailController>();
                                                    HashMap<String, dynamic>
                                                        params = HashMap();
                                                    params['id'] =
                                                        e.id.toString();
                                                    params['is_cancelable'] =
                                                        e.isCancelable;
                                                    Get.toNamed(
                                                        routeName.orderDetail,
                                                        arguments: params,
                                                        preventDuplicates:
                                                            false);
                                                  },
                                                  child: LatoFontStyle(
                                                    text: "View",
                                                    fontSize: FontSizes.f12,
                                                    fontWeight: FontWeight.bold,
                                                    color: appCtrl
                                                        .appTheme.contentColor,
                                                  ).padding(right: 10),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                                color: appCtrl
                                                    .appTheme.greyLight25),
                                          ],
                                        );
                                      },
                                    ).toList(),
                                  ]).marginSymmetric(
                                horizontal: AppScreenUtil().screenWidth(15),
                              ),
                              const BorderLineLayout(),
                            ],
                          ),
                        ),
                        const Space(0, 20),
                        Visibility(
                          visible:
                              orderDetailCtrl.getOrderByIdModel!.data!.status !=
                                      "cancelled" &&
                                  (orderDetailCtrl.isCancelable ?? false),
                          child: Column(
                            children: [
                              CustomTextFormField(
                                radius: 5,
                                labelText: "Cancel Order Notes",
                                controller: orderDetailCtrl.txtOrderNotes,
                                focusNode: orderDetailCtrl.focusTxtOrderNotes,
                                minLines: 7,
                                maxLines: 7,
                                keyboardType: TextInputType.name,
                                enabled: true,
                                onFieldSubmitted: (value) {
                                  AddAddressWidget().fieldFocusChange(
                                      context,
                                      orderDetailCtrl.focusTxtOrderNotes,
                                      orderDetailCtrl.focusTxtOrderNotes);
                                },
                              ).marginSymmetric(
                                  horizontal: AppScreenUtil().screenWidth(15)),
                              const Space(0, 30),
                              //download invoice
                              GestureDetector(
                                onTap: () {
                                  if (orderDetailCtrl.txtOrderNotes.text
                                      .trim()
                                      .isEmpty) {
                                    Fluttertoast.showToast(
                                        msg: "Please Enter Cancel Notes");
                                    return;
                                  }
                                  orderDetailCtrl.bottomSheetLayout(
                                      "Are you sure you want to cancel this order ?");
                                },
                                child: OrderDetailWidget()
                                    .buttonLayout(context, "Cancel Order"),
                              ),
                              const Space(0, 50),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
          ),
        ),
      );
    });
  }

  Future<void> downloadFile(String url, String fileName) async {
    final plugin = DeviceInfoPlugin();
    final android = await plugin.androidInfo;
    final storageStatus = android.version.sdkInt < 33
        ? await Permission.storage.request()
        : PermissionStatus.granted;
    if (storageStatus.isGranted) {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final dir = Directory('/storage/emulated/0/Download');
        final file = File('${dir.path}/$fileName');
        await file.writeAsBytes(response.bodyBytes);
        Fluttertoast.showToast(msg: 'Invoice Downloaded Successfully');
      } else {
        Fluttertoast.showToast(msg: 'Unable to download invoice');
      }
    } else {
      Fluttertoast.showToast(msg: 'Please allow storage permission');
    }
  }
}
