import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> with AnimationMixin {
  final textController = TextEditingController();
  final _scrollController = ScrollController();
  
  // create a list of messages
  List<String> messages = [
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
    'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs',
  ];

  late Animation<double> opacity;
  var isVisible = true;

  @override
  void initState() {
    opacity = Tween<double>(begin: 1, end: 0).animate(controller);
    controller.duration = Duration(milliseconds: 200);

    // controller.play(); // start the animation playback

    super.initState();
  }

  addToMessages(String text) {
    setState(() {
      // add to the first of the list
      messages.insert(0, text);
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

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 2,
        centerTitle: false,
        titleSpacing: 0,
        title: ListTile(
          onTap: () {},
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/300',
            ),
          ),
          title: Text('Mohammad', style: theme.textTheme.headline6),
          subtitle: Text('last seen yesterday at 21:05', style: theme.textTheme.bodySmall),
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: Icon(Icons.videocam, color: Colors.grey.shade700,),
            onPressed: () {},
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
                  child: messages.length > 0 ? ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    controller: _scrollController,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return MessageItem(
                        isMe: index % 2 == 0,
                        message: messages[index],
                        time: '21:05',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
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
                          Row(
                            children: [
                              Visibility(
                                visible: isVisible,
                                child: FadeTransition(
                                  opacity: opacity,
                                  child: IconButton(
                                    splashRadius: 20,
                                    icon: Icon(Icons.mic, color: Colors.grey.shade700,),
                                    onPressed: () {},
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

  Widget MessageItem({required bool isMe, required String message, required  String time}) {
    final theme = Theme.of(context);

    if (isMe) {
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
                Text(message, style: theme.textTheme.bodyText2?.copyWith(color: Colors.white)),
                SizedBox(height: 4,),
                Text(time, style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey.shade300)),
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
                Text(message, style: theme.textTheme.bodyText2),
                SizedBox(height: 4,),
                Text(time, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
