import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  final String username;

  const UserPage({this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username),
      ),
    );
  }
}
