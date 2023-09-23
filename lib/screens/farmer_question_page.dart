import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class FarmerQuestionDetailPage extends StatefulWidget {
  String problemName;
  String problemDescription;
  String problemImage;
  FarmerQuestionDetailPage(
      {super.key,
      required this.problemName,
      required this.problemDescription,
      required this.problemImage});

  @override
  State<FarmerQuestionDetailPage> createState() =>
      _FarmerQuestionDetailPageState();
}

class _FarmerQuestionDetailPageState extends State<FarmerQuestionDetailPage> {
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
              Image.asset('images/${widget.problemImage}'),
              sizedBox(20, 0),
              Text(widget.problemDescription,
                  style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
