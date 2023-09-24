import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class ExpertChatPageFake extends StatefulWidget {
  String image;
  String problemName;
  ExpertChatPageFake({
    super.key,
    required this.image,
    required this.problemName,
  });

  @override
  State<ExpertChatPageFake> createState() => _ExpertChatPageFakeState();
}

class _ExpertChatPageFakeState extends State<ExpertChatPageFake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
            sizedBox(0, 8),
            Text('Ranjit', style: Theme.of(context).textTheme.headlineSmall),
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
                      backgroundColor: Colors.green,
                      child: const Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    ),
                    sizedBox(0, 4),
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      height: ((12 / 16) *
                          (MediaQuery.of(context).size.width - 100)),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
                            child: Text(
                              widget.problemName,
                            ),
                          ),
                          sizedBox(4, 0),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/${widget.image}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
                            hintText: '  Type your advice',
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
