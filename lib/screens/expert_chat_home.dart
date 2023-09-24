import 'package:flutter/material.dart';
import 'package:sih_prototype/presentation/utils.dart';
import 'package:sih_prototype/screens/expert_chat_page.dart';
import 'package:sih_prototype/screens/farmer_chat_page.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class ExpertChatHome extends StatefulWidget {
  const ExpertChatHome({super.key});

  @override
  State<ExpertChatHome> createState() => _ExpertChatHomeState();
}

class _ExpertChatHomeState extends State<ExpertChatHome> {
  Widget chatWidget(Color profileBackgroundColor, String name, String message) {
    return Container(
      height: 70,
      color: Colors.grey.shade100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: profileBackgroundColor,
            child: Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
          sizedBox(0, 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                    fontSize: 20,
                  )),
              Text(message,
                  style: TextStyle(
                    fontSize: 14,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        automaticallyImplyLeading: false, // hides leading widget
        title: Text('Chats', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/profilepage');
            },
            child: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
          ),
          sizedBox(0, 10)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExpertChatPage(
                                  userName: 'Viay',
                                  userMessage: 'Hello',
                                  profileBackgroundColor: Colors.amber,
                                )));
                  },
                  child: chatWidget(Colors.amber, 'Vijay', 'Hello')),
              Utils().verticalDivider(),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ExpertChatPage(
                                  userName: 'Rakesh',
                                  userMessage: 'Hello',
                                  profileBackgroundColor: Colors.redAccent,
                                )));
                  },
                  child: chatWidget(Colors.redAccent, 'Rakesh', 'Hello')),
            ],
          ),
        ),
      ),
    );
  }
}
