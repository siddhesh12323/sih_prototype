import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih_prototype/screens/expert_question_page.dart';
import 'package:sih_prototype/screens/question_card.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class ExpertHomeScreen extends StatefulWidget {
  const ExpertHomeScreen({super.key});

  @override
  State<ExpertHomeScreen> createState() => _ExpertHomeScreenState();
}

class _ExpertHomeScreenState extends State<ExpertHomeScreen> {
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
            title: Text('Hi Expert',
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
                            child: Text('Recent Questions',
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          )
                        : Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ExpertQuestionDetailPage(
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
                  }))),
    );
  }
}
