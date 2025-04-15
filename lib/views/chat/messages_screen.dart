// import 'dart:async';
//
// import 'package:dapperz/api/status.dart';
// import 'package:dapperz/common_methods.dart';
// import 'package:dapperz/user_singleton.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// class MessagesScreen extends StatefulWidget {
//   const MessagesScreen({super.key});
//
//   @override
//   State<MessagesScreen> createState() => _MessagesScreenState();
// }
//
// class _MessagesScreenState extends State<MessagesScreen> {
//   ChatVm chatVm = ChatVm();
//   List<cm.Friends> chatList = [];
//   int selectedIndex = 0;
//   bool isLoading = true;
//   Timer? timer;
//
//   @override
//   void initState() {
//     super.initState();
//     subscribeViewModel();
//     if (isLoading) {
//       Future.delayed(const Duration(milliseconds: 100), () {
//         showProgressDialog(true);
//         chatVm.chatList();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         title: Text(
//           'Chat',
//           style: GoogleFonts.mulish(
//             fontSize: 16.0,
//             fontWeight: FontWeight.w700,
//             color: Colors.black,
//           ),
//         ),
//         automaticallyImplyLeading: false,
//       ),
//       body: isLoading
//           ? Container()
//           : chatList.isNotEmpty
//               ? ListView.separated(
//                   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         selectedIndex = index;
//                         setState(() {});
//                         showProgressDialog(true);
//                         chatVm.getConversation(chatList[index].userId);
//                       },
//                       child: MessageItem(message: chatList[index]),
//                     );
//                   },
//                   separatorBuilder: (context, index) => const SizedBox(height: 15),
//                   itemCount: chatList.length,
//                 )
//               : const Center(child: Text("You don't have any friends to chat")),
//     );
//   }
//
//   void subscribeViewModel() {
//     chatVm.chatListController.stream.listen((response) async {
//       switch (response.status) {
//         case Status.idle:
//           break;
//         case Status.loading:
//           break;
//         case Status.completed:
//           if (isLoading) {
//             showProgressDialog(false);
//           }
//           chatList.clear();
//           if (response.data != null &&
//               response.data!.data != null &&
//               response.data!.data!.friends != null &&
//               response.data!.data!.friends!.isNotEmpty) {
//             chatList.addAll(response.data!.data!.friends!);
//           }
//           isLoading = false;
//           setState(() {});
//           break;
//         case Status.error:
//           if (isLoading) {
//             showProgressDialog(false);
//           }
//           break;
//       }
//     });
//
//     chatVm.getConversationController.stream.listen((response) async {
//       switch (response.status) {
//         case Status.idle:
//           break;
//         case Status.loading:
//           break;
//         case Status.completed:
//           showProgressDialog(false);
//           timer?.cancel();
//           List<mm.Data>? data = response.data!.data!;
//           data.forEach((value) {
//             if (value.body == null || value.body!.isEmpty) {
//               value.setIsDeleted = true;
//             }
//           });
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ChatScreen(chat: chatList[selectedIndex], message: data)),
//           ).then((value) {
//             isLoading = true;
//             setState(() {});
//             showProgressDialog(context, true);
//             chatVm.chatList();
//           });
//           break;
//         case Status.error:
//           showProgressDialog(context, false);
//           toast(TranslationService.of(context)!.translate("Something Went Wrong!"));
//           break;
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }
// }
