import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

Widget questionCard(
    String problemImage, String problemName, String problemDescription) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Image.asset('images/$problemImage'),
      sizedBox(4, 0),
      Text(problemName, style: const TextStyle(fontSize: 20)),
      //sizedBox(2, 0),
      Text(problemDescription, style: const TextStyle(fontSize: 16)),
    ],
  );
}
