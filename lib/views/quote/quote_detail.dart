import 'dart:collection';

import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/controllers/quote/quote_detail_controller.dart';
import 'package:dapperz/views/chat/chat_screen.dart';
import 'package:dapperz/views/menu/full_screen_image.dart';
import 'package:flutter/cupertino.dart';

class QuoteDetail extends StatefulWidget {
  const QuoteDetail({super.key});

  @override
  State<QuoteDetail> createState() => _QuoteDetailState();
}

class _QuoteDetailState extends State<QuoteDetail> {
  @override
  Widget build(BuildContext context) {
    final quoteDetailCtrl = Get.put(QuoteDetailController());
    return GetBuilder<QuoteDetailController>(builder: (quoteCtrl) {
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
              title: LatoFontStyle(
                  text: quoteDetailCtrl.isLoading ? "" : quoteDetailCtrl.name,
                  fontSize: FontSizes.f16,
                  fontWeight: FontWeight.w700),
            ),
            body: quoteDetailCtrl.isLoading
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
                              Text(
                                  "Date: ${getNormalDate(quoteDetailCtrl.quoteDetailModel!.data!.quotation!.createdAt ?? "")}"),
                              Text(
                                  "Requirement: ${quoteDetailCtrl.quoteDetailModel!.data!.quotation!.requirements ?? "-"}"),
                              Text(
                                  "Description: ${quoteDetailCtrl.quoteDetailModel!.data!.quotation!.details ?? ""}"),
                              Text(
                                  "Phone Number: ${quoteDetailCtrl.quoteDetailModel!.data!.quotation!.phoneNumber ?? ""}"),
                              Text(
                                  "Company Name: ${quoteDetailCtrl.quoteDetailModel!.data!.quotation!.companyName ?? "-"}"),
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
                        quoteDetailCtrl.quoteDetailModel!.data!.quotation!
                                        .referenceImages ==
                                    null ||
                                quoteDetailCtrl.quoteDetailModel!.data!
                                    .quotation!.referenceImages!.isEmpty
                            ? const Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                    height: 50,
                                    child: Text('No images available')))
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: quoteDetailCtrl.quoteDetailModel!
                                    .data!.quotation!.referenceImages!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Align(
                                    alignment: Alignment.centerLeft,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                FullScreenImage(
                                                    imageUrl: quoteDetailCtrl
                                                            .quoteDetailModel!
                                                            .data!
                                                            .quotation!
                                                            .referenceImages![
                                                        index]),
                                          ),
                                        );
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: FadeInImageLayout(
                                            image: quoteDetailCtrl
                                                .quoteDetailModel!
                                                .data!
                                                .quotation!
                                                .referenceImages![index],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                        const SizedBox(height: 10),
                        const BorderLineLayout(),
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Quote List (${quoteDetailCtrl.quoteDetailModel!.data!.requests!.length})",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const Divider(),
                        const SizedBox(height: 10),
                        quoteDetailCtrl
                                .quoteDetailModel!.data!.requests!.isEmpty
                            ? const Center(
                                child: SizedBox(
                                    height: 30,
                                    child: Text('No Quote Request available')))
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: quoteDetailCtrl
                                    .quoteDetailModel!.data!.requests!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Align(
                                        //   alignment: Alignment.centerRight,
                                        //   child: Text((quoteDetailCtrl.quoteDetailModel!.data!.requests![index].status ?? "").toUpperCase()),
                                        // ),
                                        // const SizedBox(height: 20),
                                        Text(
                                            "Vendor Name: ${quoteDetailCtrl.quoteDetailModel!.data!.requests![index].vendorId!.firstName ?? ""}"),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                                    "Notes: ${quoteDetailCtrl.quoteDetailModel!.data!.requests![index].notes ?? "-"}"))
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                                "Sub Total: ${quoteDetailCtrl.quoteDetailModel!.data!.requests![index].subTotal ?? ""}"),
                                            const Spacer(),
                                            Text(
                                              "Total: ${quoteDetailCtrl.quoteDetailModel!.data!.requests![index].total ?? ""}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: TextButton(
                                                onPressed: () {
                                                  HashMap<String, dynamic>
                                                      params = HashMap<String,
                                                          dynamic>();
                                                  params['id'] = quoteDetailCtrl
                                                      .quoteDetailModel!
                                                      .data!
                                                      .requests![index]
                                                      .id;
                                                  Get.toNamed(
                                                          routeName
                                                              .quoteRequestDetail,
                                                          arguments: params)!
                                                      .then((value) {
                                                    quoteDetailCtrl
                                                        .getQuoteList();
                                                  });
                                                },
                                                child: const Text("View Quote"),
                                              ),
                                            ),
                                            Expanded(
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (BuildContext
                                                              context) =>
                                                          ChatScreen(
                                                        id: quoteDetailCtrl
                                                            .quoteDetailModel!
                                                            .data!
                                                            .requests![index]
                                                            .vendorId!
                                                            .id
                                                            .toString(),
                                                        name:
                                                            "${quoteDetailCtrl.quoteDetailModel!.data!.requests![index].vendorId!.firstName ?? ""} ${quoteDetailCtrl.quoteDetailModel!.data!.requests![index].vendorId!.lastName ?? ""}",
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child:
                                                    const Text("Send Message"),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Visibility(
                                          visible: index !=
                                              (quoteDetailCtrl.quoteDetailModel!
                                                      .data!.requests!.length -
                                                  1),
                                          child:
                                              const Divider(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
          ),
        );
      });
    });
  }
}
