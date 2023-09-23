import 'package:flutter/material.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class PostSuccessPage extends StatelessWidget {
  const PostSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Question Posted Successfully!',
                  style: TextStyle(fontSize: 18)),
              sizedBox(20, 0),
              Text('An expert will get back to you soon!',
                  style: TextStyle(fontSize: 18)),
              sizedBox(40, 0),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  'GO HOME',
                  style: TextStyle(color: Colors.blue),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
