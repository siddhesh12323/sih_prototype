import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    if (user != null) {
      Timer(Duration(seconds: 2), () {
        Navigator.pushNamed(context, '/farmerhome');
      });
    } else {
      Timer(Duration(seconds: 2), () {
        Navigator.pushNamed(context, '/login');
      });
    }
  }
}
