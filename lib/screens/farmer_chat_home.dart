import 'package:flutter/material.dart';

class FarmerChatHome extends StatefulWidget {
  const FarmerChatHome({super.key});

  @override
  State<FarmerChatHome> createState() => _FarmerChatHomeState();
}

class _FarmerChatHomeState extends State<FarmerChatHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text('Farmer Chat Home'),
    ));
  }
}
