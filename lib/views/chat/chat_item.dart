import 'package:dapperz/common_methods.dart';
import 'package:dapperz/models/chat/chat_conversation_model.dart' as ccm;
import 'package:dapperz/user_singleton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as intl;

class ChatItem extends StatelessWidget {
  final ccm.Data? message;

  const ChatItem({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      textDirection: UserSingleton().userId == message!.sender.toString()
          ? TextDirection.rtl
          : TextDirection.ltr,
      children: <Widget>[
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: size.width * 0.6),
          child: Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(top: 3, bottom: 3),
            decoration: BoxDecoration(
              color: UserSingleton().userId == message!.sender.toString()
                  ? appCtrl.appTheme.primary
                  : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(25),
                topRight: const Radius.circular(25),
                bottomLeft: UserSingleton().userId == message!.sender.toString()
                    ? const Radius.circular(25)
                    : const Radius.circular(0),
                bottomRight:
                    !(UserSingleton().userId == message!.sender.toString())
                        ? const Radius.circular(25)
                        : const Radius.circular(0),
              ),
            ),
            child: Column(
              children: [
                Text.rich(
                  TextSpan(
                    text: message!.content!,
                    style: GoogleFonts.mulish(
                      color: Colors.black87,
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <InlineSpan>[
                      TextSpan(
                        text:
                            "  ${intl.DateFormat.Hm().format(getDate(message!.timestamp!)).trim()}",
                        style: GoogleFonts.mulish(
                          color: Colors.black87,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  DateTime getDate(String dateString) {
    DateTime parsedDateTime = DateTime.parse(dateString);
    return parsedDateTime;
  }
}
