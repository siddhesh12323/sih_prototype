import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih_prototype/screens/farmer_question_page.dart';
import 'package:sih_prototype/screens/question_card.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

import 'farmer_ask_page.dart';

class FarmerHomeScreen extends StatefulWidget {
  const FarmerHomeScreen({super.key});

  @override
  State<FarmerHomeScreen> createState() => _FarmerHomeScreenState();
}

class _FarmerHomeScreenState extends State<FarmerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 86,
          automaticallyImplyLeading: false, // hides leading widget
          title: Text('Hi Farmer',
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.green,
              child: const Icon(
                Icons.person,
                color: Colors.black,
              ),
            ),
            sizedBox(0, 10)
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return index == 0
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 12),
                          child: Text('Questions Asked',
                              style: Theme.of(context).textTheme.headlineSmall),
                        )
                      : Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FarmerQuestionDetailPage(
                                              problemName:
                                                  'Plant $index Problem',
                                              problemDescription:
                                                  'Plant $index Problem Description',
                                              problemImage:
                                                  'plant$index.jpg')));
                            },
                            child: questionCard(
                                'plant$index.jpg',
                                'Plant $index Problem',
                                'Plant $index Problem Description'),
                          ),
                        );
                })),
        floatingActionButton: SizedBox(
          width: 140,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/farmeraskpage');
            },
            child: Text('ASK QUESTION'),
            isExtended: true,
          ),
        ),
      ),
    );
  }
}
