import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class FarmerChatPage extends StatefulWidget {
  String userName;
  String userMessage;
  Color profileBackgroundColor;
  FarmerChatPage(
      {super.key,
      required this.userName,
      required this.userMessage,
      required this.profileBackgroundColor});

  @override
  State<FarmerChatPage> createState() => _FarmerChatPageState();
}

class _FarmerChatPageState extends State<FarmerChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: widget.profileBackgroundColor,
              child: const Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
            sizedBox(0, 8),
            Text(widget.userName,
                style: Theme.of(context).textTheme.headlineSmall),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: widget.profileBackgroundColor,
                      child: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                    sizedBox(0, 4),
                    Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          widget.userMessage,
                        ),
                      ),
                    )
                  ],
                ),
                sizedBox(10, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 50,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          'Hi!',
                        ),
                      ),
                    ),
                    sizedBox(0, 4),
                    CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: '  Type a message',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      sizedBox(0, 4),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
