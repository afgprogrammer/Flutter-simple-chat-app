import 'package:day60/models/chat/chat.dart';
import 'package:day60/models/message/message.dart';
import 'package:day60/pages/home/tabs/components/message_widget.dart';
import 'package:day60/shared/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with AnimationMixin {
  late Chat chat;
  final textController = TextEditingController();
  final _scrollController = ScrollController();

  late Animation<double> opacity;
  late AnimationController slideInputController;
  late Animation<Offset> slideInputAnimation;

  var isVisible = true;

  @override
  void initState() {
    slideInputController = createController()..duration = Duration(milliseconds: 500);

    slideInputAnimation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(-2, 0),
    ).animate(slideInputController);

    opacity = Tween<double>(begin: 1, end: 0).animate(controller);
    controller.duration = Duration(milliseconds: 200);

    super.initState();
  }

  addToMessages(String text) {
    setState(() {
      chat.messages.insert(0, Message(
        id: chat.messages.length + 1,
        text: text,
        createdAt: 'Just now',
        isMe: true,
      ));
    });
  }

  hideTheMic() {
    controller.play();
    controller.addStatusListener((status) {
      setState(() {
        if (status == AnimationStatus.completed && isVisible) {
          isVisible = false;
        }
      });
    });
  }

  showTheMic() {
    isVisible = true;
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    chat = ModalRoute.of(context)!.settings.arguments as Chat;

    return Scaffold(
      backgroundColor: ColorConstants.lightBackgroundColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: ListTile(
          onTap: () {},
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              chat.user.profile,
            ),
          ),
          title: Text(chat.user.name, style: theme.textTheme.headline6),
          subtitle: Text('last seen yesterday at 21:05', style: theme.textTheme.bodySmall),
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(Icons.videocam, color: Colors.grey.shade700,),
            onPressed: () {
              Navigator.pushNamed(context, '/video-call', arguments: chat);
            },
          ),
          IconButton(
            splashRadius: 20,
            icon: Icon(Icons.phone, color: Colors.grey.shade700,),
            onPressed: () {},
          ),
        ],
      ),
      // a message list
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Column(
              children: [
                Expanded(
                  child: chat.messages.length > 0 ? ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    itemCount: chat.messages.length,
                    itemBuilder: (context, index) {
                      return MessageWidget(
                        message: chat.messages[index],
                      );
                    },
                  ) : Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat, size: 80, color: Colors.grey.shade400,),
                          SizedBox(height: 20,),
                          Text('No messages yet', style: theme.textTheme.bodyText2,),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.only(right: 8, left: 8, bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 15 : 28, top: 8),
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                child: SlideTransition(
                                  position: slideInputAnimation,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        splashRadius: 20,
                                        icon: Icon(Icons.add, color: Colors.grey.shade700, size: 28,),
                                        onPressed: () {},
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: TextField(
                                            controller: textController,
                                            minLines: 1,
                                            maxLines: 5,
                                            cursorColor: Colors.black,
                                            decoration: InputDecoration(
                                              isDense: true,
                                              contentPadding: EdgeInsets.only(right: 16, left: 20, bottom: 10, top: 10),
                                              hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                                              hintText: 'Type a message',
                                              border: InputBorder.none,
                                              filled: true,
                                              fillColor: Colors.grey.shade100,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                gapPadding: 0,
                                                borderSide: BorderSide(color: Colors.grey.shade200),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                                gapPadding: 0,
                                                borderSide: BorderSide(color: Colors.grey.shade300),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              if (value.length > 0) {
                                                hideTheMic();
                                              } else {
                                                showTheMic();
                                              }
                                            },
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Visibility(
                                    visible: isVisible,
                                    child: FadeTransition(
                                      opacity: opacity,
                                      child: IconButton(
                                        splashRadius: 20,
                                        icon: Icon(Icons.mic, color: Colors.grey.shade700,),
                                        onPressed: () {
                                          slideInputController.play();
                                        },
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    splashRadius: 20,
                                    icon: Icon(Icons.send, color: isVisible ? Colors.grey.shade700 : Colors.blue,),
                                    onPressed: () {
                                      if (textController.text.length > 0) {
                                        addToMessages(textController.text);
                                        textController.clear();
                                        showTheMic();
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
