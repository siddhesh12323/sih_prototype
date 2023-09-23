import 'package:flutter/material.dart';

class ExpertChatHome extends StatefulWidget {
  const ExpertChatHome({super.key});

  @override
  State<ExpertChatHome> createState() => _ExpertChatHomeState();
}

class _ExpertChatHomeState extends State<ExpertChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Expert Chat Home'),
    ));
  }
}
