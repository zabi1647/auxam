import 'package:auxam/student/home_page.dart';
import 'package:auxam/teacher/teacher_homepage.dart';
import 'package:auxam/utils/utlities.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthManager {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successful login, get the user information from Firestore
      await getUserTypeAndNavigate(userCredential.user!.uid, context);
    } catch (e) {
      Utils().Toastmessage(e.toString());
      // Handle login failure, show an error message, etc.
    }
  }

  Future<void> getUserTypeAndNavigate(String uid, BuildContext context) async {
    try {
      // Reference to the user's document in Firestore
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
    } catch (e) {
      Utils().Toastmessage(e.toString());
    }
  }
}
