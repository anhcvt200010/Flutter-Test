import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final String title, content;
  final String followPage;

  NotificationWidget({required this.title, required this.content, required this.followPage});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: Text(this.content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/login');
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}