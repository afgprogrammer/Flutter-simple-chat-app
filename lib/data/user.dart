library data;

import 'package:day60/models/story/story.dart';
import 'package:day60/models/user/user.dart';

User getUser() {
  return User(
    id: 1,
    name: 'Olivia',
    email: '',
    stories: [
      Story(url: 'https://images.unsplash.com/photo-1658121901015-6de110fb0653?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDV8NnNNVmpUTFNrZVF8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=60'),
      Story(url: 'https://images.unsplash.com/photo-1658171402485-d7b2d4d776db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDE0fDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
      Story(url: 'https://images.unsplash.com/photo-1657904433191-02608d17b567?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMzfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
      Story(url: 'https://images.unsplash.com/photo-1657918225993-93320b8533e0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDMyfDZzTVZqVExTa2VRfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=800&q=60')
    ],
    profile: 'https://images.pexels.com/photos/1855582/pexels-photo-1855582.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200',
  );
}
