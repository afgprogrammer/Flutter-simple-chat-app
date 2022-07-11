import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  // create a list of messages
  List<String> messages = [
    'Hello',
    'How are you?',
    'I am fine',
    'Hey copilot',
    'I am fine',
    'What about you?',
    'I am fine, Thank you',
    'man, where are you? I miss you so much? why didn\'t you call me?'
    'ah, sorry man I was so busy with my new job, I hope you could forgive me!'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.shade200,
              ),
              child: Center(child: Icon(Icons.person, color: Colors.grey.shade700,)),
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Mohammad', style: theme.textTheme.headline6),
                Text('last seen yesterday at 21:05', style: theme.textTheme.bodySmall),
              ],
            ),
          ],
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
            padding: EdgeInsets.symmetric(vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (int i = 0; i < messages.length; i++)
                    MessageItem(
                      isMe: i % 2 == 0,
                      message: messages[i],
                      time: '21:05',
                    ),
                ],
              ),
            ),
            
            // child: ListView.builder(
            //   itemCount: 20,
            //   itemBuilder: (context, index) {
            //     return MessageItem(
            //       isMe: index % 2 == 0,
            //       message: 'Hello, how are you?',
            //       time: '21:05',
            //     );
            //   },
            // ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Card(
              margin: EdgeInsets.zero,
              // padding: EdgeInsets.only(right: 16, left: 16, bottom: 32, top: 5),
              // decoration: BoxDecoration(
              //   color: Colors.white
              // ),
              child: Padding(
                padding: EdgeInsets.only(right: 8, left: 8, bottom: 28, top: 5),
                child: Row(
                  children: [
                    IconButton(
                      splashRadius: 20,
                      icon: Icon(Icons.add, color: Colors.grey.shade700, size: 28,),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(right: 8, left: 16, bottom: 0, top: 0),
                            hintStyle: TextStyle(fontSize: 14, color: Colors.grey.shade700),
                            hintText: 'Type a message',
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              gapPadding: 0,
                              borderSide: BorderSide(color: Colors.grey.shade200),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              gapPadding: 0,
                              borderSide: BorderSide(color: Colors.blue.shade200),
                            )
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          splashRadius: 20,
                          icon: Icon(Icons.mic, color: Colors.grey.shade700,),
                          onPressed: () {},
                        ),
                        IconButton(
                          splashRadius: 20,
                          icon: Icon(Icons.attach_file, color: Colors.grey.shade700,),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    IconButton(
                      splashRadius: 20,
                      icon: Icon(Icons.send, color: Colors.grey.shade700,),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
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
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(right: 8, bottom: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xff1972F5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(message, maxLines: 1, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodyText2?.copyWith(color: Colors.white)),
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

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isMe ? Colors.grey.shade200 : Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isMe ? Colors.grey.shade500 : Colors.grey.shade200,
              ),
              child: Center(child: Icon(Icons.person, color: Colors.grey.shade700,)),
            ),
          SizedBox(width: 10,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(message, style: theme.textTheme.bodyText1),
                Text(time, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          if (isMe)
            Container(
              width: 40,
              height: 40,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: isMe ? Colors.grey.shade300 : Colors.grey.shade200,
              ),
              child: Center(child: Icon(Icons.person, color: Colors.grey.shade700,)),
            ),
        ],
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isMe ? Colors.grey.shade200 : Colors.grey.shade300,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message, style: theme.textTheme.bodyText1),
          SizedBox(height: 5,),
          Text(time, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
