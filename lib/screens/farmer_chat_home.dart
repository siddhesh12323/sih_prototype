import 'package:flutter/material.dart';
import 'package:sih_prototype/presentation/utils.dart';
import 'package:sih_prototype/screens/farmer_chat_page.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class FarmerChatHome extends StatefulWidget {
  const FarmerChatHome({super.key});

  @override
  State<FarmerChatHome> createState() => _FarmerChatHomeState();
}

class _FarmerChatHomeState extends State<FarmerChatHome> {
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
          // sizedBox(10, 0),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: [
          //     Text(
          //       'Time',
          //       style: Theme.of(context).textTheme.bodyText1,
          //     ),
          //     sizedBox(5, 0),
          //     const CircleAvatar(
          //       backgroundColor: Colors.green,
          //       child: Icon(
          //         Icons.check,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ],
          // ),
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
                            builder: (context) => FarmerChatPage(
                                  userName: 'Rahul',
                                  userMessage: 'Hello',
                                  profileBackgroundColor: Colors.green,
                                )));
                  },
                  child: chatWidget(Colors.green, 'Rahul', 'Hello')),
              Utils().verticalDivider(),
              InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FarmerChatPage(
                                  userName: 'Ajay',
                                  userMessage: 'Hello',
                                  profileBackgroundColor: Colors.redAccent,
                                )));
                  },
                  child: chatWidget(Colors.redAccent, 'Ajay', 'Hello')),
            ],
          ),
        ),
      ),
    );
  }
}
