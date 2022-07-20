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
        name: 'Olivia',
        profile: 'https://images.pexels.com/photos/1855582/pexels-photo-1855582.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
          createdAt: '2:30 PM',
        ),
        Message(
          id: 2,
          text: 'Hey, How are you?',
          isMe: true,
          createdAt: '2:31 PM',
        ),
        Message(
          id: 3,
          text: 'I am fine',
          isMe: false,
          createdAt: '2:32 PM',
        ),
        Message(
          id: 4,
          text: 'And you?',
          isMe: false,
          createdAt: '2:33 PM',
        ),
        Message(
          id: 5,
          text: 'I am fine too',
          isMe: true,
          createdAt: '2:34 PM',
        ),
        Message(
          id: 6,
          text: 'Did you finished the task?',
          isMe: true,
          createdAt: '2:35 PM',
        ),
        Message(
          id: 7,
          text: 'ahh, I finished it',
          isMe: false,
          createdAt: '2:36 PM',
        ),
        Message(
          id: 8,
          text: 'no, I am still working on it',
          isMe: false,
          createdAt: '2:37 PM',
        ),
        Message(
          id: 9,
          text: 'maybe you can help me 🥹',
          isMe: false,
          createdAt: '2:38 PM',
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
        name: 'Emma',
        profile: 'https://images.pexels.com/photos/1758845/pexels-photo-1758845.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
          createdAt: '2:30 PM',
        ),
        Message(
          id: 2,
          text: 'How are you?',
          isMe: true,
          createdAt: '2:31 PM',
        ),
        Message(
          id: 3,
          text: 'I am fine',
          isMe: false,
          createdAt: '2:32 PM',
        ),
      ],
    ),
    Chat(
      id: 3,
      unReadCount: 0,
      lastMessageAt: "05:30 AM",
      user: User(
        id: 2,
        email: "blalb@gmail.com",
        name: 'Alex',
        profile: 'https://images.unsplash.com/photo-1503593245033-a040be3f3c82?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=ca8c652b62b1f14c9c4c969289a8b33c',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
          createdAt: '2:30 PM',
        ),
        Message(
          id: 2,
          text: 'How are you?',
          isMe: true,
          createdAt: '2:31 PM',
        ),
        Message(
          id: 3,
          text: 'great',
          isMe: false,
          createdAt: '2:32 PM',
        ),
      ],
    ),
    Chat(
      id: 4,
      unReadCount: 0,
      lastMessageAt: "03:30 PM",
      user: User(
        id: 2,
        email: "blalb@gmail.com",
        name: 'Amelia',
        profile: 'https://images.unsplash.com/photo-1502033303885-c6e0280a4f5c?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=9be99762d86ae47ab59690f72d984be6',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
          createdAt: '2:30 PM',
        ),
        Message(
          id: 2,
          text: 'How are you?',
          isMe: true,
          createdAt: '2:31 PM',
        ),
        Message(
          id: 3,
          text: 'ok, cool 😀',
          isMe: false,
          createdAt: '2:32 PM',
        ),
      ],
    ),
    Chat(
      id: 5,
      unReadCount: 0,
      lastMessageAt: "00:30 AM",
      user: User(
        id: 2,
        email: "blalb@gmail.com",
        name: 'Ericson',
        profile: 'https://randomuser.me/api/portraits/men/16.jpg',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
          createdAt: '2:30 PM',
        ),
        Message(
          id: 2,
          text: 'How are you?',
          isMe: true,
          createdAt: '2:31 PM',
        ),
        Message(
          id: 3,
          text: 'bro, did you take the test?',
          isMe: false,
          createdAt: '2:32 PM',
        ),
      ],
    ),
    Chat(
      id: 6,
      unReadCount: 0,
      lastMessageAt: "00:30 AM",
      user: User(
        id: 2,
        email: "blalb@gmail.com",
        name: 'Izaak',
        profile: 'https://images.unsplash.com/photo-1505503693641-1926193e8d57?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=3422df4a46d2c81c35bf4687a2fa9c52',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
          createdAt: '2:30 PM',
        ),
        Message(
          id: 2,
          text: 'How are you?',
          isMe: true,
          createdAt: '2:31 PM',
        ),
        Message(
          id: 3,
          text: 'bro, did you take the test?',
          isMe: false,
          createdAt: '2:32 PM',
        ),
      ],
    ),
    Chat(
      id: 7,
      unReadCount: 0,
      lastMessageAt: "01:30 AM",
      user: User(
        id: 2,
        email: "blalb@gmail.com",
        name: 'Sophia',
        profile: 'https://images.pexels.com/photos/590415/pexels-photo-590415.jpeg?h=350&auto=compress&cs=tinysrgb',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
          createdAt: '2:30 PM',
        ),
        Message(
          id: 2,
          text: 'How are you?',
          isMe: true,
          createdAt: '2:31 PM',
        ),
        Message(
          id: 3,
          text: '❤️',
          isMe: false,
          createdAt: '2:32 PM',
        ),
      ],
    ),
    Chat(
      id: 8,
      unReadCount: 0,
      lastMessageAt: "yesterday",
      user: User(
        id: 2,
        email: "blalb@gmail.com",
        name: 'Mia',
        profile: 'https://api.uifaces.co/our-content/donated/AVQ0V28X.jpg',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
          createdAt: '2:30 PM',
        ),
        Message(
          id: 2,
          text: 'How are you?',
          isMe: true,
          createdAt: '2:31 PM',
        ),
        Message(
          id: 3,
          text: 'I am really happy to see you 😀',
          isMe: false,
          createdAt: '2:32 PM',
        ),
      ],
    ),
    Chat(
      id: 8,
      unReadCount: 0,
      lastMessageAt: "yesterday",
      user: User(
        id: 2,
        email: "blalb@gmail.com",
        name: 'Ava',
        profile: 'https://images.pexels.com/photos/247206/pexels-photo-247206.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200',
      ),
      messages: [
        Message(
          id: 1,
          text: 'Hello',
          isMe: false,
          createdAt: '2:30 PM',
        ),
        Message(
          id: 2,
          text: 'How are you?',
          isMe: true,
          createdAt: '2:31 PM',
        ),
        Message(
          id: 3,
          text: 'I am really happy to see you 😀',
          isMe: false,
          createdAt: '2:32 PM',
        ),
      ],
    ),
  ];
}
