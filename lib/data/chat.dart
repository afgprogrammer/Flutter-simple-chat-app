library data;

import 'package:day60/models/chat/chat.dart';
import 'package:day60/models/message/message.dart';
import 'package:day60/models/user/user.dart';

List<Chat> getChats() {
  return [
    Chat(
      id: 1,
      unReadCount: 3,
      lastMessageAt: "2:30 PM",
      user: User(
        id: 1,
        email: "blalb@gmail.com",
        name: 'John Doe',
        profile: 'https://images.pexels.com/photos/1855582/pexels-photo-1855582.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
        ),
        Message(
          id: 2,
          text: 'Hey, How are you?',
          isMe: true,
        ),
        Message(
          id: 3,
          text: 'I am fine',
          isMe: false,
        ),
        Message(
          id: 4,
          text: 'And you?',
          isMe: false,
        ),
        Message(
          id: 5,
          text: 'I am fine too',
          isMe: true,
        ),
        Message(
          id: 6,
          text: 'Did you finished the task?',
          isMe: true,
        ),
        Message(
          id: 7,
          text: 'ahh, I finished it',
          isMe: false,
        ),
        Message(
          id: 8,
          text: 'no, I am still working on it',
          isMe: false,
        ),
        Message(
          id: 9,
          text: 'maybe you can help me',
          isMe: false,
        ),
      ],
    ),
    Chat(
      id: 2,
      unReadCount: 1,
      lastMessageAt: "10:30 PM",
      user: User(
        id: 2,
        email: "blalb@gmail.com",
        name: 'John Doe',
        profile: 'https://images.pexels.com/photos/1758845/pexels-photo-1758845.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
        ),
        Message(
          id: 2,
          text: 'How are you?',
          isMe: true,
        ),
        Message(
          id: 3,
          text: 'I am fine',
          isMe: false,
        ),
      ],
    ),
  ];
}
