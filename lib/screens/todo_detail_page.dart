import 'package:flutter/material.dart';

class TodoDetailPage extends StatelessWidget {
  final String title;

  const TodoDetailPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Todo Detail")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(title, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
