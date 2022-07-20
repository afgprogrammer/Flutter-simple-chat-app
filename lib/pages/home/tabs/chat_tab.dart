import 'package:day60/data/chat.dart';
import 'package:day60/pages/home/tabs/components/chat_widget.dart';
import 'package:day60/pages/home/tabs/components/story_list.dart';
import 'package:day60/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  final chats = getChats();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.lightBackgroundColor,
        elevation: 0,
        title: Text('Chat', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),),
        centerTitle: false,
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(Iconsax.search_normal_1, color: Colors.black, size: 22,),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            StoryList(),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Chats", style: theme.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),),
            ),
              Column(
                children: chats.map((e) => Column(
                  children: [
                    ChatWidget(chat: e),
                    chats.indexOf(e) != chats.length - 1 ? Divider(indent: 80, height: 1, endIndent: 16,) : SizedBox(),
                  ],
                )).toList(),
              ),
          ],
        ),
      ),
    );  
  }
}
