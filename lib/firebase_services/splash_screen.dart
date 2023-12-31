import 'dart:async';

import 'package:auxam/view/home_page.dart';
import 'package:auxam/view/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServies {
  void isLogin(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      });
    }
  }
}
