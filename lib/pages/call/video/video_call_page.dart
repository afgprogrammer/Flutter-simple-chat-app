import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:day60/models/chat/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class VideoCallPage extends HookWidget {
  VideoCallPage({Key? key}) : super(key: key);

  final String image = 'https://images.unsplash.com/photo-1627087820883-7a102b79179a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final Chat chat = ModalRoute.of(context)!.settings.arguments as Chat;

    return Scaffold(
      backgroundColor: Colors.black,
      // body: SafeArea(
      //   child: Container(
      //     height: double.infinity,
      //     width: double.infinity,
      //     padding: EdgeInsets.symmetric(horizontal: 8),
      //     child: Column(
      //       children: [
      //         Expanded(
      //           child: Container(
      //             width: double.infinity,
      //             clipBehavior: Clip.hardEdge,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(16)
      //             ),
      //             child: CachedNetworkImage(
      //               imageUrl: image,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 16,),
      //         Expanded(
      //           child: Container(
      //             width: double.infinity,
      //             clipBehavior: Clip.hardEdge,
      //             decoration: BoxDecoration(
      //               borderRadius: BorderRadius.circular(16)
      //             ),
      //             child: CachedNetworkImage(
      //               imageUrl: chat.user.profile,
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //         SizedBox(height: 20,),
      //         Row(
      //           children: [
      //             MaterialButton(
      //               onPressed: () {},
      //               color: Colors.grey.shade700,
      //               child: Icon(Icons.videocam, color: Colors.white,),
      //             )
      //           ],
      //         ),
      //         SizedBox(height: 20,),
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: CachedNetworkImageProvider(chat.user.profile),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(1),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0),
                ]
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    AvatarGlow(
                      startDelay: Duration(milliseconds: 0),
                      glowColor: Colors.white,
                      endRadius: 80,
                      duration: Duration(milliseconds: 2000),
                      repeatPauseDuration: Duration(milliseconds: 0),
                      showTwoGlows: true,
                      repeat: true,
                      child: Container(
                        width: 100,
                        height: 100,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 10),
                            ),
                          ]
                        ),
                        child: CachedNetworkImage(
                          imageUrl: chat.user.profile,
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(chat.user.name, style: theme.textTheme.headline5?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Calling', style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade200)),
                        DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                          child: AnimatedTextKit(
                            animatedTexts: [
                              TyperAnimatedText('.....', speed: Duration(milliseconds: 500)),
                            ],
                            isRepeatingAnimation: true,
                            repeatForever: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80),
                  ),
                  padding: EdgeInsets.zero,
                  minWidth: 70,
                  height: 70 ,

                  child: Icon(Icons.call_end, color: Colors.white, size: 30),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
