import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sih_prototype/screens/expert_chat_home.dart';
import 'package:sih_prototype/screens/expert_question_page.dart';
import 'package:sih_prototype/screens/question_card.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class ExpertHomeScreenNav extends StatefulWidget {
  const ExpertHomeScreenNav({super.key});

  @override
  State<ExpertHomeScreenNav> createState() => _ExpertHomeScreenNavState();
}

class _ExpertHomeScreenNavState extends State<ExpertHomeScreenNav> {
  final screens = [
    ExpertHomeScreen(),
    ExpertChatHome(),
  ];
  int index1 = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(indicatorColor: Colors.blue.shade100),
          child: NavigationBar(
            selectedIndex: index1,
            onDestinationSelected: (index1) {
              setState(() {
                this.index1 = index1;
              });
            },
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_outlined),
                selectedIcon: Icon(Icons.chat),
                label: 'Chat',
              ),
            ],
          ),
        ),
        body: screens[index1],
      ),
    );
  }
}

class ExpertHomeScreen extends StatefulWidget {
  const ExpertHomeScreen({super.key});

  @override
  State<ExpertHomeScreen> createState() => _ExpertHomeScreenState();
}

class _ExpertHomeScreenState extends State<ExpertHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 86,
          automaticallyImplyLeading: false, // hides leading widget
          title: Text('Hi Expert',
              style: Theme.of(context).textTheme.headlineMedium),
          actions: [
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profilepage');
              },
              child: CircleAvatar(
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
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
                                'Plant $index Problem Description',
                                MediaQuery.of(context).size.width - 32,
                                ((9 / 16) *
                                    (MediaQuery.of(context).size.width - 32))),
                          ),
                        );
                })));
  }
}
