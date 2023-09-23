import 'package:flutter/material.dart';

class ViewDetailedImage extends StatefulWidget {
  String problemImage;
  ViewDetailedImage({super.key, required this.problemImage});

  @override
  State<ViewDetailedImage> createState() => _ViewDetailedImageState();
}

class _ViewDetailedImageState extends State<ViewDetailedImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: InteractiveViewer(
                clipBehavior: Clip.none,
                child: Image.asset('images/${widget.problemImage}'))));
  }
}
