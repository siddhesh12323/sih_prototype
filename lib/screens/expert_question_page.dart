import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';
import 'package:sih_prototype/screens/view_image.dart';

class ExpertQuestionDetailPage extends StatefulWidget {
  String problemName;
  String problemDescription;
  String problemImage;
  ExpertQuestionDetailPage(
      {super.key,
      required this.problemName,
      required this.problemDescription,
      required this.problemImage});

  @override
  State<ExpertQuestionDetailPage> createState() =>
      _ExpertQuestionDetailPageState();
}

class _ExpertQuestionDetailPageState extends State<ExpertQuestionDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 86,
        title: Text(widget.problemName,
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ViewDetailedImage(
                          problemImage: widget.problemImage);
                    }));
                  },
                  child: Image.asset('images/${widget.problemImage}')),
              sizedBox(20, 0),
              Text(widget.problemDescription,
                  style: const TextStyle(fontSize: 16)),
              sizedBox(20, 0),
              InkWell(
                onTap: () {
                  //! NAVIGATE TO ANSWER QUESTION PAGE
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
                      'ANSWER QUESTION',
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
