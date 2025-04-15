import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:dapperz/api/api_config.dart';
import 'package:dapperz/api/api_method_list.dart';
import 'package:dapperz/api/api_service_call.dart';
import 'package:dapperz/api/base_api_call.dart';
import 'package:dapperz/common_methods.dart';
import 'package:dapperz/config.dart';
import 'package:dapperz/models/chat/chat_conversation_model.dart' as ccm;
import 'package:dapperz/models/chat/chat_conversation_model.dart';
import 'package:dapperz/user_singleton.dart';
import 'package:dapperz/views/chat/blurry_container.dart';
import 'package:dapperz/views/chat/chat_item.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:web_socket_channel/io.dart';

class ChatScreen extends StatefulWidget {
  final String? id;
  final String? name;

  const ChatScreen({Key? key, this.id, this.name}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController etMessage = TextEditingController();
  ScrollController controller = ScrollController();
  BaseApi apiCall = ApiServiceCall();
  ChatConversationModel? chatConversationModel;
  IOWebSocketChannel? channel;

  bool isLoading = true;
  String id = "";
  String name = "";

  @override
  void initState() {
    super.initState();
    id = widget.id ?? "";
    name = widget.name ?? "";
    channel = IOWebSocketChannel.connect(
      Uri.parse(
          'wss://${ApiConfig.baseDomain}/ws/chat/$id/?token=${UserSingleton().token}'),
    );
    subscribeViewModel();
    Future.delayed(const Duration(milliseconds: 100), () {
      getConversation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0)),
              ),
              padding: const EdgeInsets.only(
                  bottom: 15, left: 15, right: 15, top: 5),
              child: SafeArea(
                bottom: false,
                child: Row(
                  children: [
                    const BackButton(),
                    const SizedBox(width: 10),
                    Text(
                      name ?? "",
                      style: GoogleFonts.mulish(
                          color: Colors.black87,
                          fontSize: 14.5,
                          fontWeight: FontWeight.w700),
                    ),
                    // const Spacer(),
                    // PopupMenuButton<int>(
                    //   icon: const Icon(
                    //     Icons.more_vert,
                    //   ), //use this icon
                    //   onSelected: (int item) {
                    //     showDialog(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: const Text('Warning'),
                    //             content: const Text('Do you want to delete conversation ?'),
                    //             shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    //             actions: [
                    //               TextButton(
                    //                 onPressed: () {
                    //                   Get.back();
                    //                 },
                    //                 child: const Text('No'),
                    //               ),
                    //               TextButton(
                    //                 onPressed: () {
                    //                   showProgressDialog(true);
                    //                   chatVm.clearMessage(widget.chat!.userId.toString());
                    //                 },
                    //                 child: const Text('Yes'),
                    //               ),
                    //             ],
                    //           );
                    //         });
                    //   },
                    //   itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
                    //     const PopupMenuItem<int>(
                    //       value: 1,
                    //       child: Text('Clear Conversation', style: TextStyle(fontSize: 13)),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: isLoading
                  ? const Center(
                      child: CircularProgressIndicator(strokeWidth: 3))
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        children: [
                          Expanded(
                            child: GroupedListView<ccm.Data, DateTime>(
                                controller: controller,
                                padding: const EdgeInsets.all(8),
                                elements: chatConversationModel!.data!,
                                sort: false,
                                order: GroupedListOrder.DESC,
                                floatingHeader: true,
                                groupBy: (ccm.Data element) => DateTime(
                                    getDate(element.timestamp!).year,
                                    getDate(element.timestamp!).month,
                                    getDate(element.timestamp!).day),
                                groupHeaderBuilder: (ccm.Data message) =>
                                    SizedBox(
                                      height: 40,
                                      child: Center(
                                        child: Card(
                                          color: Theme.of(context).primaryColor,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              DateFormat.yMMMd()
                                                  .format(getDate(
                                                      message.timestamp!))
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                itemBuilder: (context, ccm.Data element) =>
                                    Align(
                                        alignment: Alignment.center,
                                        child: ChatItem(message: element))),
                          ),
                        ],
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 15.0, left: 15, right: 15, top: 8),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlurryContainer(
                    blur: 10.0,
                    bgColor: Colors.black,
                    width: MediaQuery.of(context).size.width - 100,
                    child: TextFormField(
                      controller: etMessage,
                      maxLines: 3,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(0),
                        hintText: 'Message..',
                        hintStyle: GoogleFonts.mulish(
                          color: Colors.white70,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                        isDense: true,
                        border: InputBorder.none,
                      ),
                      style: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        channel!.sink.add(
                          jsonEncode(
                            {
                              "receiver_id": id,
                              "message": etMessage.text.trim(),
                              "user_id": UserSingleton().userId,
                            },
                          ),
                        );
                        String utcTime =
                            localToUtcTimeZoneDateTimeApiFormat(DateTime.now());
                        chatConversationModel!.data!.add(
                          ccm.Data(
                            id: 0,
                            content: etMessage.text.trim(),
                            sender: int.parse(UserSingleton().userId!),
                            recipient: int.parse(id),
                            timestamp: utcTime,
                          ),
                        );
                        etMessage.text = "";
                        FocusScope.of(context).unfocus();
                        Future.delayed(const Duration(milliseconds: 100), () {
                          scrollDown();
                        });
                      },
                      child: BlurryContainer(
                        width: 50.0,
                        height: 50.0,
                        blur: 15.0,
                        bgColor: appCtrl.appTheme.primary,
                        padding: const EdgeInsets.all(0),
                        child: const Icon(FontAwesomeIcons.solidPaperPlane,
                            color: Colors.black, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getConversation() async {
    try {
      isLoading = true;
      dynamic response =
          await apiCall.getResponse("${ApiMethodList.getConversation}$id/");
      chatConversationModel = ChatConversationModel.fromJson(response);
      setState(() {});
      isLoading = false;
      Future.delayed(const Duration(milliseconds: 100), () {
        if (chatConversationModel != null &&
            chatConversationModel!.message!.isNotEmpty) {
          scrollDown();
        }
      });
      setState(() {});
    } catch (e) {
      rethrow;
    }
  }

  void scrollDown() {
    controller.jumpTo(controller.position.maxScrollExtent);
  }

  DateTime getDate(String inputDate) {
    final dateFormat = DateFormat('yy-MM-dd');
    final dateTime = dateFormat.parse(inputDate);
    return dateTime;
  }

  String localToUtcTimeZoneDateTimeApiFormat(DateTime givenTime) {
    DateFormat formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss");
    String formattedDate = formatter.format(givenTime);
    return formattedDate;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void subscribeViewModel() {
    channel!.stream.listen(
      (data) {
        ccm.Data? temp = ccm.Data.fromJson(jsonDecode(data));

        if (chatConversationModel != null &&
            chatConversationModel!.data!.isNotEmpty) {
          chatConversationModel!.data!.last.setId = temp.id ?? 0;
        }

        sendNotificationFCM(
          "flwi-tOOTca5gEaK3I9pCm:APA91bFLVxv8In5O6cRUqO7Se4BZtPZKcV3On_HkrTwjTqlAOpWShCnZfKYmQ5eVn_SdMKCohVMXK_PeY9HmUAblI1GLyX-6gC0u6VmOSCRlg6q1tTOwydJAyCYsHUdadLgfkkYQrKQ0",
          widget.id!,
          widget.name!,
          chatConversationModel!.data!.last.content ?? "",
        );

        if (etMessage.text.isNotEmpty) {
          etMessage.text = "";
        }
        setState(() {});
      },
      onError: (error) {
        Fluttertoast.showToast(msg: 'Unable to send message');
        if (chatConversationModel != null &&
            chatConversationModel!.data!.isNotEmpty) {
          chatConversationModel!.data!.removeLast();
        }
      },
    );
  }

  void sendNotificationFCM(
      String token, String id, String name, String body) async {
    try {
      HashMap<String, dynamic> params = HashMap();
      params['token'] = token;
      HashMap<String, dynamic> dataParams = HashMap();
      dataParams['id'] = id;
      dataParams['name'] = name;
      params['data'] = dataParams;
      HashMap<String, dynamic> notificationParams = HashMap();
      notificationParams['title'] = name;
      notificationParams['body'] = body;
      params['notification'] = notificationParams;
      dynamic response =
          await apiCall.postRequest(ApiMethodList.sendFcmToken, params);
      // chatConversationModel = ChatConversationModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
