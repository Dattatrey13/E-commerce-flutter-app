import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/controllers/quote/quote_request_detail_controller.dart';
import 'package:dapperz/views/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart';

class QuoteRequestDetail extends StatefulWidget {
  const QuoteRequestDetail({super.key});

  @override
  State<QuoteRequestDetail> createState() => _QuoteRequestDetailState();
}

class _QuoteRequestDetailState extends State<QuoteRequestDetail> {
  @override
  Widget build(BuildContext context) {
    final quoteDetailCtrl = Get.put(QuoteRequestDetailController());
    return GetBuilder<QuoteRequestDetailController>(
        builder: (quoteRequestDetailCtrl) {
      return GetBuilder<AppController>(builder: (appCtrl) {
        return Directionality(
          textDirection: appCtrl.isRTL || appCtrl.languageVal == "ar"
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: Scaffold(
            backgroundColor: appCtrl.appTheme.whiteColor,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: appCtrl.appTheme.whiteColor,
              automaticallyImplyLeading: false,
              leading: Icon(CupertinoIcons.arrow_left,
                      size: AppScreenUtil().size(25),
                      color: appCtrl.appTheme.blackColor)
                  .gestures(
                onTap: () {
                  Get.back();
                },
              ),
              title: const LatoFontStyle(
                  text: "Quote Request Details",
                  fontSize: FontSizes.f16,
                  fontWeight: FontWeight.w700),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ChatScreen(
                          id: quoteRequestDetailCtrl.quoteRequestDetailModel!
                              .data!.requests!.vendorId!.id
                              .toString(),
                          name:
                              "${quoteRequestDetailCtrl.quoteRequestDetailModel!.data!.requests!.vendorId!.firstName ?? ""} ${quoteRequestDetailCtrl.quoteRequestDetailModel!.data!.requests!.vendorId!.lastName ?? ""}",
                        ),
                      ),
                    );
                  },
                  child: const Text("Chat"),
                ),
              ],
            ),
            body: quoteRequestDetailCtrl.isLoading
                ? const Center(child: CircularProgressIndicator(strokeWidth: 3))
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  LatoFontStyle(
                                    text:
                                        "Quote Details (ID: ${quoteRequestDetailCtrl.quoteRequestDetailModel!.data!.quotation!.id ?? ""})",
                                    fontSize: FontSizes.f14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const Spacer(),
                                  LatoFontStyle(
                                    text: (quoteDetailCtrl
                                                .quoteRequestDetailModel!
                                                .data!
                                                .requests!
                                                .status ??
                                            "")
                                        .toUpperCase(),
                                    fontSize: FontSizes.f14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              const Space(0, 10),
                              Divider(color: appCtrl.appTheme.gray),
                              const Space(0, 10),
                              Text(
                                  "Name: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.quotation!.name ?? ""}"),
                              Text(
                                  "Requirement: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.quotation!.requirements ?? "-"}"),
                              Text(
                                  "Phone Number: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.quotation!.phoneNumber ?? ""}"),
                              Text(
                                  "Description: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.quotation!.details ?? ""}"),
                              Text(
                                  "Company Name: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.quotation!.companyName ?? "-"}"),
                              Text(
                                  "Created At: ${getNormalDate(quoteDetailCtrl.quoteRequestDetailModel!.data!.quotation!.createdAt ?? "")}"),
                            ],
                          ),
                        ),
                        const BorderLineLayout(),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Images:",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(height: 20),
                        quoteDetailCtrl.quoteRequestDetailModel!.data!
                                        .quotation!.referenceImages ==
                                    null ||
                                quoteDetailCtrl.quoteRequestDetailModel!.data!
                                    .quotation!.referenceImages!.isEmpty
                            ? const Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  height: 50,
                                  child: Text('No images available'),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: quoteDetailCtrl
                                    .quoteRequestDetailModel!
                                    .data!
                                    .quotation!
                                    .referenceImages!
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 200,
                                    child: FadeInImageLayout(
                                      image: quoteDetailCtrl
                                          .quoteRequestDetailModel!
                                          .data!
                                          .quotation!
                                          .referenceImages![index],
                                    ),
                                  );
                                }),
                        const BorderLineLayout(),
                        const Space(0, 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const LatoFontStyle(
                                    text: "Request Details",
                                    fontSize: FontSizes.f14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  const Spacer(),
                                  LatoFontStyle(
                                    text: (quoteDetailCtrl
                                                .quoteRequestDetailModel!
                                                .data!
                                                .requests!
                                                .status ??
                                            "")
                                        .toUpperCase(),
                                    fontSize: FontSizes.f14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ],
                              ),
                              const Space(0, 10),
                              Divider(color: appCtrl.appTheme.gray),
                              const Space(0, 10),
                              Text(
                                  "Requested User: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.requestedUser!.firstName ?? ""} ${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.requestedUser!.lastName ?? ""}"),
                              Text(
                                  "Created At: ${getNormalDate(quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.createdAt ?? "")}"),
                              Text(
                                  "Vendor: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.vendorId!.firstName ?? "-"} ${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.vendorId!.lastName ?? "-"}"),
                              Text(
                                  "Updated At: ${getNormalDate(quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.updatedAt ?? "")}"),
                              Text(
                                  "Note: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.notes ?? "-"}"),
                            ],
                          ),
                        ),
                        const BorderLineLayout(),
                        const Space(0, 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LatoFontStyle(
                                text:
                                    "Quotation Items (${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.quotationItems!.length})",
                                fontSize: FontSizes.f14,
                                fontWeight: FontWeight.w700,
                              ),
                              const Space(0, 10),
                              Divider(color: appCtrl.appTheme.gray),
                            ],
                          ),
                        ),
                        quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!
                                .quotationItems!.isEmpty
                            ? const Center(
                                child: SizedBox(
                                    height: 30,
                                    child:
                                        Text('No Quotation Items available')))
                            : Column(
                                children: [
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemCount: quoteDetailCtrl
                                          .quoteRequestDetailModel!
                                          .data!
                                          .requests!
                                          .quotationItems!
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  "Title: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.quotationItems![index].title ?? ""}"),
                                              Text(
                                                  "Description: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.quotationItems![index].description ?? ""}"),
                                              const SizedBox(height: 10),
                                              Container(
                                                color: appCtrl.appTheme.primary,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text("Price"),
                                                          Text(quoteDetailCtrl
                                                                  .quoteRequestDetailModel!
                                                                  .data!
                                                                  .requests!
                                                                  .quotationItems![
                                                                      index]
                                                                  .price ??
                                                              ""),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          const Text(
                                                              "Quantity"),
                                                          Text((quoteDetailCtrl
                                                                      .quoteRequestDetailModel!
                                                                      .data!
                                                                      .requests!
                                                                      .quotationItems![
                                                                          index]
                                                                      .qty ??
                                                                  "")
                                                              .toString()),
                                                        ],
                                                      ),
                                                      const Spacer(),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          const Text(
                                                            "Line Total",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            quoteDetailCtrl
                                                                    .quoteRequestDetailModel!
                                                                    .data!
                                                                    .requests!
                                                                    .quotationItems![
                                                                        index]
                                                                    .lineTotal ??
                                                                "",
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                children: [
                                                  Text(
                                                      "Tax Included: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.quotationItems![index].isIncludedTax ?? ""}"),
                                                  const Spacer(),
                                                  Text(
                                                      "Tax %: ${quoteDetailCtrl.quoteRequestDetailModel!.data!.requests!.quotationItems![index].taxPer ?? "-"}"),
                                                ],
                                              ),
                                              Visibility(
                                                visible: index !=
                                                    (quoteDetailCtrl
                                                            .quoteRequestDetailModel!
                                                            .data!
                                                            .requests!
                                                            .quotationItems!
                                                            .length -
                                                        1),
                                                child: const Divider(
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text("Sub Total:"),
                                            const Spacer(),
                                            Text(quoteDetailCtrl
                                                    .quoteRequestDetailModel!
                                                    .data!
                                                    .requests!
                                                    .subTotal ??
                                                ""),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("Total Tax:"),
                                            const Spacer(),
                                            Text(quoteDetailCtrl
                                                    .quoteRequestDetailModel!
                                                    .data!
                                                    .requests!
                                                    .totalTax ??
                                                ""),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text("Sub Total:"),
                                            const Spacer(),
                                            Text(quoteDetailCtrl
                                                    .quoteRequestDetailModel!
                                                    .data!
                                                    .requests!
                                                    .shipping ??
                                                ""),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              "Total:",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            Text(
                                              quoteDetailCtrl
                                                      .quoteRequestDetailModel!
                                                      .data!
                                                      .requests!
                                                      .total ??
                                                  "",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                        const SizedBox(height: 20),
                        Visibility(
                          visible: (quoteDetailCtrl.quoteRequestDetailModel!
                                          .data!.requests!.status ??
                                      "")
                                  .toLowerCase() ==
                              "pending",
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  title: "Decline",
                                  color: Colors.red.shade400,
                                  onTap: () {
                                    quoteDetailCtrl.acceptOrDecline("declined");
                                  },
                                ),
                              ),
                              Expanded(
                                child: CustomButton(
                                  title: "Accept",
                                  color: Colors.green.shade400,
                                  onTap: () {
                                    quoteDetailCtrl.acceptOrDecline("accepted");
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
          ),
        );
      });
    });
  }
}
