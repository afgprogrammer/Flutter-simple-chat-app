library data;

import 'package:day60/models/story/story.dart';
import 'package:day60/models/user/user.dart';

User getUser() {
  return User(
    id: 1,
    name: 'Olivia',
    email: '',
    stories: [
      Story(url: 'https://images.unsplash.com/photo-1554080353-a576cf803bda?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8cGhvdG9ncmFwaHl8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'),
      Story(url: 'https://images.unsplash.com/photo-1622281587418-f2f4fc06ae7a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cG9ydGFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60'),
      Story(url: 'https://images.unsplash.com/photo-1552233707-a3185320d9a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHBob3RvZ3JhcGh5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'),
      Story(url: 'https://images.unsplash.com/photo-1516756587022-7891ad56a8cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjZ8fHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60')
    ],
    profile: 'https://images.pexels.com/photos/1855582/pexels-photo-1855582.jpeg?auto=compress&cs=tinysrgb&crop=faces&fit=crop&h=200&w=200',
  );
}
