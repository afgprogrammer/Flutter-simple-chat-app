import 'package:flutter/material.dart';

class UserTab extends StatefulWidget {
  const UserTab({Key? key}) : super(key: key);

  @override
  State<UserTab> createState() => _UserTabState();
}

class _UserTabState extends State<UserTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('User Tab'),
      ),
    );    
  }
}
