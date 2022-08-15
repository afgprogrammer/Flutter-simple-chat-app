import 'package:day60/pages/call/video/video_call_page.dart';
import 'package:day60/pages/home/home_page.dart';
import 'package:day60/pages/message_page.dart';
import 'package:day60/pages/story/story_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    routes: {
      '/message': (context) => MessagePage(),
      '/story': (context) => StoryPage(),
      '/video-call':(context) => VideoCallPage(),
    },
  ));
}
