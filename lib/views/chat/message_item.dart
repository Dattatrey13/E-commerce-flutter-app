//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
//
// class MessageItem extends StatelessWidget {
//   final cm.Friends? message;
//
//   const MessageItem({Key? key, this.message}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Stack(
//             children: [
//               Container(
//                 width: 45.0,
//                 height: 45.0,
//                 decoration: BoxDecoration(
//                   color: Colors.transparent,
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image.network(
//                     message!.profileUrl!,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               message!.isOnline!
//                   ? Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: Container(
//                         width: 12.0,
//                         height: 12.0,
//                         decoration: BoxDecoration(
//                           color: Colors.green,
//                           borderRadius: BorderRadius.circular(15),
//                           border: Border.all(
//                             color: Colors.white,
//                             width: 1.5,
//                           ),
//                         ),
//                       ),
//                     )
//                   : const SizedBox(),
//             ],
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   message!.username!,
//                   style: GoogleFonts.mulish(
//                     color: Colors.black87,
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//                 const SizedBox(height: 3),
//                 Text(
//                   message!.lastMessage ?? "",
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: GoogleFonts.mulish(
//                     color: Colors.black45,
//                     fontSize: 13.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 const SizedBox(height: 3),
//                 Text(
//                   message!.lastMessageTime == null || message!.lastMessageTime == ""
//                       ? ""
//                       : getTimeDifferenceFromNow(message!.lastMessageTime.toString()),
//                   style: GoogleFonts.mulish(
//                     color: Colors.black26,
//                     fontSize: 13.0,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(width: 10),
//           message!.totalMessage!.toInt() <= 0
//               ? const SizedBox()
//               : Container(
//                   width: 30.0,
//                   height: 30.0,
//                   decoration: BoxDecoration(
//                     color: appCtrl.appTheme.primary,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Center(
//                     child: Text(
//                       message!.totalMessage!.toString(),
//                       style: GoogleFonts.mulish(
//                         color: Colors.white,
//                         fontSize: 13.0,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 )
//         ],
//       ),
//     );
//   }
//
//   String getTimeDifferenceFromNow(String inputString) {
//     DateTime dateTime = DateTime.parse(inputString);
//     Duration difference = DateTime.now().difference(dateTime);
//     if (difference.inSeconds < 5) {
//       return "Just now";
//     } else if (difference.inMinutes < 1) {
//       return "${difference.inSeconds}s ago";
//     } else if (difference.inHours < 1) {
//       return "${difference.inMinutes}m ago";
//     } else if (difference.inHours < 24) {
//       return "${difference.inHours}h ago";
//     } else if (difference.inDays <= 5) {
//       return "${difference.inDays}d ago";
//     } else {
//       String dateParse = DateFormat.yMMMEd().format(dateTime);
//       return dateParse;
//     }
//   }
// }
