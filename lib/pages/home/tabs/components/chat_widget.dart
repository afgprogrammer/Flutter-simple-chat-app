import 'package:day60/models/chat/chat.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatefulWidget {
  final Chat chat;
  const ChatWidget({Key? key, required this.chat}) : super(key: key);

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(widget.chat.user.profile),
      ),
      title: Text(widget.chat.user.name, style: theme.textTheme.subtitle1?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),),
      subtitle: Text(widget.chat.messages.last.text!, style: theme.textTheme.bodyText2?.copyWith(color: Colors.blueGrey.shade400),),
      trailing: widget.chat.unReadCount > 0 ? Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red
            ),
            child: Text(widget.chat.unReadCount.toString(), style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, color: Colors.white),),
          ),
          SizedBox(height: 8,),
          Text(widget.chat.lastMessageAt, style: theme.textTheme.bodyText2?.copyWith(color: Colors.blueGrey.shade300),),
        ],
      ) : Text(widget.chat.lastMessageAt, style: theme.textTheme.bodyText2?.copyWith(color: Colors.blueGrey.shade300),),
    ); 
  }
}
