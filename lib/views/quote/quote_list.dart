import 'dart:collection';

import 'package:dapperz/config.dart';
import 'package:dapperz/controllers/quote/quote_controller.dart';
import 'package:flutter/cupertino.dart';

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  @override
  Widget build(BuildContext context) {
    final quoteCtrl = Get.put(QuoteController());
    return GetBuilder<QuoteController>(builder: (quoteCtrl) {
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
                  text: "Quotes",
                  fontSize: FontSizes.f16,
                  fontWeight: FontWeight.w700),
            ),
            body: quoteCtrl.isLoading
                ? const Center(child: CircularProgressIndicator(strokeWidth: 3))
                : quoteCtrl.quoteListModel != null &&
                        quoteCtrl.quoteListModel!.data != null &&
                        quoteCtrl.quoteListModel!.data!.isNotEmpty
                    ? ListView.builder(
                        itemCount: quoteCtrl.quoteListModel!.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              HashMap<String, dynamic> params = HashMap();
                              params['name'] =
                                  quoteCtrl.quoteListModel!.data![index].name ??
                                      "";
                              params['id'] =
                                  quoteCtrl.quoteListModel!.data![index].id ??
                                      "";
                              Get.toNamed(routeName.quoteDetail,
                                  arguments: params);
                            },
                            title: Row(
                              children: [
                                Text(
                                  quoteCtrl.quoteListModel!.data![index].name ??
                                      "",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13),
                                ),
                              ],
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Mobile No: ${quoteCtrl.quoteListModel!.data![index].phoneNumber ?? ""}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 11),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Requirements: ${quoteCtrl.quoteListModel!.data![index].requirements ?? ""}",
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 11),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            leading: Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: appCtrl.appTheme.primary,
                                  borderRadius: BorderRadius.circular(15)),
                              constraints: const BoxConstraints(
                                  minWidth: 30, minHeight: 30),
                              child: Text(
                                (quoteCtrl.quoteListModel!.data![index]
                                                .requestCount ??
                                            0) >
                                        0
                                    ? (quoteCtrl.quoteListModel!.data![index]
                                                .requestCount ??
                                            0)
                                        .toString()
                                    : "-",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 13),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            trailing: TextButton(
                              onPressed: () {
                                HashMap<String, dynamic> params = HashMap();
                                params['name'] = quoteCtrl
                                        .quoteListModel!.data![index].name ??
                                    "";
                                params['id'] =
                                    quoteCtrl.quoteListModel!.data![index].id ??
                                        "";
                                Get.toNamed(routeName.quoteDetail,
                                    arguments: params);
                              },
                              child: const Text('View',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 11)),
                            ),
                          );
                          // return Text( ?? "");
                        },
                      ).marginSymmetric(
                        horizontal: AppScreenUtil().screenWidth(10))
                    : const Center(
                        child: Text("No Quotes are available currently")),
          ),
        );
      });
    });
  }
}
