import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 86, 85, 85),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Widget verticalDivider() {
    return const VerticalDivider(
      color: Color.fromARGB(255, 103, 102, 102),
      thickness: 1,
      width: 20,
    );
  }
}
