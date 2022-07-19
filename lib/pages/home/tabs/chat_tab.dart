import 'package:day60/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ChatTab extends StatefulWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  State<ChatTab> createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.lightBackgroundColor,
        elevation: 0,
        title: Text('Chat', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.w700),),
        centerTitle: false,
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(Iconsax.search_normal, color: Colors.black, size: 22,),
            onPressed: () {},
          ),
        ],
      ),
    );  
  }
}
