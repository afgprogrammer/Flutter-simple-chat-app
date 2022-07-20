import 'package:day60/models/message/message.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final Message message;
  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (message.isMe) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 250
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff1972F5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(message.text!, style: theme.textTheme.bodyText2?.copyWith(color: Colors.white)),
                SizedBox(height: 4,),
                Text(message.createdAt, style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade300)),
              ],
            ),
          ),
        ],
      );
    } else {
      return Row(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 250
            ),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(left: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color.fromARGB(255, 225, 231, 236),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message.text!, style: theme.textTheme.bodyText2),
                SizedBox(height: 4,),
                Text(message.createdAt, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      );
    }
  }
}
