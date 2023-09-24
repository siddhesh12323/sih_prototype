import 'package:flutter/material.dart';
import 'package:sih_prototype/firebase_services/splash_services.dart';
import 'package:sih_prototype/screens/sizedbox.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Kisan Sahayata', style: TextStyle(fontSize: 25)),
          sizedBox(20, 0),
          CircularProgressIndicator()
        ],
      ),
    ));
  }
}
