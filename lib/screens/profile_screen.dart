import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String language = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Container(
                height: 110,
                width: MediaQuery.of(context).size.width - 32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select Language', style: TextStyle(fontSize: 16)),
                    sizedBox(10, 0),
                    DropdownMenu(
                      hintText: 'Select your role',
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 'English', label: 'English'),
                        DropdownMenuEntry(value: 'Hindi', label: 'Hindi'),
                        DropdownMenuEntry(value: 'Marathi', label: 'Marathi'),
                      ],
                      onSelected: (value) {
                        setState(() {
                          switch (value) {
                            case 'English':
                              language = 'English';
                              break;
                            case 'Hindi':
                              language = 'Hindi';
                              break;
                            case 'Marathi':
                              language = 'Marathi';
                              break;
                            default:
                          }
                        });
                      },
                      width: MediaQuery.of(context).size.width - 40,
                    ),
                  ],
                ),
              ),
              sizedBox(10, 0),
              InkWell(
                onTap: () {
                  //! LOG OUT
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 32,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      'LOG OUT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              sizedBox(30, 0),
            ],
          ),
        ),
      ),
    );
  }
}
