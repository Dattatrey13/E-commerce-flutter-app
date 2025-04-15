import 'package:dapperz/config.dart';
import 'package:dapperz/controllers/quote/vendor_controller.dart';
import 'package:dapperz/views/chat/chat_screen.dart';
import 'package:flutter/cupertino.dart';

class VendorList extends StatefulWidget {
  const VendorList({super.key});

  @override
  State<VendorList> createState() => _VendorListState();
}

class _VendorListState extends State<VendorList> {
  @override
  Widget build(BuildContext context) {
    final venCtrl = Get.put(VendorController());
    return GetBuilder<VendorController>(builder: (venCtrl) {
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
                  text: "Contact Vendor",
                  fontSize: FontSizes.f16,
                  fontWeight: FontWeight.w700),
            ),
            body: venCtrl.isLoading
                ? const Center(child: CircularProgressIndicator(strokeWidth: 3))
                : venCtrl.vendorListModel != null &&
                        venCtrl.vendorListModel!.data != null &&
                        venCtrl.vendorListModel!.data!.isNotEmpty
                    ? ListView.separated(
                        itemCount: venCtrl.vendorListModel!.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 0.0, right: 0.0, bottom: 5.0),
                            child: ListTile(
                              onTap: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        ChatScreen(
                                      id: venCtrl
                                          .vendorListModel!.data![index].id
                                          .toString(),
                                      name:
                                          "${venCtrl.vendorListModel!.data![index].firstName ?? ""} ${venCtrl.vendorListModel!.data![index].lastName ?? ""}",
                                    ),
                                  ),
                                ).then((value) {
                                  venCtrl.getVendorList();
                                });
                              },
                              title: Row(
                                children: [
                                  Text(
                                    "${venCtrl.vendorListModel!.data![index].firstName ?? ""} ${venCtrl.vendorListModel!.data![index].lastName ?? ""}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                              leading: const Icon(Icons.account_circle,
                                  color: Colors.grey, size: 45),
                              // trailing: Visibility(
                              //   visible: (venCtrl.vendorListModel!.data![index].unreadCount ?? 0) > 0,
                              //   child: Container(
                              //     padding: const EdgeInsets.all(5),
                              //     decoration: BoxDecoration(color: appCtrl.appTheme.primary, borderRadius: BorderRadius.circular(20)),
                              //     constraints: const BoxConstraints(minWidth: 25, minHeight: 25),
                              //     child: Text(
                              //       (venCtrl.vendorListModel!.data![index].unreadCount ?? 0).toString(),
                              //       style: const TextStyle(color: Colors.black, fontSize: 12),
                              //       textAlign: TextAlign.center,
                              //     ),
                              //   ),
                              // ),
                            ),
                          );
                          // return Text( ?? "");
                        },
                        separatorBuilder: (context, index) {
                          return Container();
                        },
                      )
                    : const Center(child: Text("Start you conversation here")),
          ),
        );
      });
    });
  }
}
