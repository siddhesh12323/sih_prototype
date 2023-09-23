import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class FarmerAskPage extends StatefulWidget {
  const FarmerAskPage({super.key});

  @override
  State<FarmerAskPage> createState() => _FarmerAskPageState();
}

class _FarmerAskPageState extends State<FarmerAskPage> {
  TextEditingController _problemNameController = TextEditingController();
  TextEditingController _problemDescriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        title: Text('Ask a Question',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter the name of your question',
                  style: TextStyle(fontSize: 16),
                ),
                TextField(
                  maxLines: 1,
                  controller: _problemNameController,
                  decoration: InputDecoration(
                    hintText: 'Problem Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                sizedBox(30, 0),
                Text(
                  'Add an image of the affected crop',
                  style: TextStyle(fontSize: 16),
                ),
                InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width - 32,
                      height: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border:
                            Border.all(color: Color.fromARGB(255, 59, 59, 59)),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt_outlined,
                                color: Colors.grey, size: 35),
                            Text(
                              ' Add Image',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                sizedBox(30, 0),
                Text(
                  'Enter the description of your question',
                  style: TextStyle(fontSize: 16),
                ),
                TextFormField(
                  maxLines: 10,
                  controller: _problemDescriptionController,
                  decoration: InputDecoration(
                    hintText: 'Problem Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                sizedBox(20, 0),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/postsuccesspage');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 32,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'POST QUESTION',
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
      ),
    );
  }
}
