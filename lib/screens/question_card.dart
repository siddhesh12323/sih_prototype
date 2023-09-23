import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

Widget questionCard(String problemImage, String problemName,
    String problemDescription, double width, double height) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
          width: width,
          height: height,
          child: Image.asset(
            'images/$problemImage',
            fit: BoxFit.fitWidth,
          )),
      sizedBox(4, 0),
      Text(problemName, style: const TextStyle(fontSize: 20)),
      //sizedBox(2, 0),
      Text(problemDescription, style: const TextStyle(fontSize: 16)),
    ],
  );
}
