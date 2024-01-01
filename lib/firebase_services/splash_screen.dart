import 'dart:async';

import 'package:auxam/student/home_page.dart';
import 'package:auxam/auth/login_page.dart';
import 'package:auxam/teacher/teacher_homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServies {
  void isLogin(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    final user = _auth.currentUser;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    if (user != null) {
      Timer(const Duration(seconds: 3), () async {
        String uid = user.uid;
        DocumentSnapshot userSnapshot =
            await _firestore.collection('users').doc(uid).get();

        if (userSnapshot.exists) {
          // Get the user type from the document data
          String userType = userSnapshot['userType'];

          // Navigate to the appropriate home page
          if (userType.toLowerCase() == 'teacher') {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => TeacherHomePage()),
                (route) => false);
          } else {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => StudentHomePage()),
                (route) => false);
          }
        }
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
