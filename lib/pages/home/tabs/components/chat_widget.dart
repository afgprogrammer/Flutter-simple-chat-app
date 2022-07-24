import 'package:cached_network_image/cached_network_image.dart';
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
      onTap: () {
        var chat = widget.chat.copy();
            chat.messages = chat.messages.reversed.toList();

        Navigator.pushNamed(context, '/message', arguments: chat);
      },
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey.shade300,
        backgroundImage: CachedNetworkImageProvider(widget.chat.user.profile),
      ),
      title: Text(widget.chat.user.name, style: theme.textTheme.subtitle1?.copyWith(fontSize: 16, fontWeight: FontWeight.bold),),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      subtitle: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Text(widget.chat.messages.last.text!, style: theme.textTheme.bodyText2?.copyWith(color: Colors.blueGrey.shade400),),
      ),
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
